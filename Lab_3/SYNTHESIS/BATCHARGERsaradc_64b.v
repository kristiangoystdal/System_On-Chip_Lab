module BATCHARGERsaradc_64b (
       output reg [7:0] vbat, // 8 bits data with battery voltage conversion result
       output reg [7:0] ibat, // 8 bits data with battery current conversion result
       output reg [7:0] tbat, // 8 bits data with battery temperature conversion result	
       output 		vtok, // flags that voltage and temperature were measured
       input [63:0] 	vref, // voltage reference to be used as full scale value (vref = 0.5V)
       input [63:0] 	ibias1u, // current reference to be used in analog circuits (iref = 1uA))			     
       input [63:0] 	vbattemp, // temperature normalized value: -40 to 125 fitted in the range 0V to vref
       input [63:0] 	vbatvolt, // battery voltage 
       input [63:0] 	vbatcurr, // battery current scaled down 1000x multiplied by R=Vref/C   (C is the battery capacity)
       input 		imeasen, // enables battery current periodic monitor
       input 		vmeasen, // enables battery voltage periodic monitor 
       input 		tmeasen, // enables battery temperature periodic monitor	              
       input 		en, // enables the block
       input 		clk, // state machine clock
       input 		rstz,
       inout [63:0] 	avdd, // analog supply to other modules
       inout [63:0] 	dvdd, // digital supply to other modules
       inout [63:0] 	dgnd, // digital ground
       inout [63:0] 	agnd  // analog ground
);    // system reset


   
   parameter tempch=0, currch=1, voltch=2, noch=3;    // input multiplexer states
   parameter endstate=0, bit7=12, bit6=4, bit5=5, bit4=7, bit3=6, bit2=2, bit1=3, bit0=1, start=8;  // Sucessive Aproximations Register (SAR) ADC states


   

   reg [3:0]            state, nxt_state;
   reg [1:0] 		inputch, nxt_inputch;
   wire 		eoc; // signals that a conversion cycle has ended
   wire 		ready; // signals that a conversion cycle can start
		

   wire [63:0] 		adcinput;   // adc input. Multiplexed to measure temperature, voltage and current
   wire [63:0] 		vbatvoltdiv; // battery voltage devided by 10

   
   real rl_adcinput;     // identical data to adcinput but as a real number
   real rl_remaining;    // remaining part to codify in binary
   real rl_vref;         // converted value of vref to real 
   real rl_vbatcurr;     // real value proportional to battery current =  k*Ibat*Rsens; 0.1C -> vref/2
   real rl_vbatvolt;
   real rl_vbatvoltdiv;
   
   
   reg 	vok, tok;
 

   reg [7:0] 		data;  // adc output buffer
   wire 		resetz;  // combined reset with rstz and en

   assign vtok = vok & tok;
   assign resetz = rstz & en;

 

   initial assign rl_vbatvoltdiv = rl_vbatvolt / 10.0;  // resistive divider for battery voltage -> 10:1 
   
   
   assign adcinput[63:0]  = (inputch==tempch) ? vbattemp[63:0] : ((inputch==currch) ? vbatcurr[63:0] : vbatvoltdiv[63:0]) ;
   

   // input channel selection logic: toggles between inputs and updates tbat[7:0], vbat[7:0] and ibat[7:0] when conversion ends (eoc is set to "1" during 1 clock period)
   
   always @ (inputch or imeasen or vmeasen or tmeasen or ready)  // channel selection only changes if eoc == 1
     // eoc changes @ posedge of clk, updating tbat, ibat and vbat @ posedge; input mux changes position @ negedge
     begin 
	case (inputch)
	  tempch: begin
	     if (ready == 1'b1) begin           // if temperature conversion has finished
		if (imeasen) nxt_inputch = currch;
		else if (vmeasen) nxt_inputch = voltch;
		else if (tmeasen) nxt_inputch = tempch;
		else nxt_inputch = noch;
		
	     end
	     else nxt_inputch = tempch;
	  end
	  currch: begin
	     if (ready == 1'b1) begin           // if current conversion has finished
		if (vmeasen) nxt_inputch = voltch;
		else if (tmeasen) nxt_inputch = tempch;
		else if (imeasen) nxt_inputch = currch;
		else nxt_inputch = noch;		
	     end
	     else nxt_inputch = currch;	     
	  end
	  voltch: begin
	     if ( ready == 1'b1) begin           // if voltage conversion has finished
		if (tmeasen) nxt_inputch = tempch;
		else if (imeasen) nxt_inputch = currch;
		else if (vmeasen) nxt_inputch = voltch;
		else nxt_inputch = noch;		
	     end
	     else nxt_inputch = voltch;
	  end
	  noch: begin
	     if (tmeasen) nxt_inputch = tempch;
	     else if (imeasen) nxt_inputch = currch;
	     else if (vmeasen) nxt_inputch = voltch;
	     else nxt_inputch = noch;		
	     
	  end
	  default: nxt_inputch = noch;

	endcase // case (inputch)
	
     end // always @ (inputch or imeasen or vmeasen or tmeasen or eoc)
   
   

   always @(negedge clk or negedge resetz)
     begin
	if (resetz==0) inputch = noch;
	else inputch = nxt_inputch;
     end
   
   // end of input channel selection logic




   // sar adc logic: converts adcinput[63:0] real value to data[7:0] and sets eoc=1 during one clock cycle

 always @ (state or inputch)  // channel selection only changes if eoc == 1
     // eoc changes @ posedge of clk, updating tbat, ibat and vbat @ posedge; input mux changes position @ negedge
     begin 
	case (state)
	  start: begin
	     if (inputch==noch) nxt_state = start;           // no conversion required
		else begin
		nxt_state = bit7;
		end	
	  end	
	  bit7: begin
	        if (rl_adcinput * 2 > rl_vref) begin
		   data[7] = 1;	
		   rl_remaining = (rl_adcinput * 2 - rl_vref) * 2;    // sample and hold rl_adcinput
		   end		
		else begin
		   data[7] = 0;	
		   rl_remaining = (rl_adcinput) * 4;
		   end	
	        nxt_state = bit6;	     
	  end
	  bit6: begin
	        if (rl_remaining > rl_vref) begin
		   data[6] = 1;	
		   rl_remaining = (rl_remaining - rl_vref) * 2;
		   end		
		else begin
		   data[6] = 0;	
		   rl_remaining = (rl_remaining) * 2;
		   end	
	      nxt_state = bit5;	     
	  end
	  bit5: begin
	        if (rl_remaining > rl_vref) begin
		   data[5] = 1;	
		   rl_remaining = (rl_remaining - rl_vref) * 2;
		   end		
		else begin
		   data[5] = 0;	
		   rl_remaining = (rl_remaining) * 2;
		   end	
	      nxt_state = bit4;	     
	  end
	  bit4: begin
	        if (rl_remaining > rl_vref) begin
		   data[4] = 1;	
		   rl_remaining = (rl_remaining - rl_vref) * 2;
		   end		
		else begin
		   data[4] = 0;	
		   rl_remaining = (rl_remaining) * 2;
		   end	
	      nxt_state = bit3;	     
	  end
	  bit3: begin
	        if (rl_remaining > rl_vref) begin
		   data[3] = 1;	
		   rl_remaining = (rl_remaining - rl_vref) * 2;
		   end		
		else begin
		   data[3] = 0;	
		   rl_remaining = (rl_remaining) * 2;
		   end	
	      nxt_state = bit2;	     
	  end
	  bit2: begin
	        if (rl_remaining > rl_vref) begin
		   data[2] = 1;	
		   rl_remaining = (rl_remaining - rl_vref) * 2;
		   end		
		else begin
		   data[2] = 0;	
		   rl_remaining = (rl_remaining) * 2;
		   end	
	      nxt_state = bit1;	     
	  end
	  bit1: begin
	        if (rl_remaining > rl_vref) begin
		   data[1] = 1;	
		   rl_remaining = (rl_remaining - rl_vref) * 2;
		   end		
		else begin
		   data[1] = 0;	
		   rl_remaining = (rl_remaining) * 2;
		   end	
	      nxt_state = bit0;	     
	  end
	  bit0: begin
	        if (rl_remaining > rl_vref) begin
		   data[0] = 1;	
		   end		
		else begin
		   data[0] = 0;	
		   end	
	      nxt_state = endstate;	     
	  end
	  endstate: begin
	     nxt_state = start;
             if (inputch == currch) ibat[7:0] = data[7:0];
             if (inputch == voltch) begin 
		vbat[7:0] = data[7:0];
		vok = 1'b1;
	     end
             if (inputch == tempch) begin
		tbat[7:0] = data[7:0];	     
		tok = 1'b1;
	     end
	  end

	  default: nxt_state = start;

	endcase // case (state)
	
     end // always @ (state or inputch)
   
   assign ready = (state == start);
   assign eoc = (state == endstate);
   

   always @(posedge clk or negedge resetz)
     begin
	if (resetz==0) begin
	   state = start;
	   vok = 1'b0;
	   tok = 1'b0;
	end
	else state = nxt_state;
     end



   // end of sar adc logic



//-- Signal conversion ------------------

//   initial assign rl_var1    = $bitstoreal (var1_64b);
//   assign var2_64b           = $realtobits (rl_var2);

   assign vbatvoltdiv     = $realtobits (rl_vbatvoltdiv);

   initial assign rl_vbatcurr = $bitstoreal (vbatcurr);
   initial assign rl_vref = $bitstoreal (vref);
   initial assign rl_adcinput = $bitstoreal (adcinput);
   initial assign rl_vbatvolt = $bitstoreal (vbatvolt);
  
   
endmodule // saradc


    

