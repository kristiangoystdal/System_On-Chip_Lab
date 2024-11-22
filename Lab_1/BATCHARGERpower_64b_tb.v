`timescale 1ns / 1ps


module BATCHARGERpower_64b_tb;


   wire [63:0] iforcedbat; // output current to battery
   wire [63:0] vbatcurr;    // ibat value scaled 1000:1 * (R=Vref/C)
   wire [63:0] vsensbat; // voltage sensed (obtained at the battery as "voltage from iforcedbat integration" + ESR * iforcedbat )		     
   wire [63:0] vref; // voltage reference (vref = 0.5V)
   wire [63:0] vin; // input voltage; must be at least 200mV higher than vsensbat to allow iforcedbat > 0
   wire [63:0] ibias1u; // reference current	(ibias1u = 1uA)
   reg [7:0]   icc; // constant current mode output current value icc=8'b1111_1111 -> iforced = 2A; ex: icc=8'b11011111 -> iforced = 1.75A (0.5C)
   reg [7:0]   itc; //  trickle current mode output current value itc=8'b1111_1111 -> iforced = 2A; ex: itc=8'b00101100 -> iforced = 0.35A (0.1C)
   reg [7:0]   vcv; // constant voltage target value vcv = Vtarget*255/5 = 51*Vtarget
   reg 	       cc; // enables constant current charging mode
   reg 	       tc; // enables trickle  current charging mode 
   reg 	       cv; // enables constant voltage charging mode
   reg 	       en; // enables the module
   reg [3:0]   sel;
   wire [63:0] dvdd;  // digital supply
   wire [63:0] dgnd;  // digital ground
   wire [63:0] avdd;  // analog supply
   wire [63:0] agnd;  // analog ground
   wire [63:0] pgnd;  // power ground
   real        rl_avdd;
   real        rl_dvdd;
   real        rl_agnd;
   real        rl_dgnd;
   real        rl_pgnd;     

			    
 
   real rl_vbatcurr;        // vbatcurr real value 
   real rl_vref;         // converted value of vref to real
   real rl_iforcedbat;         // iforcedbat real value
   real rl_vsensbat;         // converted value of vsensbat to real 
   real rl_vin;         // converted value of vin to real 
   real rl_ibias1u;         // converted value of ibias1u to real 

   real rl_icc;
   real rl_itc;
   real rl_vvc;


BATCHARGERpower_64b uut (
			 .iforcedbat(iforcedbat),
			 .vbatcurr(vbatcurr),
			 .vsensbat(vsensbat),
			 .vref(vref),
			 .vin(vin),
			 .ibias1u(ibias1u),
			 .icc(icc),
			 .itc(itc),
			 .vcv(vcv),
			 .cc(cc),
			 .tc(tc),
			 .cv(cv),
			 .en(en),
			 .sel(sel),
                         .avdd(avdd),
                         .dvdd(dvdd),
                         .dgnd(dgnd),
                         .agnd(agnd),
                         .pgnd(pgnd)			 
); 
			    

initial
  begin

     rl_vsensbat = 3.2; 
     rl_vref = 0.5;
     rl_vin = 5.0; 
     rl_ibias1u = 1.0e-6; 
     icc[7:0]=8'b11011111; // constant current mode output current value icc=8'b11011111 -> iforced = 1.75A (0.5C)
     itc[7:0]=8'b00101100; 
     vcv[7:0]=8'b10111100; // 8'b10111100 => 3,7V 
     cc = 1'b0; // enables constant current charging mode
     tc = 1'b0; // enables trickle  current charging mode 
     cv = 1'b0; // enables constant voltage charging mode
     en = 1'b1; // enables the module
     #100 $display("cc=%b, tc=%b, cv=%b, (cv_voltage=3,7V cc=1.75A tc=0,35A) output current is: %f A", cc, tc, cv, rl_iforcedbat);
     cc = 1'b1; // enables constant current charging mode
     tc = 1'b0; // enables trickle  current charging mode 
     cv = 1'b0; // enables constant voltage charging mode
     #100 $display("cc=%b, tc=%b, cv=%b, (cv_voltage=3,7V cc=1.75A tc=0,35A) output current is: %f A", cc, tc, cv, rl_iforcedbat);
     cc = 1'b0; // enables constant current charging mode
     tc = 1'b1; // enables trickle  current charging mode 
     cv = 1'b0; // enables constant voltage charging mode
     #100 $display("cc=%b, tc=%b, cv=%b, (cv_voltage=3,7V cc=1.75A tc=0,35A) output current is: %f A", cc, tc, cv, rl_iforcedbat);
     cc = 1'b0; // enables constant current charging mode
     tc = 1'b0; // enables trickle  current charging mode 
     cv = 1'b1; // enables constant voltage charging mode
     #100 $display("cc=%b, tc=%b, cv=%b, (cv_voltage=3,7V cc=1.75A tc=0,35A) output current is: %f A", cc, tc, cv, rl_iforcedbat);
     
     $finish();
  end


 
       



   
//-- Signal conversion ------------------

//   initial assign rl_var1    = $bitstoreal (var1_64b);
//   assign var2_64b           = $realtobits (rl_var2);
   
   assign vref = $realtobits (rl_vref);
   assign vsensbat = $realtobits (rl_vsensbat);
   assign vin = $realtobits (rl_vin);
   assign ibias1u = $realtobits (rl_ibias1u);
   assign pgnd = $realtobits (rl_pgnd);
   assign avdd               = $realtobits (rl_avdd);
   assign dvdd               = $realtobits (rl_dvdd);
   assign agnd               = $realtobits (rl_agnd);
   assign dgnd               = $realtobits (rl_dgnd);  
   
   initial assign rl_iforcedbat = $bitstoreal (iforcedbat);
   initial assign rl_vbatcurr = $bitstoreal (vbatcurr);   
   
    
endmodule // BATCHARGERpower_64b_tb



    

