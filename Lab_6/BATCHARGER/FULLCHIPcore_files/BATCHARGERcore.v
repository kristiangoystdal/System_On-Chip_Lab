

module BATCHARGERcore (

		       output iforcedbat, // output current to battery
		       input  vsensbat, // voltage sensed (obtained at the battery as "voltage from iforcedbat integration" + ESR * iforcedbat )  
		       input  vin, // input voltage; must be at least 200mV higher than vsensbat to allow iforcedbat > 0
		       input  vbattemp, //temperature normalized value: -40 to 125 fitted in the range 0V to vref
		       input   en,// enables the module
		       input  [3:0] sel, // battery capacity selection bits: b[3,2,1,0] weights are 400,200,100,50 mAh + offset of 50mAh covers the range from 50 up to 800 mAh 
		       inout   dvdd, // digital supply
		       inout   dgnd, // digital ground
		       inout   pgnd  // power ground		       
		       );   
   

   

   wire        vbatcurr;    // iforcedbat value scaled 1000:1 * R=Vref/C
   wire [7:0]  vbat; // 8 bits data with battery voltage conversion result
   wire [7:0]  ibat; // 8 bits data with battery current conversion result
   wire [7:0]  tbat; // 8 bits data with battery temperature conversion result              
   wire        imeasen; // enables battery current periodic monitor
   wire        vmeasen; // enables battery voltage periodic monitor 
   wire        tmeasen; // enables battery temperature periodic monitor                      
   wire        cc; // enables constant current charging mode
   wire        tc; // enables trickle  current charging mode 
   wire        cv; // enables constant voltage charging mode
   wire        vtok;



		       
 

   

   wire  avdd; // analog supply of internal modules
   wire  agnd; // analog ground
   wire  ibias1ua; // biasing current for power block
   wire  ibias1ub; // biasing current for sar adc
   wire  vrefa; // power block reference voltage
   wire  vrefb; // sar adc reference voltage      
			    
 
   wire [7:0] vcutoff; // constant from OTP: voltage threshold for exiting trickle mode; vcutoff = Vcutof_dec * 255/5 = 51 * Vcutof_dec
   wire [7:0] vpreset; // constant from OTP: voltage for constant voltage mode; vpreset = Vpreset_dec * 255/5
   wire [7:0] iend; // charge current to be used as "end of charging" end criteria 
   wire [7:0] icc; // constant current mode output current value 
   wire [7:0] itc; //  trickle current mode output current value 
   wire [7:0] vcv; // constant voltage target value vcv = Vtarget*255/5 = 51*Vtarget

   wire [7:0] tempmin; // constant from OTP: minimum temperature ; see tbat for scaling
   wire [7:0] tempmax; // constant from OTP: maximum temperature ; see tbat for scaling
   wire [7:0] tmax; // constant from OTP: maximum charge time; unit is 2^time_div_bits clock cycles 

   wire       tiedown;
   

   
   parameter vcutoffpar = 8'b1001_1001;  // constant from OTP: voltage threshold for exiting trickle mode; vcutoff = Vcutof_dec * 255/5 = 51 * Vcutof_dec Ex: 3.0V - 1001_1001
   parameter vpresetpar = 8'b1100_0001; // constant from OTP: voltage for constant voltage mode; vpreset = Vpreset_dec * 255/5 = 51 * Vpreset_dec Ex: 3.8V - 1100_0001
   parameter iendpar = 8'b0000_0010 ; // 0.01C -> charge current to be used as "end of charging" end criteria  = (Vadc/Vref)*255 = (Rsens*I/Vref)*255 = ((Vref/C)*I/Vref)*255 = (I/C)*255 = 0.01*255  
   parameter itcpar = 8'b0001_1001; // 0.1C -> Trickle charge current = (Vadc/Vref)*255 = (Rsens*I/Vref)*255 = ((Vref/C)*I/Vref)*255 = (I/C)*255 = 0.1*255  
   parameter vcvpar = 8'b1101_0110; // 4,2V 
   parameter iccpar = 8'b0111_1111; // 0.5C -> constant current mode output current value = (Vadc/Vref)*255 = (Rsens*I/Vref)*255 = ((Vref/C)*I/Vref)*255 = (I/C)*255 = 0.5*255  

   parameter tempminpar = 8'b0011_1101 ; // constant from OTP: minimum temperature ; see tbat for scaling; Ex. 0ºC
   parameter tempmaxpar = 8'b1000_0011 ; // constant from OTP: maximum temperature ; see tbat for scaling; Ex. 45ºC
   parameter tmaxpar = 8'b1111_1111 ; // constant from OTP: maximum charge time; unit is 2^time_div_bits clock cycles 


   assign vcutoff = vcutoffpar;
   assign vpreset = vpresetpar;
   assign iend = iendpar;
   assign icc = iccpar;
   assign itc = itcpar;
   assign vcv = vcvpar;
   
   assign tempmin = tempminpar;
   assign tempmax = tempmaxpar;
   assign tmax = tmaxpar;

   assign tiedown = 1'b0;
   
   

