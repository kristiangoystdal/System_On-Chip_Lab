/*
###############################################################
#  Generated by:      Cadence Innovus 20.11-s130_1
#  OS:                Linux x86_64(Host ID fatima.novalocal)
#  Generated on:      Tue Jan  7 12:34:07 2025
#  Design:            counter4bit
#  Command:           saveNetlist counter4bit_pr.v
###############################################################
*/
// Generated by Cadence Genus(TM) Synthesis Solution 19.14-s108_1
// Generated on: Dec  6 2024 11:35:07 WET (Dec  6 2024 11:35:07 UTC)
// Verification Directory fv/counter4bit 
module counter4bit (
	clk, 
	enable, 
	count_dir, 
	reset, 
	count);
   input clk;
   input enable;
   input count_dir;
   input reset;
   output [3:0] count;

   // Internal wires
   wire FE_OFN1_count_1;
   wire FE_OFN0_count_0;
   wire n_0;
   wire n_1;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;

   BUFIHD FE_OFC1_count_1 (.O(count[1]),
	.I(FE_OFN1_count_1));
   BUFJHD FE_OFC0_count_0 (.O(count[0]),
	.I(FE_OFN0_count_0));
   QDFFKHD \count_reg[3]  (.Q(count[3]),
	.D(n_20),
	.CK(clk));
   QDFFKHD \count_reg[2]  (.Q(count[2]),
	.D(n_19),
	.CK(clk));
   OAI13BHD g497__2398 (.O(n_20),
	.A1(n_17),
	.B1(n_12),
	.B2(count[3]),
	.B3(n_18));
   OAI13BHD g500__5107 (.O(n_19),
	.A1(n_15),
	.B1(n_8),
	.B2(count[2]),
	.B3(n_18));
   QDFFEHD \count_reg[1]  (.Q(FE_OFN1_count_1),
	.D(n_16),
	.CK(clk));
   OAI12CHD g499__6260 (.O(n_17),
	.A1(count[3]),
	.B1(n_13),
	.B2(n_14));
   OAI12CHD g502__4319 (.O(n_16),
	.A1(n_11),
	.B1(n_4),
	.B2(n_18));
   OAI12CHD g501__8428 (.O(n_15),
	.A1(count[2]),
	.B1(n_9),
	.B2(n_14));
   AN2B1CHD g503__5526 (.O(n_13),
	.I1(n_12),
	.B1(reset));
   OAI12CHD g504__6783 (.O(n_11),
	.A1(count[1]),
	.B1(n_7),
	.B2(n_14));
   QDFFEHD \count_reg[0]  (.Q(FE_OFN0_count_0),
	.D(n_3),
	.CK(clk));
   AN2B1CHD g506__3680 (.O(n_9),
	.I1(n_8),
	.B1(reset));
   MXL2CHD g507__1617 (.OB(n_12),
	.S(count[2]),
	.A(n_5),
	.B(n_6));
   MUXB2CHD g508__2802 (.O(n_7),
	.S(count_dir),
	.A(count[0]),
	.B(n_1),
	.EB(reset));
   NR2CHD g509__1705 (.O(n_8),
	.I1(n_6),
	.I2(n_5));
   AOI13BHD g510__5122 (.O(n_4),
	.A1(n_5),
	.B1(n_0),
	.B2(count[0]),
	.B3(count_dir));
   MOAI1CHD g511__8246 (.O(n_3),
	.A1(count[0]),
	.A2(n_18),
	.B1(count[0]),
	.B2(n_14));
   AN3EHD g512__7098 (.O(n_6),
	.I1(count[1]),
	.I2(count[0]),
	.I3(count_dir));
   NR3BHD g513__6131 (.O(n_5),
	.I1(count_dir),
	.I2(count[1]),
	.I3(count[0]));
   OR2B1CHD g514__1881 (.O(n_18),
	.I1(reset),
	.B1(enable));
   NR2BHD g515__5115 (.O(n_14),
	.I1(reset),
	.I2(enable));
   INVDHD g519 (.O(n_1),
	.I(count[0]));
   INVDHD g516 (.O(n_0),
	.I(count[1]));
endmodule
