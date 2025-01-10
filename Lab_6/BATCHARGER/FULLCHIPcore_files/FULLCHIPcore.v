

module FULLCHIPcore (count_dir, enable, reset, count, vctrl, avdd, agnd, dvdd);
  input enable, reset, count_dir, vctrl;
  output [3:0] count;
  inout       avdd, agnd, dvdd;
   
  
   
   counter4bit   counterinst (.clk(clk), .enable(enable), .count_dir(count_dir), .reset(reset), .count(count[3:0]), .dgnd(agnd), .dvdd(dvdd));

   vcobasic  vcoinst (.clk(clk), .vctrl(vctrl), .avdd(avdd), .agnd(agnd));
   

   
endmodule

