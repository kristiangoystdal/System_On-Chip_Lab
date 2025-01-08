/*
###############################################################
#  Generated by:      Cadence Innovus 20.11-s130_1
#  OS:                Linux x86_64(Host ID fatima.novalocal)
#  Generated on:      Wed Jan  8 19:26:58 2025
#  Design:            BATCHARGER_controller
#  Command:           saveNetlist BATCHARGER_controller_pr.v
###############################################################
*/
// Generated by Cadence Genus(TM) Synthesis Solution 19.14-s108_1
// Generated on: Jan  7 2025 14:08:40 WET (Jan  7 2025 14:08:40 UTC)
// Verification Directory fv/BATCHARGER_controller 
module BATCHARGER_controller (
	cc, 
	tc, 
	cv, 
	imonen, 
	vmonen, 
	tmonen, 
	vtok, 
	vbat, 
	ibat, 
	tbat, 
	vcutoff, 
	vpreset, 
	tempmin, 
	tempmax, 
	tmax, 
	iend, 
	clk, 
	rstz, 
	dvdd, 
	dgnd);
   output cc;
   output tc;
   output cv;
   output imonen;
   output vmonen;
   output tmonen;
   input vtok;
   input [7:0] vbat;
   input [7:0] ibat;
   input [7:0] tbat;
   input [7:0] vcutoff;
   input [7:0] vpreset;
   input [7:0] tempmin;
   input [7:0] tempmax;
   input [7:0] tmax;
   input [7:0] iend;
   input clk;
   input rstz;
   inout dvdd;
   inout dgnd;

   // Internal wires
   wire [2:0] current_state;
   wire [15:0] tpreset;
   wire UNCONNECTED;
   wire UNCONNECTED0;
   wire UNCONNECTED1;
   wire UNCONNECTED2;
   wire UNCONNECTED3;
   wire UNCONNECTED4;
   wire UNCONNECTED5;
   wire UNCONNECTED6;
   wire UNCONNECTED7;
   wire UNCONNECTED8;
   wire UNCONNECTED9;
   wire UNCONNECTED10;
   wire UNCONNECTED11;
   wire UNCONNECTED12;
   wire UNCONNECTED13;
   wire UNCONNECTED14;
   wire UNCONNECTED15;
   wire UNCONNECTED16;
   wire n_0;
   wire n_2;
   wire n_3;
   wire n_5;
   wire n_6;
   wire n_8;
   wire n_9;
   wire n_10;
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
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_113;
   wire n_114;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_119;
   wire n_120;
   wire n_121;
   wire n_122;
   wire n_123;
   wire n_124;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_129;
   wire n_130;
   wire n_131;
   wire n_132;
   wire n_133;
   wire n_134;
   wire n_135;
   wire n_136;
   wire n_137;
   wire n_138;
   wire n_139;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_144;
   wire n_145;
   wire n_146;
   wire n_147;
   wire n_148;
   wire n_149;
   wire n_150;
   wire n_151;
   wire n_152;
   wire n_153;
   wire n_154;
   wire n_155;
   wire n_156;
   wire n_157;
   wire n_158;
   wire n_159;
   wire n_160;
   wire n_161;
   wire n_162;
   wire n_163;
   wire n_164;
   wire n_165;
   wire n_166;
   wire n_167;
   wire n_168;
   wire n_169;
   wire n_170;
   wire n_171;
   wire n_172;
   wire n_173;
   wire n_174;
   wire n_175;
   wire n_176;
   wire n_177;
   wire n_178;
   wire n_179;
   wire n_180;
   wire n_181;
   wire n_182;
   wire n_183;
   wire n_184;
   wire n_185;
   wire n_186;
   wire n_187;
   wire n_188;
   wire n_189;
   wire n_190;
   wire n_191;
   wire n_192;
   wire n_193;
   wire n_194;
   wire n_195;
   wire n_196;
   wire n_197;
   wire n_198;
   wire n_199;
   wire n_200;
   wire n_201;
   wire n_202;
   wire n_203;
   wire n_204;
   wire n_205;
   wire n_206;
   wire n_207;
   wire n_208;
   wire n_209;
   wire n_210;
   wire n_211;
   wire n_212;
   wire n_213;
   wire n_214;
   wire n_215;
   wire n_216;
   wire n_217;
   wire n_218;
   wire n_219;
   wire n_220;
   wire n_221;
   wire n_222;
   wire n_223;
   wire n_224;
   wire n_225;
   wire n_226;
   wire n_227;
   wire n_228;
   wire n_229;
   wire n_230;
   wire n_231;
   wire n_232;
   wire n_233;
   wire n_234;
   wire n_235;
   wire n_236;
   wire n_237;
   wire n_238;
   wire n_239;
   wire n_240;
   wire n_241;
   wire n_242;
   wire n_243;
   wire n_244;
   wire n_245;
   wire n_246;
   wire n_247;
   wire n_248;
   wire n_249;
   wire n_250;

   assign tmonen = imonen ;
   assign vmonen = imonen ;

   OAI12CHD FE_RC_3_0 (.O(n_236),
	.A1(n_230),
	.B1(n_231),
	.B2(n_219));
   MXL2CHD FE_RC_2_0 (.OB(n_160),
	.S(tpreset[11]),
	.A(tmax[3]),
	.B(n_73));
   MXL2CHD FE_RC_1_0 (.OB(n_114),
	.S(tpreset[9]),
	.A(tmax[1]),
	.B(n_67));
   MXL2CHD FE_RC_0_0 (.OB(n_154),
	.S(tpreset[13]),
	.A(tmax[5]),
	.B(n_60));
   QDFFEHD \current_state_reg[0]  (.Q(current_state[0]),
	.D(n_250),
	.CK(clk));
   DFCRBEHD \current_state_reg[1]  (.Q(current_state[1]),
	.QB(UNCONNECTED),
	.D(n_249),
	.CK(clk),
	.RB(vtok));
   DFCRBEHD \current_state_reg[2]  (.Q(current_state[2]),
	.QB(UNCONNECTED0),
	.D(n_247),
	.CK(clk),
	.RB(rstz));
   AN4CHD g1487__2398 (.O(n_250),
	.I1(vtok),
	.I2(rstz),
	.I3(n_248),
	.I4(n_244));
   AO13EHD g1489__5107 (.O(n_249),
	.A1(n_246),
	.B1(n_245),
	.B2(n_228),
	.B3(rstz));
   OAI112BHD g1493__6260 (.O(n_248),
	.A1(n_242),
	.B1(current_state[2]),
	.C1(n_241),
	.C2(current_state[0]));
   AN4B1BHD g1488__4319 (.O(n_247),
	.I1(n_237),
	.I2(n_240),
	.I3(vtok),
	.B1(n_105));
   AN3EHD g1492__8428 (.O(n_246),
	.I1(n_245),
	.I2(n_236),
	.I3(rstz));
   OAI222BHD g1491__5526 (.O(n_244),
	.A1(n_243),
	.A2(n_235),
	.B1(current_state[1]),
	.B2(n_227),
	.C1(current_state[1]),
	.C2(n_243));
   OR2B1CHD g1495__6783 (.O(n_242),
	.I1(n_241),
	.B1(n_230));
   OAI22CHD g1506__3680 (.O(n_240),
	.A1(n_238),
	.A2(n_232),
	.B1(current_state[1]),
	.B2(n_223));
   OAI22CHD g1505__1617 (.O(n_245),
	.A1(n_229),
	.A2(n_239),
	.B1(n_239),
	.B2(n_238));
   OR2B1CHD g1494__2802 (.O(n_237),
	.I1(n_130),
	.B1(n_236));
   OA112EHD g1510__1705 (.O(n_241),
	.A1(n_226),
	.B1(n_52),
	.C1(n_215),
	.C2(n_180));
   MOAI1CHD g1507__5122 (.O(n_235),
	.A1(n_234),
	.A2(current_state[0]),
	.B1(n_234),
	.B2(current_state[0]));
   OAI22CHD g1518__8246 (.O(n_239),
	.A1(n_233),
	.A2(n_231),
	.B1(n_233),
	.B2(current_state[0]));
   NR2BHD g1517__7098 (.O(n_232),
	.I1(current_state[2]),
	.I2(n_234));
   ND2DHD g1512__1881 (.O(n_229),
	.I1(n_228),
	.I2(n_227));
   MOAI1CHD g1522__5115 (.O(n_226),
	.A1(n_225),
	.A2(n_224),
	.B1(n_225),
	.B2(n_224));
   INVCKDHD g1528 (.O(n_234),
	.I(n_231));
   AO2222CHD g1532__7482 (.O(n_231),
	.A1(n_220),
	.A2(n_214),
	.B1(n_201),
	.B2(n_173),
	.C1(n_169),
	.C2(n_170),
	.D1(n_213),
	.D2(n_210));
   AN4B1BHD g1521__4733 (.O(n_227),
	.I1(n_221),
	.I2(n_202),
	.I3(n_223),
	.B1(n_178));
   AOI112BHD g1546__6161 (.O(n_225),
	.A1(n_218),
	.B1(n_212),
	.C1(n_206),
	.C2(n_217));
   DFCLRBEHD \tpreset_reg[15]  (.Q(UNCONNECTED1),
	.QB(tpreset[15]),
	.D(tpreset[15]),
	.CK(clk),
	.RB(n_222),
	.LD(n_194));
   DFCLRBEHD \tpreset_reg[13]  (.Q(UNCONNECTED2),
	.QB(tpreset[13]),
	.D(tpreset[13]),
	.CK(clk),
	.RB(n_222),
	.LD(n_191));
   DFCLRBEHD \tpreset_reg[11]  (.Q(UNCONNECTED3),
	.QB(tpreset[11]),
	.D(tpreset[11]),
	.CK(clk),
	.RB(n_222),
	.LD(n_196));
   NR2BHD g1535__9315 (.O(n_221),
	.I1(n_177),
	.I2(n_216));
   OAI112BHD g1549__9945 (.O(n_220),
	.A1(n_211),
	.B1(n_208),
	.C1(n_152),
	.C2(vbat[3]));
   DFCLRBEHD \tpreset_reg[14]  (.Q(UNCONNECTED4),
	.QB(tpreset[14]),
	.D(tpreset[14]),
	.CK(clk),
	.RB(n_222),
	.LD(n_197));
   AO2222BHD g1516__2883 (.O(n_219),
	.A1(n_199),
	.A2(n_139),
	.B1(n_44),
	.B2(n_35),
	.C1(n_134),
	.C2(vbat[7]),
	.D1(n_138),
	.D2(n_141));
   AO2222BHD g1519__2346 (.O(n_230),
	.A1(n_203),
	.A2(n_137),
	.B1(n_42),
	.B2(n_37),
	.C1(n_133),
	.C2(vbat[7]),
	.D1(n_136),
	.D2(n_127));
   DFCLRBEHD \tpreset_reg[9]  (.Q(UNCONNECTED5),
	.QB(tpreset[9]),
	.D(tpreset[9]),
	.CK(clk),
	.RB(n_222),
	.LD(n_190));
   OA112EHD g1548__1666 (.O(n_218),
	.A1(n_217),
	.B1(n_189),
	.C1(n_187),
	.C2(n_184));
   DFCLRBEHD \tpreset_reg[10]  (.Q(UNCONNECTED6),
	.QB(tpreset[10]),
	.D(tpreset[10]),
	.CK(clk),
	.RB(n_222),
	.LD(n_186));
   DFCLRBEHD \tpreset_reg[12]  (.Q(UNCONNECTED7),
	.QB(tpreset[12]),
	.D(tpreset[12]),
	.CK(clk),
	.RB(n_222),
	.LD(n_181));
   AN4B1BHD g1553__7410 (.O(n_216),
	.I1(n_204),
	.I2(n_120),
	.I3(n_21),
	.B1(n_176));
   AN4B1BHD g1520__6417 (.O(n_215),
	.I1(n_200),
	.I2(n_116),
	.I3(n_23),
	.B1(n_179));
   DFCLRBEHD \tpreset_reg[8]  (.Q(UNCONNECTED8),
	.QB(tpreset[8]),
	.D(tpreset[8]),
	.CK(clk),
	.RB(n_222),
	.LD(n_174));
   AN3EHD g1562__5477 (.O(n_214),
	.I1(n_213),
	.I2(n_209),
	.I3(n_175));
   OAI222BHD g1575__2398 (.O(n_212),
	.A1(n_162),
	.A2(n_205),
	.B1(n_158),
	.B2(n_155),
	.C1(n_64),
	.C2(n_65));
   OAI112BHD g1580__5107 (.O(n_211),
	.A1(n_207),
	.B1(n_164),
	.C1(n_182),
	.C2(n_168));
   DFCLRBEHD \tpreset_reg[7]  (.Q(UNCONNECTED9),
	.QB(tpreset[7]),
	.D(tpreset[7]),
	.CK(clk),
	.RB(n_222),
	.LD(n_148));
   MOAI1CHD g1579__6260 (.O(n_210),
	.A1(n_157),
	.A2(vbat[5]),
	.B1(n_209),
	.B2(n_166));
   DFCLRBEHD \tpreset_reg[5]  (.Q(UNCONNECTED10),
	.QB(tpreset[5]),
	.D(tpreset[5]),
	.CK(clk),
	.RB(n_222),
	.LD(n_135));
   DFCLRBEHD \tpreset_reg[6]  (.Q(UNCONNECTED11),
	.QB(tpreset[6]),
	.D(tpreset[6]),
	.CK(clk),
	.RB(n_222),
	.LD(n_142));
   OR3B1EHD g1597__4319 (.O(n_208),
	.I1(vbat[2]),
	.I2(n_163),
	.B1(n_207));
   OAI222BHD g1604__8428 (.O(n_206),
	.A1(n_112),
	.A2(n_188),
	.B1(n_143),
	.B2(n_115),
	.C1(n_103),
	.C2(n_104));
   AOI112BHD g1605__5526 (.O(n_217),
	.A1(n_205),
	.B1(n_161),
	.C1(n_160),
	.C2(n_159));
   OAI112BHD g1577__6783 (.O(n_204),
	.A1(n_150),
	.B1(n_81),
	.C1(n_33),
	.C2(tbat[3]));
   OAI112BHD g1524__3680 (.O(n_203),
	.A1(n_149),
	.B1(n_99),
	.C1(n_198),
	.C2(vcutoff[3]));
   AO13CHD g1554__1617 (.O(n_202),
	.A1(n_123),
	.B1(n_151),
	.B2(n_58),
	.B3(n_22));
   AN2EHD g1581__2802 (.O(n_213),
	.I1(n_201),
	.I2(n_172));
   DFCLRBEHD \tpreset_reg[4]  (.Q(UNCONNECTED12),
	.QB(tpreset[4]),
	.D(tpreset[4]),
	.CK(clk),
	.RB(n_222),
	.LD(n_124));
   OAI112BHD g1525__1705 (.O(n_200),
	.A1(n_145),
	.B1(n_72),
	.C1(n_40),
	.C2(iend[3]));
   OAI112BHD g1526__5122 (.O(n_199),
	.A1(n_144),
	.B1(n_93),
	.C1(n_198),
	.C2(vpreset[3]));
   NR3BHD g1500__8246 (.O(n_197),
	.I1(n_192),
	.I2(n_193),
	.I3(n_195));
   NR3BHD g1499__7098 (.O(n_196),
	.I1(tpreset[10]),
	.I2(n_185),
	.I3(n_195));
   NR4EHD g1501__6131 (.O(n_194),
	.I1(n_193),
	.I2(n_195),
	.I3(tpreset[14]),
	.I4(n_192));
   NR3BHD g1502__1881 (.O(n_191),
	.I1(tpreset[12]),
	.I2(n_193),
	.I3(n_195));
   NR2BHD g1666__5115 (.O(n_190),
	.I1(tpreset[8]),
	.I2(n_195));
   NR2CHD g1595__7482 (.O(n_189),
	.I1(n_84),
	.I2(n_188));
   DFCLRBEHD \tpreset_reg[2]  (.Q(UNCONNECTED13),
	.QB(tpreset[2]),
	.D(tpreset[2]),
	.CK(clk),
	.RB(n_222),
	.LD(n_86));
   DFCLRBEHD \tpreset_reg[3]  (.Q(UNCONNECTED14),
	.QB(tpreset[3]),
	.D(tpreset[3]),
	.CK(clk),
	.RB(n_222),
	.LD(n_62));
   DFCLRBEHD \tpreset_reg[1]  (.Q(UNCONNECTED15),
	.QB(tpreset[1]),
	.D(tpreset[1]),
	.CK(clk),
	.RB(n_222),
	.LD(n_128));
   AOI112BHD g1600__4733 (.O(n_187),
	.A1(n_183),
	.B1(n_75),
	.C1(n_108),
	.C2(n_129));
   NR2BHD g1496__6161 (.O(n_186),
	.I1(n_185),
	.I2(n_195));
   OAI222BHD g1603__9315 (.O(n_184),
	.A1(n_183),
	.A2(n_113),
	.B1(n_66),
	.B2(n_36),
	.C1(n_59),
	.C2(tpreset[6]));
   AOI22BHD g1621__9945 (.O(n_182),
	.A1(n_126),
	.A2(vbat[0]),
	.B1(n_167),
	.B2(vbat[1]));
   NR2BHD g1497__2883 (.O(n_181),
	.I1(n_193),
	.I2(n_195));
   DFCRBEHD \tpreset_reg[0]  (.Q(UNCONNECTED16),
	.QB(tpreset[0]),
	.D(n_222),
	.CK(clk),
	.RB(tpreset[0]));
   OAI112BHD g1523__2346 (.O(n_180),
	.A1(n_77),
	.B1(n_25),
	.C1(n_117),
	.C2(n_179));
   OAI112BHD g1567__1666 (.O(n_178),
	.A1(n_55),
	.B1(n_28),
	.C1(n_119),
	.C2(n_122));
   OAI112BHD g1568__7410 (.O(n_177),
	.A1(n_54),
	.B1(n_24),
	.C1(n_121),
	.C2(n_176));
   ND2CHD g1582__6417 (.O(n_175),
	.I1(n_165),
	.I2(vbat[4]));
   INVCKDHD g1669 (.O(n_174),
	.I(n_195));
   NR2CHD g1587__5477 (.O(n_173),
	.I1(vbat[6]),
	.I2(n_171));
   ND2CHD g1588__2398 (.O(n_172),
	.I1(n_171),
	.I2(vbat[6]));
   OR2EHD g1593__5107 (.O(n_201),
	.I1(n_170),
	.I2(n_169));
   NR2CHD g1607__6260 (.O(n_168),
	.I1(vbat[1]),
	.I2(n_167));
   NR2CHD g1611__4319 (.O(n_166),
	.I1(vbat[4]),
	.I2(n_165));
   ND2CHD g1609__8428 (.O(n_164),
	.I1(n_163),
	.I2(vbat[2]));
   OA13EHD g1620__5526 (.O(n_162),
	.A1(n_125),
	.B1(n_161),
	.B2(n_160),
	.B3(n_159));
   OA13EHD g1640__6783 (.O(n_158),
	.A1(n_111),
	.B1(n_156),
	.B2(n_154),
	.B3(n_153));
   ND2CHD g1613__3680 (.O(n_209),
	.I1(n_157),
	.I2(vbat[5]));
   AO112EHD g1625__1617 (.O(n_205),
	.A1(n_156),
	.B1(n_155),
	.C1(n_154),
	.C2(n_153));
   ND2CHD g1614__2802 (.O(n_207),
	.I1(n_152),
	.I2(vbat[3]));
   OAI112BHD g1601__1705 (.O(n_151),
	.A1(n_85),
	.B1(n_57),
	.C1(n_56),
	.C2(tbat[2]));
   OAI112BHD g1602__5122 (.O(n_150),
	.A1(n_78),
	.B1(n_80),
	.C1(n_79),
	.C2(tempmin[2]));
   AO12CHD g1527__8246 (.O(n_223),
	.A1(n_38),
	.B1(n_101),
	.B2(n_140));
   OR3EHD g1670__7098 (.O(n_195),
	.I1(n_43),
	.I2(n_147),
	.I3(n_146));
   OAI112BHD g1544__6131 (.O(n_149),
	.A1(n_87),
	.B1(n_98),
	.C1(n_97),
	.C2(vbat[2]));
   NR3BHD g1503__1881 (.O(n_148),
	.I1(tpreset[6]),
	.I2(n_147),
	.I3(n_146));
   OAI112BHD g1542__5115 (.O(n_145),
	.A1(n_76),
	.B1(n_71),
	.C1(n_70),
	.C2(ibat[2]));
   OAI112BHD g1545__7482 (.O(n_144),
	.A1(n_102),
	.B1(n_92),
	.C1(n_91),
	.C2(vbat[2]));
   AO12EHD g1641__4733 (.O(n_188),
	.A1(n_143),
	.B1(n_114),
	.B2(tpreset[8]));
   NR2BHD g1498__6161 (.O(n_142),
	.I1(n_147),
	.I2(n_146));
   OAI12CHD g1541__9315 (.O(n_141),
	.A1(n_96),
	.B1(n_140),
	.B2(vpreset[5]));
   OA112CHD g1529__9945 (.O(n_139),
	.A1(n_138),
	.B1(n_95),
	.C1(n_94),
	.C2(vbat[4]));
   OA112CHD g1530__2883 (.O(n_137),
	.A1(n_136),
	.B1(n_89),
	.C1(n_88),
	.C2(vbat[4]));
   NR2BHD g1667__2346 (.O(n_135),
	.I1(tpreset[4]),
	.I2(n_146));
   OAI22CHD g1624__1666 (.O(n_169),
	.A1(n_134),
	.A2(n_131),
	.B1(n_132),
	.B2(n_133));
   AOI22BHD g1623__7410 (.O(n_171),
	.A1(n_132),
	.A2(vpreset[6]),
	.B1(n_131),
	.B2(vcutoff[6]));
   AN4B1BHD g1490__6417 (.O(n_222),
	.I1(n_130),
	.I2(vtok),
	.I3(rstz),
	.B1(n_238));
   OR3B2CHD g1638__5477 (.O(n_129),
	.I1(n_69),
	.B1(n_128),
	.B2(tmax[0]));
   OAI12CHD g1543__2398 (.O(n_127),
	.A1(n_90),
	.B1(n_140),
	.B2(vcutoff[5]));
   AOI22BHD g1653__5107 (.O(n_126),
	.A1(n_132),
	.A2(vpreset[0]),
	.B1(n_131),
	.B2(vcutoff[0]));
   AOI22BHD g1643__6260 (.O(n_165),
	.A1(n_132),
	.A2(vpreset[4]),
	.B1(n_131),
	.B2(vcutoff[4]));
   AOI22BHD g1644__4319 (.O(n_163),
	.A1(n_132),
	.A2(vpreset[2]),
	.B1(n_131),
	.B2(vcutoff[2]));
   AOI22BHD g1645__8428 (.O(n_152),
	.A1(n_132),
	.A2(vpreset[3]),
	.B1(n_131),
	.B2(vcutoff[3]));
   AOI22BHD g1642__5526 (.O(n_157),
	.A1(n_132),
	.A2(vpreset[5]),
	.B1(n_131),
	.B2(vcutoff[5]));
   AOI22BHD g1659__6783 (.O(n_167),
	.A1(n_132),
	.A2(vpreset[1]),
	.B1(n_131),
	.B2(vcutoff[1]));
   ND2DHD g1626__3680 (.O(n_125),
	.I1(n_106),
	.I2(n_107));
   INVCKDHD g1671 (.O(n_124),
	.I(n_146));
   OR3B2CHD g1578__1617 (.O(n_123),
	.I1(n_122),
	.B1(n_118),
	.B2(n_19));
   AOI22BHD g1596__2802 (.O(n_121),
	.A1(n_14),
	.A2(n_120),
	.B1(n_34),
	.B2(tempmin[5]));
   AOI22BHD g1599__1705 (.O(n_119),
	.A1(n_15),
	.A2(n_118),
	.B1(n_9),
	.B2(tbat[5]));
   AOI22BHD g1533__5122 (.O(n_117),
	.A1(n_27),
	.A2(n_116),
	.B1(n_41),
	.B2(ibat[5]));
   NR2CHD g1663__8246 (.O(n_156),
	.I1(n_109),
	.I2(n_110));
   OR2EHD g1656__7098 (.O(n_115),
	.I1(tpreset[8]),
	.I2(n_114));
   OA13EHD g1637__6131 (.O(n_113),
	.A1(n_18),
	.B1(n_74),
	.B2(tpreset[3]),
	.B3(n_73));
   AOI13BHD g1639__1881 (.O(n_112),
	.A1(n_39),
	.B1(n_83),
	.B2(n_82),
	.B3(tmax[7]));
   ND2DHD g1655__5115 (.O(n_111),
	.I1(n_110),
	.I2(n_109));
   OA13EHD g1636__7482 (.O(n_108),
	.A1(n_20),
	.B1(n_68),
	.B2(tpreset[1]),
	.B3(n_67));
   NR2CHD g1658__4733 (.O(n_161),
	.I1(n_107),
	.I2(n_106));
   AN2B1CHD g1509__6161 (.O(n_243),
	.I1(n_238),
	.B1(n_105));
   AN2EHD g1657__9315 (.O(n_143),
	.I1(n_104),
	.I2(n_103));
   MAO222CHD g1565__9945 (.O(n_102),
	.A1(n_29),
	.B1(n_3),
	.C1(vbat[1]));
   OAI22CHD g1558__2883 (.O(n_101),
	.A1(vbat[3]),
	.A2(n_16),
	.B1(vbat[3]),
	.B2(vbat[2]));
   NR2BHD g1477__2346 (.O(cc),
	.I1(n_51),
	.I2(n_131));
   ND3CHD g1559__1666 (.O(n_99),
	.I1(n_98),
	.I2(n_97),
	.I3(vbat[2]));
   ND3CHD g1560__7410 (.O(n_96),
	.I1(n_95),
	.I2(n_94),
	.I3(vbat[4]));
   ND3CHD g1561__6417 (.O(n_93),
	.I1(n_92),
	.I2(n_91),
	.I3(vbat[2]));
   ND3CHD g1563__5477 (.O(n_90),
	.I1(n_89),
	.I2(n_88),
	.I3(vbat[4]));
   MAO222CHD g1564__2398 (.O(n_87),
	.A1(n_31),
	.B1(n_12),
	.C1(vbat[1]));
   OR3EHD g1511__5107 (.O(n_193),
	.I1(tpreset[11]),
	.I2(tpreset[10]),
	.I3(n_185));
   OR3B2CHD g1672__6260 (.O(n_146),
	.I1(tpreset[3]),
	.B1(n_86),
	.B2(n_61));
   MAO222CHD g1622__4319 (.O(n_85),
	.A1(n_26),
	.B1(n_11),
	.C1(tbat[1]));
   OAI12CHD g1617__8428 (.O(n_84),
	.A1(n_83),
	.B1(n_82),
	.B2(tmax[7]));
   ND3CHD g1618__5526 (.O(n_81),
	.I1(n_80),
	.I2(n_79),
	.I3(tempmin[2]));
   MAO222CHD g1619__6783 (.O(n_78),
	.A1(n_17),
	.B1(n_10),
	.C1(tempmin[1]));
   OR3B2CHD g1536__3680 (.O(n_77),
	.I1(iend[6]),
	.B1(n_47),
	.B2(ibat[6]));
   MAO222CHD g1566__1617 (.O(n_76),
	.A1(n_30),
	.B1(n_5),
	.C1(ibat[1]));
   AO12EHD g1629__2802 (.O(n_75),
	.A1(n_74),
	.B1(tpreset[3]),
	.B2(n_73));
   ND3CHD g1550__1705 (.O(n_72),
	.I1(n_71),
	.I2(n_70),
	.I3(ibat[2]));
   AO12EHD g1654__5122 (.O(n_69),
	.A1(n_68),
	.B1(tpreset[1]),
	.B2(n_67));
   AO12EHD g1635__8246 (.O(n_183),
	.A1(n_66),
	.B1(tpreset[5]),
	.B2(n_60));
   AN2EHD g1632__7098 (.O(n_155),
	.I1(n_65),
	.I2(n_64));
   NR3BHD g1478__6131 (.O(cv),
	.I1(current_state[0]),
	.I2(current_state[1]),
	.I3(n_228));
   AN2EHD g1668__1881 (.O(n_62),
	.I1(n_86),
	.I2(n_61));
   OAI22CHD g1688__4733 (.O(n_110),
	.A1(tmax[6]),
	.A2(n_2),
	.B1(tpreset[14]),
	.B2(n_59));
   MUX2EHD g1689__6161 (.O(n_104),
	.S(tmax[2]),
	.A(n_6),
	.B(tpreset[10]));
   MXL2CHD g1685__9945 (.OB(n_106),
	.S(tmax[4]),
	.A(n_8),
	.B(tpreset[12]));
   OAI12CHD g1690__2883 (.O(n_238),
	.A1(imonen),
	.B1(current_state[2]),
	.B2(current_state[1]));
   INVDHD g1664 (.O(n_132),
	.I(n_131));
   ND3CHD g1616__2346 (.O(n_58),
	.I1(n_57),
	.I2(n_56),
	.I3(tbat[2]));
   ND3CHD g1598__1666 (.O(n_55),
	.I1(n_46),
	.I2(n_45),
	.I3(tbat[6]));
   ND3CHD g1594__7410 (.O(n_54),
	.I1(n_50),
	.I2(n_49),
	.I3(tempmin[6]));
   AN2CHD g1476__6417 (.O(tc),
	.I1(n_105),
	.I2(current_state[1]));
   OAI22CHD g1531__5477 (.O(n_233),
	.A1(current_state[1]),
	.A2(n_52),
	.B1(n_51),
	.B2(current_state[0]));
   OAI12CHD g1591__2398 (.O(n_176),
	.A1(n_50),
	.B1(n_49),
	.B2(tempmin[6]));
   AOI22BHD g1537__5107 (.O(n_138),
	.A1(n_48),
	.A2(vpreset[6]),
	.B1(n_170),
	.B2(vpreset[7]));
   AOI22BHD g1538__6260 (.O(n_136),
	.A1(n_48),
	.A2(vcutoff[6]),
	.B1(n_170),
	.B2(vcutoff[7]));
   OAI12CHD g1539__4319 (.O(n_179),
	.A1(n_47),
	.B1(n_0),
	.B2(ibat[6]));
   OAI12CHD g1592__8428 (.O(n_122),
	.A1(n_46),
	.B1(n_45),
	.B2(tbat[6]));
   ND2CHD g1555__5526 (.O(n_44),
	.I1(n_170),
	.I2(vpreset[7]));
   OR2B1CHD g1674__6783 (.O(n_43),
	.I1(tpreset[6]),
	.B1(n_82));
   ND2CHD g1557__3680 (.O(n_42),
	.I1(n_170),
	.I2(vcutoff[7]));
   OR2CHD g1574__1617 (.O(n_116),
	.I1(ibat[5]),
	.I2(n_41));
   ND2CHD g1569__2802 (.O(n_71),
	.I1(n_40),
	.I2(iend[3]));
   NR2CHD g1662__1705 (.O(n_74),
	.I1(tmax[4]),
	.I2(n_13));
   ND2CHD g1570__5122 (.O(n_92),
	.I1(n_198),
	.I2(vpreset[3]));
   ND2CHD g1571__8246 (.O(n_89),
	.I1(n_140),
	.I2(vcutoff[5]));
   ND2CHD g1572__7098 (.O(n_98),
	.I1(n_198),
	.I2(vcutoff[3]));
   ND2CHD g1573__6131 (.O(n_95),
	.I1(n_140),
	.I2(vpreset[5]));
   ND2DHD g1665__1881 (.O(n_131),
	.I1(n_228),
	.I2(current_state[0]));
   NR2CHD g1646__5115 (.O(n_39),
	.I1(tmax[0]),
	.I2(n_32));
   OAI112BHD g1540__7482 (.O(n_38),
	.A1(vbat[7]),
	.B1(vbat[6]),
	.C1(vbat[5]),
	.C2(vbat[4]));
   NR2BHD g1551__4733 (.O(n_37),
	.I1(vcutoff[6]),
	.I2(n_48));
   OR2EHD g1648__6161 (.O(n_36),
	.I1(n_60),
	.I2(tpreset[5]));
   NR2BHD g1547__9315 (.O(n_35),
	.I1(vpreset[6]),
	.I2(n_48));
   ND2CHD g1630__9945 (.O(n_118),
	.I1(n_34),
	.I2(tempmax[5]));
   ND2CHD g1634__2883 (.O(n_80),
	.I1(n_33),
	.I2(tbat[3]));
   AN2EHD g1652__2346 (.O(n_66),
	.I1(tpreset[6]),
	.I2(n_59));
   OR2CHD g1631__1666 (.O(n_120),
	.I1(tempmin[5]),
	.I2(n_34));
   ND2CHD g1660__7410 (.O(n_83),
	.I1(n_32),
	.I2(tmax[0]));
   NR2CHD g1661__6417 (.O(n_68),
	.I1(tmax[2]),
	.I2(n_61));
   XNR2EHD g1683__5477 (.O(n_65),
	.I1(tmax[7]),
	.I2(tpreset[15]));
   OR2B1CHD g1583__2398 (.O(n_31),
	.I1(vbat[0]),
	.B1(vcutoff[0]));
   OR2B1CHD g1586__5107 (.O(n_30),
	.I1(ibat[0]),
	.B1(iend[0]));
   OR2B1CHD g1585__6260 (.O(n_29),
	.I1(vbat[0]),
	.B1(vpreset[0]));
   OR2B1CHD g1584__4319 (.O(n_28),
	.I1(tempmax[7]),
	.B1(tbat[7]));
   AN2B1CHD g1576__8428 (.O(n_27),
	.I1(ibat[4]),
	.B1(iend[4]));
   OR2B1CHD g1650__5526 (.O(n_26),
	.I1(tbat[0]),
	.B1(tempmax[0]));
   OR2EHD g1513__6783 (.O(n_192),
	.I1(tpreset[13]),
	.I2(tpreset[12]));
   OR2EHD g1681__3680 (.O(n_159),
	.I1(tmax[2]),
	.I2(tpreset[10]));
   ND2DHD g1504__1617 (.O(n_130),
	.I1(current_state[0]),
	.I2(current_state[2]));
   OR2B1CHD g1556__2802 (.O(n_47),
	.I1(ibat[7]),
	.B1(iend[7]));
   NR2CHD g1675__1705 (.O(n_109),
	.I1(tmax[5]),
	.I2(tpreset[13]));
   OR2EHD g1679__5122 (.O(n_224),
	.I1(tmax[7]),
	.I2(tpreset[15]));
   OR2EHD g1680__8246 (.O(n_153),
	.I1(tmax[4]),
	.I2(tpreset[12]));
   NR2CHD g1677__7098 (.O(n_107),
	.I1(tmax[3]),
	.I2(tpreset[11]));
   OR2EHD g1676__6131 (.O(n_103),
	.I1(tmax[1]),
	.I2(tpreset[9]));
   OR2EHD g1514__1881 (.O(n_185),
	.I1(tpreset[9]),
	.I2(tpreset[8]));
   NR2CHD g1682__5115 (.O(n_86),
	.I1(tpreset[1]),
	.I2(tpreset[0]));
   NR2CHD g1515__7482 (.O(n_105),
	.I1(current_state[2]),
	.I2(current_state[0]));
   OR2B1CHD g1534__4733 (.O(n_25),
	.I1(iend[7]),
	.B1(ibat[7]));
   OR2B1CHD g1590__6161 (.O(n_24),
	.I1(tbat[7]),
	.B1(tempmin[7]));
   OR2B1CHD g1552__9315 (.O(n_23),
	.I1(ibat[4]),
	.B1(iend[4]));
   OR2B1CHD g1606__9945 (.O(n_22),
	.I1(tempmax[3]),
	.B1(tbat[3]));
   OR2B1CHD g1608__2883 (.O(n_21),
	.I1(tempmin[4]),
	.B1(tbat[4]));
   OR2B1CHD g1651__2346 (.O(n_20),
	.I1(tpreset[2]),
	.B1(tmax[2]));
   OR2B1CHD g1610__1666 (.O(n_19),
	.I1(tbat[4]),
	.B1(tempmax[4]));
   OR2B1CHD g1649__7410 (.O(n_18),
	.I1(tpreset[4]),
	.B1(tmax[4]));
   OR2B1CHD g1647__6417 (.O(n_17),
	.I1(tempmin[0]),
	.B1(tbat[0]));
   AN2CHD g1589__5477 (.O(n_16),
	.I1(vbat[1]),
	.I2(vbat[0]));
   AN2B1CHD g1627__2398 (.O(n_15),
	.I1(tbat[4]),
	.B1(tempmax[4]));
   AN2B1CHD g1628__5107 (.O(n_14),
	.I1(tempmin[4]),
	.B1(tbat[4]));
   OR2B1CHD g1612__6260 (.O(n_46),
	.I1(tbat[7]),
	.B1(tempmax[7]));
   OR2B1CHD g1615__4319 (.O(n_50),
	.I1(tempmin[7]),
	.B1(tbat[7]));
   OR2B1CHD g1633__8428 (.O(n_57),
	.I1(tbat[3]),
	.B1(tempmax[3]));
   OR2EHD g1678__5526 (.O(n_64),
	.I1(tmax[6]),
	.I2(tpreset[14]));
   OR2EHD g1673__6783 (.O(n_147),
	.I1(tpreset[5]),
	.I2(tpreset[4]));
   ND2DHD g1691__3680 (.O(imonen),
	.I1(current_state[1]),
	.I2(current_state[2]));
   INVDHD g1732 (.O(n_13),
	.I(tpreset[4]));
   INVCKDHD g1723 (.O(n_12),
	.I(vcutoff[1]));
   INVCKDHD g1694 (.O(n_11),
	.I(tempmax[1]));
   INVCKDHD g1700 (.O(n_10),
	.I(tbat[1]));
   INVCKDHD g1693 (.O(n_9),
	.I(tempmax[5]));
   INVCKDHD g1733 (.O(n_8),
	.I(tpreset[12]));
   INVCKDHD g1715 (.O(n_56),
	.I(tempmax[2]));
   INVCKDHD g1720 (.O(n_94),
	.I(vpreset[4]));
   INVCKDHD g1725 (.O(n_79),
	.I(tbat[2]));
   INVCKDHD g1698 (.O(n_133),
	.I(vcutoff[7]));
   INVCKDHD g1719 (.O(n_40),
	.I(ibat[3]));
   INVDHD g1714 (.O(n_52),
	.I(current_state[0]));
   INVCKDHD g1721 (.O(n_88),
	.I(vcutoff[4]));
   INVCKDHD g1722 (.O(n_134),
	.I(vpreset[7]));
   INVCKDHD g1717 (.O(n_45),
	.I(tempmax[6]));
   INVCKDHD g1703 (.O(n_60),
	.I(tmax[5]));
   INVCKDHD g1728 (.O(n_67),
	.I(tmax[1]));
   INVCKDHD g1727 (.O(n_73),
	.I(tmax[3]));
   INVCKDHD g1712 (.O(n_198),
	.I(vbat[3]));
   INVCKDHD g1710 (.O(n_48),
	.I(vbat[6]));
   INVDHD g1735 (.O(n_228),
	.I(current_state[2]));
   INVCKDHD g1709 (.O(n_6),
	.I(tpreset[10]));
   INVCKDHD g1692 (.O(n_5),
	.I(iend[1]));
   INVCKDHD g1724 (.O(n_3),
	.I(vpreset[1]));
   INVCKDHD g1705 (.O(n_2),
	.I(tpreset[14]));
   INVCKDHD g1695 (.O(n_0),
	.I(iend[6]));
   INVCKDHD g1696 (.O(n_33),
	.I(tempmin[3]));
   INVDHD g1713 (.O(n_51),
	.I(current_state[1]));
   INVCKDHD g1697 (.O(n_91),
	.I(vpreset[2]));
   INVCKDHD g1711 (.O(n_32),
	.I(tpreset[8]));
   INVCKDHD g1718 (.O(n_70),
	.I(iend[2]));
   INVDHD g1729 (.O(n_128),
	.I(tpreset[0]));
   INVCKDHD g1699 (.O(n_97),
	.I(vcutoff[2]));
   INVCKDHD g1716 (.O(n_41),
	.I(iend[5]));
   INVCKDHD g1702 (.O(n_49),
	.I(tbat[6]));
   INVDHD g1704 (.O(n_82),
	.I(tpreset[7]));
   INVCKDHD g1701 (.O(n_34),
	.I(tbat[5]));
   INVDHD g1731 (.O(n_61),
	.I(tpreset[2]));
   INVCKDHD g1726 (.O(n_59),
	.I(tmax[6]));
   INVCKDHD g1734 (.O(n_140),
	.I(vbat[5]));
   INVCKDHD g1708 (.O(n_170),
	.I(vbat[7]));
endmodule

