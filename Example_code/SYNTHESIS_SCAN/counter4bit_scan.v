`timescale 100ps / 1ps 

////////////////////////////////////////////////////////////////////////////////// 
//
// Company: Instituto Superior Técnico de Lisboa 
// Module Name: counter4bit_scan
// Description: Four bits counter
// 
////////////////////////////////////////////////////////////////////////////////// 

module counter4bit_scan(
	input 		 clk,
	input 		 enable,
	input 		 count_dir,
	input 		 reset,
        input 		 si,
	input 		 se,
//	input            TE,
	output 		 so,
	output reg [3:0] count
	);


  always @(posedge clk) begin
  //always @(negedge clk) begin

	if (reset == 1)
	  count <= 4'b0 ;
	else begin
	  if (enable ==1) begin
	    if (count_dir == 1)  
	      count <= count + 4'b1;
	    else
	      count <= count - 4'b1;
	  end
	end   
  end

endmodule
