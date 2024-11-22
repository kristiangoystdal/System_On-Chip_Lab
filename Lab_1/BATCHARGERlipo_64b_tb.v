`timescale 1 ns/10 ps


module BATCHARGERlipo_64b_tb;
   

   wire [63:0]       vbat;     // battery voltage (V)
   wire [63:0] 	     ibat;     // battery current (A)
   wire [63:0] 	     vtbat;    // Battery temperature

   real 	     rl_ibat, rl_vbat, rl_vtbat;
   

BATCHARGERlipo uut(
		   .vbat(vbat),     // battery voltage (V)
		   .ibat(ibat),     // battery current (A)
		   .vtbat(vtbat)    // Battery temperature
		   );
   


initial
  begin
     rl_ibat = 0.0;
     #1000  rl_ibat = 1.75;
     #10000000  rl_ibat = 0.0;     
     #1000 $finish;
     
  end
   
   

//-- Signals conversion ---------------------------------------------------
   initial assign rl_vbat = $bitstoreal(vbat);
   initial assign rl_vtbat = $bitstoreal(vtbat);

   assign ibat = $realtobits(rl_ibat);   
   
endmodule
