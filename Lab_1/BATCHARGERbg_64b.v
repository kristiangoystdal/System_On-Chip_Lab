`timescale 1ns / 1ps


module BATCHARGERbg_64b (

		       input [63:0]  vin, // input voltage; must be at least 200mV higher than vsensbat to allow iforcedbat > 0
		       output [63:0] ibias1ua, // reference current  (ibias1u = 1uA)
		       output [63:0] ibias1ub, // reference current  (ibias1u = 1uA)			 
		       output [63:0] vrefa, // voltage reference (vref = 0.5V)
		       output [63:0] vrefb, // voltage reference (vref = 0.5V)			 
		       input 	     en, // @ vin, enables the module
		       output 	     endvdd, // identical to en, but at dvdd voltage level 
		       output reg    clk, // digital state machine clock
		       output 	     rstz, // reset, active "0" (thats the reason for the "z" at the end)

		       inout [63:0]  avdd, // analog supply to other modules
		       inout [63:0]  dvdd, // digital supply to other modules
		       inout [63:0]  dgnd, // digital ground
		       inout [63:0]  agnd // analog ground
		       );   
   


   real rl_vrefa;            // converted value of vref to real
   real rl_vrefb;            // converted value of vref to real   
   real rl_vin;              // converted value of vin to real 
   real rl_ibias1ua;         // converted value of ibias1u to real
   real rl_ibias1ub;         // converted value of ibias1u to real    
   real rl_avdd;
   real rl_dvdd;
   real rl_agnd;
   real rl_dgnd;

   wire supply_ok;
   wire vin_ok;
   wire dvdd_ok;
   
   parameter DVDDMIN = 0.7;
   parameter VINMIN = 2.5;
   parameter VINMAX = 5.5;
   parameter AVDDVAL = 1.8;
   parameter DVDDVAL = 1.2;
   parameter IBIAS = 1e-6;
   parameter VREFVAL = 0.5;
   

   assign vin_ok = (rl_vin < VINMAX) && (rl_vin > VINMIN) ? 1'b1 : 1'b0;
   assign dvdd_ok = (rl_dvdd > DVDDMIN) ? 1'b1 : 1'b0;   
   assign #(30, 0) supply_ok = en & vin_ok;
   assign #(20, 0) endvdd = supply_ok & dvdd_ok;
   assign #(1000, 0) rstz = dvdd_ok;
   
   
   
   initial assign rl_dgnd = rl_agnd;
   initial assign rl_avdd = supply_ok ? AVDDVAL : 0.0;
   initial assign rl_dvdd = supply_ok ? DVDDVAL : 0.0;   
   initial assign rl_ibias1ua = supply_ok ? IBIAS : 0.0;
   initial assign rl_ibias1ub = supply_ok ? IBIAS : 0.0;      
   initial assign rl_vrefa = supply_ok ? VREFVAL : 0.0;
   initial assign rl_vrefb = supply_ok ? VREFVAL : 0.0;   
   
   initial
     clk=0;

   always
     #100 clk = dvdd_ok ? (~clk) : 1'b0;
	
   
     
   
//-- Signal conversion ------------------

//   initial assign rl_var1    = $bitstoreal (var1_64b);
//   assign var2_64b           = $realtobits (rl_var2);
   
   assign vrefa = $realtobits (rl_vrefa);
   assign vrefb = $realtobits (rl_vrefb);   
   assign ibias1ua = $realtobits (rl_ibias1ua);
   assign ibias1ub = $realtobits (rl_ibias1ub);
   assign avdd = $realtobits (rl_avdd);
   assign dvdd = $realtobits (rl_dvdd);
   assign dgnd = $realtobits (rl_dgnd);

   
   initial assign rl_vin = $bitstoreal (vin);
   initial assign rl_agnd = $bitstoreal (agnd);

    
endmodule // BATCHARGER_64b



    

