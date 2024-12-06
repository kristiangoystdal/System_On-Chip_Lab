`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////

module counter4bit_tb;

	reg clk, enable, count_dir, reset;
	wire [3:0] count;
	
	counter4bit uut (
			.clk(clk),
			.enable(enable),
			.count_dir(count_dir),
			.reset(reset),
			.count(count)
			);

	initial 
		begin
		 clk=0;
		 enable = 0;
		 reset = 0;
		 count_dir = 1;
		end
   
	always
		#5 clk = !clk; 
//		#10 clk = !clk; 

	initial
	  	begin
		 #03 reset=1;
		 #07 reset=0;
		 #20 enable=1;
		 #30 count_dir=0;
		 #30 enable=0;
		 #20 enable=1;
		 #50 $finish;	
		end 
   			
endmodule
