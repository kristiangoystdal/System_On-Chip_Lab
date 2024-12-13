`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////

module counter4bit_tb;

	reg clk, enable, count_dir, reset;
	wire [3:0] count;
        integer 	   i;
   
	
	counter4bit uut (                   // creates instance uut of module counter4bit
			.clk(clk),
			.enable(enable),
			.count_dir(count_dir),
			.reset(reset),
			.count(count)
			);

	initial                // all assignments inside the initial block are executed sequentialy and only once
		begin
		 clk=0;        // initial value for the clk signal
		 enable = 0;
		 reset = 0;
		 count_dir = 1;
		end
   
	always
		#5 clk = !clk;  // clk signal changes logic value each half period

	initial                 // this is the main initial block that will define the simulation stimulus for the counter. It ends with a $finish command to end the simulation
	  	begin
		 #03 reset=1;
		   @(negedge clk);    //waits for negative edge to enable the counter since the counter increments in the positive edge  
		 #03 reset=0; enable=1;
		   for ( i=0; i<15;i=i+1)  begin
		      if (count != i) begin
			 $display("Error: count=%d, expected %d. Exiting...", count, i);
			 $finish;
		      end
		      $display("Tested count=%d ok", i);
		      @(negedge clk);    // waits for the negative edge of clk to loop back to the next value of "i". The counter changes at the positive edge, checks are performed at the negative edge of clk
		   end
		   
		 count_dir=0;   // testing conting down
		   
		   for ( i=15; i>=0;i=i-1)  begin
		      if (count != i) begin
			 $display("Error: count=%d, expected %d. Exiting...", count, i);
			 $finish;
		      end
		      $display("Tested count=%d ok", i);
		      @(negedge clk);    
		 end
		 enable=0;
		 enable=1;
		$display("ALL TESTS PASSED");
		 #50 $finish;	
		end 
   			
endmodule