BATCHARGERbg BATCHbg (
		       .vin(vin), // input voltage; must be at least 200mV higher than vsensbat to allow iforcedbat > 0
		       .ibias1ua(ibias1ua), // reference current for power  (ibias1u = 1uA)
		       .ibias1ub(ibias1ub), // reference current for adc  (ibias1u = 1uA)			 
		       .vrefa(vrefa), // voltage reference for power block (vref = 0.5V)
		       .vrefb(vrefb), // voltage reference for adc (vref = 0.5V)			  
		       .en(en), // @ vin, enables the module
		       .endvdd(endvdd), // identical to en, but at dvdd voltage level 
		       .clk(clk), // digital state machine clock
		       .rstz(rstz), // reset, active "0" (thats the reason for the "z" at the end)
		       .avdd(avdd), // analog supply to other modules
		       .dvdd(dvdd), // digital supply to other modules
		       .dgnd(dgnd), // digital ground
		       .agnd(agnd) // analog ground
		       );   
   

   
BATCHARGERpower BATCHpower (
				.iforcedbat(iforcedbat),
				.vbatcurr(vbatcurr),
				.vsensbat(vsensbat),
				.vref(vrefa),
				.vin(vin),
				.ibias1u(ibias1ua),
				.icc(icc),
				.itc(itc),
				.vcv(vcv),
				.cc(cc),
				.tc(tc),
				.cv(cv),
				.en(endvdd),
				.sel(sel),
				.avdd(avdd), // analog supply to other modules
				.dvdd(dvdd), // digital supply to other modules
				.dgnd(dgnd), // digital ground
				.agnd(agnd), // analog ground
				.pgnd(pgnd) // power ground
				); 
			    
BATCHARGERsaradc  BATCHsaradc (
				   .vbat(vbat),
				   .ibat(ibat),     
				   .tbat(tbat),
				   .vref(vrefb),
				   .vtok(vtok),
				   .vbattemp(vbattemp), 
				   .vbatvolt(vsensbat),     // voltage sensed at the battery 
				   .vbatcurr(vbatcurr),      // mirrored iforcedbat current 1000:1 * (R=Vref/C)
				   .imeasen(imeasen), 
				   .vmeasen(vmeasen), 
				   .tmeasen(tmeasen),
				   .en(endvdd),
				   .clk(clk), 
				   .rstz(rstz), 
				   .ibias1u(ibias1ub),
				   .avdd(avdd), // analog supply to other modules
				   .dvdd(dvdd), // digital supply to other modules
				   .dgnd(dgnd), // digital ground
				   .agnd(agnd) // analog ground
				   );

  
BATCHARGERctr BATCHctr(   
			  .cc(cc), 
			  .tc(tc), 
			  .cv(cv),
			  .vtok(vtok),
			  .en(endvdd),
			  .imonen(imeasen), 
			  .vmonen(vmeasen), 
			  .tmonen(tmeasen), 
			  .vbat(vbat), 
			  .ibat(ibat), 
			  .tbat(tbat), 
			  .vcutoff(vcutoff), 
			  .vpreset(vpreset), 
			  .tempmin(tempmin), 
			  .tempmax(tempmax), 
			  .tmax(tmax), 
			  .iend(iend), 
			  .clk(clk), 
			  .rstz(rstz),
			  .dvdd(endvdd), // digital supply single bit
			  .dgnd(tiedown) // digital ground singlebit
			  );

 
       



   
endmodule 



    

