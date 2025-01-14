
// Generated by Cadence Genus(TM) Synthesis Solution 19.14-s108_1
// Generated on: Dec 11 2024 13:38:29 WET (Dec 11 2024 13:38:29 UTC)

// Verification Directory fv/BATCHARGER_controller 

module BATCHARGER_controller(cc, tc, cv, imonen, vmonen, tmonen, vtok,
     vbat, ibat, tbat, vcutoff, vpreset, tempmin, tempmax, tmax, iend,
     clk, en, rstz, dvdd, dgnd, se, si, so);
  input vtok, clk, en, rstz, se, si;
  input [7:0] vbat, ibat, tbat, vcutoff, vpreset, tempmin, tempmax,
       tmax, iend;
  output cc, tc, cv, imonen, vmonen, tmonen, so;
  inout dvdd, dgnd;
  wire vtok, clk, en, rstz, se, si;
  wire [7:0] vbat, ibat, tbat, vcutoff, vpreset, tempmin, tempmax,
       tmax, iend;
  wire cc, tc, cv, imonen, vmonen, tmonen, so;
  wire dvdd, dgnd;
  wire [2:0] current_state;
  wire [15:0] tpreset;
  wire n_0, n_2, n_3, n_4, n_5, n_6, n_7, n_8;
  wire n_9, n_10, n_12, n_13, n_14, n_15, n_16, n_17;
  wire n_18, n_19, n_20, n_21, n_22, n_23, n_24, n_25;
  wire n_26, n_27, n_28, n_29, n_30, n_31, n_32, n_33;
  wire n_34, n_35, n_36, n_37, n_38, n_39, n_40, n_41;
  wire n_42, n_43, n_44, n_45, n_46, n_47, n_48, n_49;
  wire n_50, n_52, n_53, n_54, n_55, n_56, n_57, n_58;
  wire n_59, n_60, n_63, n_64, n_65, n_66, n_67, n_68;
  wire n_69, n_70, n_71, n_72, n_73, n_74, n_75, n_76;
  wire n_77, n_78, n_79, n_80, n_81, n_82, n_83, n_84;
  wire n_85, n_86, n_87, n_89, n_90, n_92, n_93, n_94;
  wire n_95, n_96, n_97, n_98, n_100, n_101, n_102, n_103;
  wire n_104, n_105, n_106, n_107, n_108, n_109, n_110, n_111;
  wire n_112, n_113, n_114, n_115, n_116, n_117, n_118, n_119;
  wire n_120, n_121, n_122, n_123, n_124, n_125, n_126, n_127;
  wire n_128, n_129, n_130, n_131, n_132, n_133, n_136, n_137;
  wire n_138, n_139, n_140, n_141, n_142, n_143, n_144, n_145;
  wire n_146, n_147, n_148, n_149, n_150, n_151, n_152, n_153;
  wire n_154, n_155, n_156, n_157, n_158, n_159, n_160, n_161;
  wire n_162, n_163, n_164, n_165, n_166, n_167, n_168, n_169;
  wire n_170, n_171, n_172, n_173, n_174, n_175, n_176, n_177;
  wire n_178, n_179, n_180, n_181, n_182, n_183, n_184, n_185;
  wire n_186, n_187, n_188, n_189, n_190, n_191, n_192, n_193;
  wire n_194, n_195, n_196, n_197, n_198, n_199, n_200, n_201;
  wire n_202, n_203, n_204, n_205, n_206, n_207, n_208, n_209;
  wire n_210, n_211, n_212, n_213, n_214, n_215, n_216, n_217;
  wire n_218, n_219, n_220, n_221, n_222, n_223, n_224, n_225;
  wire n_226, n_227, n_228, n_229, n_230, n_231, n_232, n_233;
  wire n_234, n_235, n_236, n_237, n_238, n_239, n_240, n_241;
  wire n_242, n_243, n_244, n_245, n_246, n_247, n_248, n_249;
  wire n_250, n_251, n_252, n_253, n_254, n_257, n_259, n_260;
  wire n_261, n_262, n_263, n_264, n_265, n_266, n_267, n_269;
  wire n_270, n_272, n_275, n_278, n_357, n_358, n_359, n_360;
  wire n_361, n_362, n_363, n_364;
  QDFZRBEHD \current_state_reg[0] (.RB (rstz), .CK (clk), .D (n_357),
       .TD (si), .SEL (se), .Q (current_state[0]));
  QDFZRBEHD \current_state_reg[1] (.RB (rstz), .CK (clk), .D (n_358),
       .TD (current_state[0]), .SEL (se), .Q (current_state[1]));
  QDFZRBEHD \current_state_reg[2] (.RB (rstz), .CK (clk), .D (n_359),
       .TD (current_state[1]), .SEL (se), .Q (current_state[2]));
  AO112CHD g1465__6260(.A1 (n_360), .B1 (n_98), .C1 (n_253), .C2
       (n_270), .O (n_275));
  OA13EHD g1466__5526(.A1 (n_272), .B1 (n_265), .B2 (n_245), .B3
       (current_state[0]), .O (n_278));
  OAI12CHD g1468__6783(.A1 (n_264), .B1 (current_state[0]), .B2 (vtok),
       .O (n_272));
  AOI112BHD g1483__1705(.A1 (n_263), .B1 (current_state[2]), .C1
       (n_260), .C2 (n_362), .O (n_264));
  AOI22BHD g1489__5122(.A1 (n_254), .A2 (current_state[2]), .B1
       (n_263), .B2 (n_259), .O (n_267));
  MOAI1CHD g1490__8246(.A1 (n_251), .A2 (current_state[0]), .B1
       (current_state[0]), .B2 (n_242), .O (n_269));
  OAI112BHD g1463__7098(.A1 (n_248), .B1 (current_state[0]), .C1
       (n_246), .C2 (current_state[2]), .O (n_262));
  OAI12CHD g1475__6131(.A1 (current_state[2]), .B1 (n_260), .B2
       (n_259), .O (n_261));
  MUX2EHD g1488__5115(.S (n_260), .A (n_362), .B (current_state[1]), .O
       (n_266));
  OR2B1CHD g1500__7482(.I1 (n_260), .B1 (n_253), .O (n_254));
  NR2CHD g1497__4733(.I1 (n_252), .I2 (n_260), .O (n_263));
  MAOI1CHD g1499__6161(.A1 (n_249), .A2 (n_250), .B1 (n_250), .B2
       (n_249), .O (n_251));
  OR2EHD g1467__9315(.I1 (n_247), .I2 (n_246), .O (n_248));
  AO2222CHD g1506__9945(.A1 (n_232), .A2 (n_240), .B1 (n_200), .B2
       (n_169), .C1 (n_141), .C2 (n_186), .D1 (n_231), .D2 (n_219), .O
       (n_260));
  QDFZRBEHD \tpreset_reg[13] (.RB (rstz), .CK (clk), .D (n_235), .TD
       (tpreset[12]), .SEL (se), .Q (tpreset[13]));
  QDFZRBEHD \tpreset_reg[15] (.RB (rstz), .CK (clk), .D (n_233), .TD
       (tpreset[14]), .SEL (se), .Q (so));
  MOAI1CHD g1487__2883(.A1 (n_244), .A2 (n_239), .B1 (n_244), .B2
       (n_243), .O (n_245));
  QDFZRBEHD \tpreset_reg[11] (.RB (rstz), .CK (clk), .D (n_236), .TD
       (tpreset[10]), .SEL (se), .Q (tpreset[11]));
  AOI112BHD g1520__2346(.A1 (n_238), .B1 (n_225), .C1 (n_237), .C2
       (n_214), .O (n_249));
  AN2EHD g1484__1666(.I1 (n_241), .I2 (n_242), .O (n_246));
  QDFZRBEHD \tpreset_reg[9] (.RB (rstz), .CK (clk), .D (n_228), .TD
       (tpreset[8]), .SEL (se), .Q (tpreset[9]));
  QDFZRBEHD \tpreset_reg[14] (.RB (rstz), .CK (clk), .D (n_223), .TD
       (tpreset[13]), .SEL (se), .Q (tpreset[14]));
  QDFZRBEHD \tpreset_reg[12] (.RB (rstz), .CK (clk), .D (n_224), .TD
       (tpreset[11]), .SEL (se), .Q (tpreset[12]));
  AO12EHD g1485__7410(.A1 (n_241), .B1 (current_state[2]), .B2 (n_247),
       .O (n_270));
  QDFZRBEHD \tpreset_reg[10] (.RB (rstz), .CK (clk), .D (n_227), .TD
       (tpreset[9]), .SEL (se), .Q (tpreset[10]));
  OAI112BHD g1521__6417(.A1 (n_226), .B1 (n_221), .C1 (n_158), .C2
       (vbat[3]), .O (n_240));
  QDFZRBEHD \tpreset_reg[7] (.RB (rstz), .CK (clk), .D (n_215), .TD
       (tpreset[6]), .SEL (se), .Q (tpreset[7]));
  NR2BHD g1496__5477(.I1 (n_185), .I2 (n_230), .O (n_239));
  NR2BHD g1498__2398(.I1 (n_152), .I2 (n_229), .O (n_242));
  QDFZRBEHD \tpreset_reg[8] (.RB (rstz), .CK (clk), .D (n_222), .TD
       (tpreset[7]), .SEL (se), .Q (tpreset[8]));
  OA112EHD g1536__5107(.A1 (n_237), .B1 (n_195), .C1 (n_172), .C2
       (n_167), .O (n_238));
  MUXB2CHD g1451__6260(.S (n_203), .A (n_63), .B (tpreset[11]), .EB
       (n_234), .O (n_236));
  QDFZRBEHD \tpreset_reg[5] (.RB (rstz), .CK (clk), .D (n_204), .TD
       (tpreset[4]), .SEL (se), .Q (tpreset[5]));
  MUXB2CHD g1453__4319(.S (n_202), .A (n_56), .B (tpreset[13]), .EB
       (n_234), .O (n_235));
  MUXB2CHD g1455__8428(.S (n_206), .A (so), .B (n_55), .EB (n_234), .O
       (n_233));
  AO2222BHD g1501__5526(.A1 (n_208), .A2 (n_128), .B1 (n_35), .B2
       (n_38), .C1 (n_8), .C2 (vbat[7]), .D1 (n_127), .D2 (n_130), .O
       (n_259));
  OA112EHD g1542__6783(.A1 (n_231), .B1 (n_218), .C1 (n_217), .C2
       (n_216), .O (n_232));
  AOI112BHD g1494__3680(.A1 (current_state[2]), .B1 (n_155), .C1
       (n_211), .C2 (n_132), .O (n_241));
  QDFZRBEHD \tpreset_reg[6] (.RB (rstz), .CK (clk), .D (n_196), .TD
       (tpreset[5]), .SEL (se), .Q (tpreset[6]));
  AN4B1BHD g1503__1617(.I1 (n_210), .I2 (n_114), .I3 (n_24), .B1
       (n_184), .O (n_230));
  AN4B1BHD g1504__2802(.I1 (n_212), .I2 (n_89), .I3 (n_36), .B1
       (n_151), .O (n_229));
  MUXB2CHD g1449__1705(.S (n_197), .A (n_54), .B (tpreset[9]), .EB
       (n_234), .O (n_228));
  AOI12CHD g1502__5122(.A1 (n_187), .B1 (n_209), .B2 (n_150), .O
       (n_247));
  MUXB2CHD g1450__8246(.S (n_192), .A (tpreset[10]), .B (n_64), .EB
       (n_234), .O (n_227));
  OAI112BHD g1566__7098(.A1 (n_220), .B1 (n_189), .C1 (n_193), .C2
       (n_164), .O (n_226));
  QDFZRBEHD \tpreset_reg[3] (.RB (rstz), .CK (clk), .D (n_180), .TD
       (tpreset[2]), .SEL (se), .Q (tpreset[3]));
  OAI222BHD g1567__6131(.A1 (n_162), .A2 (n_213), .B1 (n_177), .B2
       (n_183), .C1 (n_116), .C2 (n_117), .O (n_225));
  MUXB2CHD g1452__1881(.S (n_179), .A (tpreset[12]), .B (n_59), .EB
       (n_234), .O (n_224));
  MUXB2CHD g1454__5115(.S (n_174), .A (tpreset[14]), .B (n_48), .EB
       (n_234), .O (n_223));
  MUXB2CHD g1440__7482(.S (tpreset[8]), .A (n_205), .B (n_190), .EB
       (n_234), .O (n_222));
  QDFZRBEHD \tpreset_reg[1] (.RB (rstz), .CK (clk), .D (n_156), .TD
       (tpreset[0]), .SEL (se), .Q (tpreset[1]));
  QDFZRBEHD \tpreset_reg[2] (.RB (rstz), .CK (clk), .D (n_154), .TD
       (tpreset[1]), .SEL (se), .Q (tpreset[2]));
  QDFZRBEHD \tpreset_reg[4] (.RB (rstz), .CK (clk), .D (n_146), .TD
       (tpreset[3]), .SEL (se), .Q (tpreset[4]));
  QDFZRBEHD \tpreset_reg[0] (.RB (rstz), .CK (clk), .D (n_153), .TD
       (current_state[2]), .SEL (se), .Q (tpreset[0]));
  OR3B1EHD g1591__4733(.I1 (vbat[2]), .I2 (n_188), .B1 (n_220), .O
       (n_221));
  AO13EHD g1565__6161(.A1 (n_170), .B1 (n_218), .B2 (n_217), .B3
       (n_216), .O (n_219));
  NR2BHD g1447__9315(.I1 (n_234), .I2 (n_199), .O (n_215));
  OAI222BHD g1592__9945(.A1 (n_100), .A2 (n_194), .B1 (n_148), .B2
       (n_124), .C1 (n_107), .C2 (n_108), .O (n_214));
  AOI112BHD g1593__2883(.A1 (n_213), .B1 (n_161), .C1 (n_160), .C2
       (n_159), .O (n_237));
  OAI112BHD g1514__2346(.A1 (n_143), .B1 (n_81), .C1 (n_30), .C2
       (tbat[3]), .O (n_212));
  OAI112BHD g1512__1666(.A1 (n_144), .B1 (n_78), .C1 (n_32), .C2
       (tempmax[3]), .O (n_211));
  OAI112BHD g1511__7410(.A1 (n_145), .B1 (n_72), .C1 (n_31), .C2
       (iend[3]), .O (n_210));
  OAI112BHD g1515__6417(.A1 (n_142), .B1 (n_75), .C1 (n_207), .C2
       (vcutoff[3]), .O (n_209));
  OAI112BHD g1518__5477(.A1 (n_147), .B1 (n_86), .C1 (n_207), .C2
       (vpreset[3]), .O (n_208));
  AN4B1BHD g1470__2398(.I1 (n_205), .I2 (n_173), .I3 (tpreset[14]), .B1
       (n_201), .O (n_206));
  NR2BHD g1445__5107(.I1 (n_234), .I2 (n_182), .O (n_204));
  OR3B2CHD g1477__6260(.I1 (n_191), .B1 (n_205), .B2 (tpreset[10]), .O
       (n_203));
  OR3B2CHD g1480__4319(.I1 (n_201), .B1 (n_205), .B2 (tpreset[12]), .O
       (n_202));
  AN2EHD g1572__8428(.I1 (n_200), .I2 (n_171), .O (n_231));
  OA12EHD g1493__5526(.A1 (n_253), .B1 (current_state[0]), .B2 (n_243),
       .O (n_257));
  MAOI1CHD g1462__6783(.A1 (n_198), .A2 (tpreset[7]), .B1 (tpreset[7]),
       .B2 (n_198), .O (n_199));
  ND2CHD g1643__3680(.I1 (n_205), .I2 (tpreset[8]), .O (n_197));
  MUXB2CHD g1446__1617(.S (n_113), .A (tpreset[6]), .B (n_165), .EB
       (n_234), .O (n_196));
  NR2CHD g1590__2802(.I1 (n_53), .I2 (n_194), .O (n_195));
  AOI22BHD g1605__1705(.A1 (n_133), .A2 (vbat[0]), .B1 (n_163), .B2
       (vbat[1]), .O (n_193));
  NR2BHD g1472__5122(.I1 (n_191), .I2 (n_190), .O (n_192));
  ND2CHD g1606__8246(.I1 (n_188), .I2 (vbat[2]), .O (n_189));
  OAI222BHD g1509__7098(.A1 (n_34), .A2 (n_87), .B1 (n_111), .B2
       (n_149), .C1 (vcutoff[7]), .C2 (n_186), .O (n_187));
  OAI112BHD g1510__6131(.A1 (n_50), .B1 (n_23), .C1 (n_115), .C2
       (n_184), .O (n_185));
  OA13EHD g1618__1881(.A1 (n_112), .B1 (n_178), .B2 (n_176), .B3
       (n_175), .O (n_183));
  MAOI1CHD g1461__5115(.A1 (n_181), .A2 (tpreset[5]), .B1 (tpreset[5]),
       .B2 (n_181), .O (n_182));
  NR2BHD g1443__7482(.I1 (n_140), .I2 (n_234), .O (n_180));
  NR2BHD g1469__4733(.I1 (n_201), .I2 (n_190), .O (n_179));
  AO112EHD g1609__6161(.A1 (n_178), .B1 (n_177), .C1 (n_176), .C2
       (n_175), .O (n_213));
  AN3B2BHD g1478__9315(.I1 (n_173), .B1 (n_190), .B2 (n_201), .O
       (n_174));
  AOI112BHD g1584__9945(.A1 (n_166), .B1 (n_101), .C1 (n_119), .C2
       (n_120), .O (n_172));
  ND2CHD g1585__2883(.I1 (n_168), .I2 (vbat[6]), .O (n_171));
  NR2BHD g1586__2346(.I1 (vbat[5]), .I2 (n_157), .O (n_170));
  NR2BHD g1587__1666(.I1 (vbat[6]), .I2 (n_168), .O (n_169));
  OAI222BHD g1589__7410(.A1 (n_166), .A2 (n_92), .B1 (n_10), .B2
       (n_19), .C1 (n_47), .C2 (n_165), .O (n_167));
  NR2BHD g1603__6417(.I1 (vbat[1]), .I2 (n_163), .O (n_164));
  OA13EHD g1602__5477(.A1 (n_121), .B1 (n_161), .B2 (n_160), .B3
       (n_159), .O (n_162));
  ND2CHD g1601__2398(.I1 (n_158), .I2 (vbat[3]), .O (n_220));
  ND2CHD g1600__5107(.I1 (n_157), .I2 (vbat[5]), .O (n_218));
  MUXB2CHD g1441__6260(.S (tpreset[1]), .A (tpreset[0]), .B (n_2), .EB
       (n_234), .O (n_156));
  OAI112BHD g1508__4319(.A1 (n_96), .B1 (n_21), .C1 (n_95), .C2
       (n_131), .O (n_155));
  MUXB2CHD g1442__8428(.S (n_57), .A (n_58), .B (tpreset[2]), .EB
       (n_234), .O (n_154));
  NR2BHD g1439__5526(.I1 (tpreset[0]), .I2 (n_234), .O (n_153));
  OAI112BHD g1507__6783(.A1 (n_102), .B1 (n_29), .C1 (n_90), .C2
       (n_151), .O (n_152));
  AOI112BHD g1516__3680(.A1 (n_149), .B1 (n_110), .C1 (n_216), .C2
       (vcutoff[4]), .O (n_150));
  AO12EHD g1614__1617(.A1 (n_148), .B1 (n_122), .B2 (n_123), .O
       (n_194));
  INVDHD g1646(.I (n_190), .O (n_205));
  OAI112BHD g1544__2802(.A1 (n_67), .B1 (n_85), .C1 (n_84), .C2
       (vbat[2]), .O (n_147));
  MUXB2CHD g1444__1705(.S (n_138), .A (n_109), .B (tpreset[4]), .EB
       (n_234), .O (n_146));
  OAI112BHD g1539__5122(.A1 (n_83), .B1 (n_71), .C1 (n_70), .C2
       (ibat[2]), .O (n_145));
  OAI112BHD g1540__8246(.A1 (n_65), .B1 (n_77), .C1 (n_76), .C2
       (tbat[2]), .O (n_144));
  OAI112BHD g1541__7098(.A1 (n_82), .B1 (n_80), .C1 (n_79), .C2
       (tempmin[2]), .O (n_143));
  OAI112BHD g1545__6131(.A1 (n_66), .B1 (n_74), .C1 (n_73), .C2
       (vbat[2]), .O (n_142));
  OR2EHD g1594__1881(.I1 (n_186), .I2 (n_141), .O (n_200));
  AO12CHD g1505__5115(.A1 (n_39), .B1 (n_361), .B2 (n_129), .O (n_243));
  MAOI1CHD g1459__7482(.A1 (n_139), .A2 (tpreset[3]), .B1 (tpreset[3]),
       .B2 (n_139), .O (n_140));
  OR3EHD g1479__4733(.I1 (n_165), .I2 (n_125), .I3 (n_138), .O (n_198));
  AOI22BHD g1623__6161(.A1 (n_137), .A2 (vpreset[2]), .B1 (n_136), .B2
       (vcutoff[2]), .O (n_188));
  AOI22BHD g1620__9315(.A1 (n_137), .A2 (vpreset[5]), .B1 (n_136), .B2
       (vcutoff[5]), .O (n_157));
  MOAI1CHD g1621__9945(.A1 (n_136), .A2 (n_126), .B1 (n_136), .B2
       (vcutoff[4]), .O (n_217));
  AOI22BHD g1622__2883(.A1 (n_137), .A2 (vpreset[3]), .B1 (n_136), .B2
       (vcutoff[3]), .O (n_158));
  AOI22BHD g1608__2346(.A1 (n_137), .A2 (vpreset[6]), .B1 (n_136), .B2
       (vcutoff[6]), .O (n_168));
  OR2CHD g1428__1666(.I1 (n_60), .I2 (cc), .O (imonen));
  AOI22BHD g1630__7410(.A1 (n_137), .A2 (vpreset[0]), .B1 (n_136), .B2
       (vcutoff[0]), .O (n_133));
  AOI112BHD g1513__6417(.A1 (n_131), .B1 (n_94), .C1 (n_93), .C2
       (tempmax[4]), .O (n_132));
  OAI12CHD g1538__5477(.A1 (n_69), .B1 (n_129), .B2 (vpreset[5]), .O
       (n_130));
  OA112CHD g1519__2398(.A1 (n_127), .B1 (n_68), .C1 (n_126), .C2
       (vbat[4]), .O (n_128));
  AOI22BHD g1631__5107(.A1 (n_137), .A2 (vpreset[1]), .B1 (n_136), .B2
       (vcutoff[1]), .O (n_163));
  OR3EHD g1647__6260(.I1 (n_17), .I2 (n_125), .I3 (n_138), .O (n_190));
  OR2EHD g1624__4319(.I1 (n_123), .I2 (n_122), .O (n_124));
  ND2DHD g1611__8428(.I1 (n_105), .I2 (n_106), .O (n_121));
  OAI112BHD g1613__5526(.A1 (n_118), .B1 (n_28), .C1 (tpreset[1]), .C2
       (tmax[1]), .O (n_120));
  AOI22BHD g1619__6783(.A1 (n_118), .A2 (n_27), .B1 (tpreset[2]), .B2
       (tmax[2]), .O (n_119));
  MUX2CHD g1607__3680(.S (n_137), .A (vcutoff[7]), .B (vpreset[7]), .O
       (n_141));
  AN2EHD g1615__1617(.I1 (n_117), .I2 (n_116), .O (n_177));
  AO12EHD g1460__2802(.A1 (n_265), .B1 (n_97), .B2 (current_state[0]),
       .O (n_234));
  AOI22BHD g1535__1705(.A1 (n_14), .A2 (n_114), .B1 (n_33), .B2
       (ibat[5]), .O (n_115));
  NR2BHD g1471__5122(.I1 (n_125), .I2 (n_138), .O (n_113));
  ND2DHD g1629__8246(.I1 (n_103), .I2 (n_104), .O (n_112));
  OA13CHD g1537__7098(.A1 (n_37), .B1 (n_110), .B2 (n_216), .B3
       (vcutoff[4]), .O (n_111));
  OR2EHD g1644__6131(.I1 (n_109), .I2 (n_138), .O (n_181));
  AN2EHD g1632__1881(.I1 (n_108), .I2 (n_107), .O (n_148));
  NR2CHD g1633__5115(.I1 (n_106), .I2 (n_105), .O (n_161));
  NR2CHD g1640__7482(.I1 (n_104), .I2 (n_103), .O (n_178));
  OR3B2CHD g1526__4733(.I1 (tbat[6]), .B1 (n_43), .B2 (tempmin[6]), .O
       (n_102));
  OAI12CHD g1612__6161(.A1 (n_41), .B1 (tpreset[3]), .B2 (tmax[3]), .O
       (n_101));
  AOI13BHD g1617__9315(.A1 (n_12), .B1 (n_52), .B2 (tpreset[7]), .B3
       (tmax[7]), .O (n_100));
  OR2B1CHD g1429__9945(.I1 (n_98), .B1 (n_97), .O (vmonen));
  OR3B2CHD g1524__2883(.I1 (tempmax[6]), .B1 (n_46), .B2 (tbat[6]), .O
       (n_96));
  OA13CHD g1525__2346(.A1 (n_25), .B1 (n_94), .B2 (n_93), .B3
       (tempmax[4]), .O (n_95));
  MAOI1CHD g1610__1666(.A1 (tpreset[4]), .A2 (tmax[4]), .B1 (n_22), .B2
       (n_40), .O (n_92));
  AOI13BHD g1533__6417(.A1 (n_26), .B1 (n_89), .B2 (n_93), .B3
       (tempmin[4]), .O (n_90));
  NR2BHD g1426__5477(.I1 (current_state[0]), .I2 (n_97), .O (tc));
  NR2BHD g1448__2398(.I1 (n_252), .I2 (n_97), .O (cc));
  AO12CHD g1532__5107(.A1 (n_87), .B1 (n_49), .B2 (vcutoff[6]), .O
       (n_149));
  ND3CHD g1563__6260(.I1 (n_85), .I2 (n_84), .I3 (vbat[2]), .O (n_86));
  MAO222CHD g1571__4319(.A1 (n_20), .B1 (n_5), .C1 (ibat[1]), .O
       (n_83));
  MAO222CHD g1559__8428(.A1 (n_13), .B1 (n_7), .C1 (tempmin[1]), .O
       (n_82));
  ND3CHD g1560__5526(.I1 (n_80), .I2 (n_79), .I3 (tempmin[2]), .O
       (n_81));
  ND3CHD g1561__6783(.I1 (n_77), .I2 (n_76), .I3 (tbat[2]), .O (n_78));
  ND3CHD g1562__3680(.I1 (n_74), .I2 (n_73), .I3 (vbat[2]), .O (n_75));
  ND3CHD g1547__1617(.I1 (n_71), .I2 (n_70), .I3 (ibat[2]), .O (n_72));
  ND3CHD g1564__2802(.I1 (n_68), .I2 (n_126), .I3 (vbat[4]), .O (n_69));
  MAO222CHD g1568__1705(.A1 (n_15), .B1 (n_0), .C1 (vbat[1]), .O
       (n_67));
  MAO222CHD g1569__5122(.A1 (n_16), .B1 (n_6), .C1 (vbat[1]), .O
       (n_66));
  MAO222CHD g1570__8246(.A1 (n_18), .B1 (n_4), .C1 (tbat[1]), .O
       (n_65));
  OR3EHD g1486__7098(.I1 (n_64), .I2 (n_63), .I3 (n_191), .O (n_201));
  AN2CHD g1431__1881(.I1 (n_60), .I2 (current_state[2]), .O (cv));
  MXL2CHD g1660__5115(.S (tmax[4]), .A (tpreset[12]), .B (n_59), .OB
       (n_105));
  OR2EHD g1645__7482(.I1 (n_58), .I2 (n_57), .O (n_139));
  MUX2EHD g1665__4733(.S (tmax[3]), .A (tpreset[11]), .B (n_63), .O
       (n_160));
  MXL2CHD g1661__9315(.S (tmax[5]), .A (n_56), .B (tpreset[13]), .OB
       (n_176));
  MXL2CHD g1662__9945(.S (tmax[7]), .A (n_55), .B (so), .OB (n_117));
  MUX2EHD g1663__2883(.S (tmax[1]), .A (tpreset[9]), .B (n_54), .O
       (n_122));
  OR3B2CHD g1648__2346(.I1 (n_57), .B1 (tpreset[2]), .B2 (tpreset[3]),
       .O (n_138));
  INVDHD g1641(.I (n_137), .O (n_136));
  OAI12CHD g1604__1666(.A1 (n_52), .B1 (tpreset[7]), .B2 (tmax[7]), .O
       (n_53));
  OR2B1CHD g1430__7410(.I1 (n_60), .B1 (current_state[2]), .O (tmonen));
  ND3CHD g1534__6417(.I1 (n_45), .I2 (n_44), .I3 (ibat[6]), .O (n_50));
  MUX2EHD g1667__5477(.S (tmax[2]), .A (tpreset[10]), .B (n_64), .O
       (n_108));
  AOI22BHD g1528__2398(.A1 (n_49), .A2 (vpreset[6]), .B1 (n_186), .B2
       (vpreset[7]), .O (n_127));
  OAI22CHD g1666__5107(.A1 (tmax[6]), .A2 (tpreset[14]), .B1 (n_48),
       .B2 (n_47), .O (n_103));
  OAI12CHD g1530__6260(.A1 (n_46), .B1 (n_9), .B2 (tbat[6]), .O
       (n_131));
  OAI12CHD g1531__4319(.A1 (n_45), .B1 (n_44), .B2 (ibat[6]), .O
       (n_184));
  OAI12CHD g1529__8428(.A1 (n_43), .B1 (n_3), .B2 (tempmin[6]), .O
       (n_151));
  AO12EHD g1668__5526(.A1 (n_98), .B1 (current_state[2]), .B2
       (current_state[0]), .O (n_253));
  OAI12CHD g1669__6783(.A1 (n_42), .B1 (current_state[2]), .B2
       (current_state[1]), .O (n_265));
  INVDHD g1637(.I (n_40), .O (n_41));
  OAI112BHD g1517__3680(.A1 (vbat[7]), .B1 (vbat[6]), .C1 (vbat[5]),
       .C2 (vbat[4]), .O (n_39));
  NR2BHD g1552__1617(.I1 (vpreset[6]), .I2 (n_49), .O (n_38));
  OR2CHD g1550__2802(.I1 (vcutoff[5]), .I2 (n_129), .O (n_37));
  OR2CHD g1549__1705(.I1 (tempmin[4]), .I2 (n_93), .O (n_36));
  ND2CHD g1652__5122(.I1 (tpreset[14]), .I2 (n_47), .O (n_116));
  OAI22CHD g1616__8246(.A1 (tmax[5]), .A2 (tpreset[5]), .B1
       (tpreset[6]), .B2 (tmax[6]), .O (n_166));
  NR2CHD g1654__7098(.I1 (tmax[3]), .I2 (n_63), .O (n_106));
  OR2B1CHD g1638__6131(.I1 (tmax[2]), .B1 (n_58), .O (n_118));
  NR2CHD g1653__1881(.I1 (tmax[5]), .I2 (n_56), .O (n_104));
  ND2DHD g1473__5115(.I1 (n_244), .I2 (current_state[1]), .O (n_97));
  NR2CHD g1642__7482(.I1 (current_state[2]), .I2 (n_252), .O (n_137));
  ND2CHD g1555__4733(.I1 (n_186), .I2 (vpreset[7]), .O (n_35));
  OR2CHD g1553__6161(.I1 (vcutoff[6]), .I2 (n_49), .O (n_34));
  OR2CHD g1577__9315(.I1 (ibat[5]), .I2 (n_33), .O (n_114));
  NR2CHD g1491__9945(.I1 (n_59), .I2 (n_56), .O (n_173));
  ND2CHD g1575__2883(.I1 (n_129), .I2 (vpreset[5]), .O (n_68));
  ND2CHD g1576__2346(.I1 (n_32), .I2 (tempmax[3]), .O (n_77));
  AN2CHD g1554__1666(.I1 (n_186), .I2 (vcutoff[7]), .O (n_87));
  ND2CHD g1578__7410(.I1 (n_31), .I2 (iend[3]), .O (n_71));
  ND2CHD g1579__6417(.I1 (n_30), .I2 (tbat[3]), .O (n_80));
  ND2CHD g1581__5477(.I1 (n_207), .I2 (vpreset[3]), .O (n_85));
  ND2CHD g1582__2398(.I1 (n_207), .I2 (vcutoff[3]), .O (n_74));
  AN2CHD g1583__5107(.I1 (n_129), .I2 (vcutoff[5]), .O (n_110));
  OR2B1CHD g1527__6260(.I1 (tbat[7]), .B1 (tempmin[7]), .O (n_29));
  AN2EHD g1626__4319(.I1 (tpreset[0]), .I2 (tmax[0]), .O (n_28));
  AN2EHD g1635__8428(.I1 (tpreset[1]), .I2 (tmax[1]), .O (n_27));
  AN2B1CHD g1551__5526(.I1 (tempmin[5]), .B1 (tbat[5]), .O (n_26));
  OR2B1CHD g1548__6783(.I1 (tempmax[5]), .B1 (tbat[5]), .O (n_25));
  OR2B1CHD g1546__3680(.I1 (ibat[4]), .B1 (iend[4]), .O (n_24));
  OR2B1CHD g1522__1617(.I1 (iend[7]), .B1 (ibat[7]), .O (n_23));
  ND2DHD g1634__2802(.I1 (tpreset[3]), .I2 (tmax[3]), .O (n_22));
  OR2B1CHD g1523__1705(.I1 (tempmax[7]), .B1 (tbat[7]), .O (n_21));
  ND2CHD g1636__5122(.I1 (tpreset[8]), .I2 (tmax[0]), .O (n_52));
  OR2B1CHD g1655__8246(.I1 (tmax[1]), .B1 (tpreset[9]), .O (n_107));
  OR2B1CHD g1656__7098(.I1 (tmax[4]), .B1 (tpreset[12]), .O (n_175));
  OR2B1CHD g1557__6131(.I1 (tempmin[7]), .B1 (tbat[7]), .O (n_43));
  OR2B1CHD g1657__1881(.I1 (tmax[7]), .B1 (so), .O (n_250));
  NR2CHD g1639__5115(.I1 (tmax[4]), .I2 (tpreset[4]), .O (n_40));
  OR2B1CHD g1556__7482(.I1 (ibat[7]), .B1 (iend[7]), .O (n_45));
  NR2CHD g1670__4733(.I1 (current_state[2]), .I2 (current_state[0]), .O
       (n_98));
  NR2BHD g1658__6161(.I1 (current_state[1]), .I2 (current_state[0]), .O
       (n_60));
  OR2B1CHD g1596__9315(.I1 (ibat[0]), .B1 (iend[0]), .O (n_20));
  ND2DHD g1625__9945(.I1 (tpreset[5]), .I2 (tmax[5]), .O (n_19));
  OR2B1CHD g1599__2883(.I1 (tbat[0]), .B1 (tempmax[0]), .O (n_18));
  ND2CHD g1650__2346(.I1 (tpreset[6]), .I2 (tpreset[7]), .O (n_17));
  OR2B1CHD g1598__1666(.I1 (vbat[0]), .B1 (vcutoff[0]), .O (n_16));
  OR2B1CHD g1597__7410(.I1 (vbat[0]), .B1 (vpreset[0]), .O (n_15));
  AN2B1CHD g1573__6417(.I1 (ibat[4]), .B1 (iend[4]), .O (n_14));
  OR2B1CHD g1595__5477(.I1 (tempmin[0]), .B1 (tbat[0]), .O (n_13));
  NR2CHD g1627__2398(.I1 (tmax[0]), .I2 (tpreset[8]), .O (n_12));
  NR2BHD g1628__6260(.I1 (tmax[6]), .I2 (tpreset[6]), .O (n_10));
  AN2B1CHD g1574__4319(.I1 (tempmax[5]), .B1 (tbat[5]), .O (n_94));
  OR2B1CHD g1580__8428(.I1 (tempmin[5]), .B1 (tbat[5]), .O (n_89));
  OR2B1CHD g1558__5526(.I1 (tbat[7]), .B1 (tempmax[7]), .O (n_46));
  OR2B1CHD g1651__6783(.I1 (tmax[2]), .B1 (tpreset[10]), .O (n_159));
  ND2CHD g1671__3680(.I1 (current_state[1]), .I2 (current_state[2]), .O
       (n_42));
  ND2CHD g1492__1617(.I1 (tpreset[8]), .I2 (tpreset[9]), .O (n_191));
  ND2CHD g1659__2802(.I1 (tpreset[0]), .I2 (tpreset[1]), .O (n_57));
  ND2CHD g1649__1705(.I1 (tpreset[4]), .I2 (tpreset[5]), .O (n_125));
  INVCKDHD g1674(.I (tempmax[6]), .O (n_9));
  INVCKDHD g1698(.I (vpreset[7]), .O (n_8));
  INVCKDHD g1700(.I (tbat[1]), .O (n_7));
  INVCKDHD g1679(.I (vcutoff[1]), .O (n_6));
  INVCKDHD g1694(.I (iend[1]), .O (n_5));
  INVCKDHD g1696(.I (vcutoff[2]), .O (n_73));
  INVDHD g1707(.I (tpreset[14]), .O (n_48));
  INVCKDHD g1677(.I (iend[5]), .O (n_33));
  INVCKDHD g1699(.I (tbat[2]), .O (n_79));
  INVCKDHD g1695(.I (ibat[3]), .O (n_31));
  INVDHD g1703(.I (so), .O (n_55));
  INVCKDHD g1680(.I (vpreset[2]), .O (n_84));
  INVCKDHD g1678(.I (iend[2]), .O (n_70));
  INVCKDHD g1701(.I (tbat[3]), .O (n_32));
  INVDHD g1709(.I (tpreset[12]), .O (n_59));
  INVCKDHD g1702(.I (tmax[6]), .O (n_47));
  INVDHD g1706(.I (tpreset[2]), .O (n_58));
  INVCKDHD g1689(.I (vbat[4]), .O (n_216));
  INVDHD g1686(.I (tpreset[11]), .O (n_63));
  INVCKDHD g1688(.I (vbat[7]), .O (n_186));
  INVCKDHD g1672(.I (tempmax[1]), .O (n_4));
  INVCKDHD g1683(.I (tbat[6]), .O (n_3));
  INVDHD g1684(.I (tpreset[0]), .O (n_2));
  INVCKDHD g1681(.I (vpreset[1]), .O (n_0));
  INVCKDHD g1675(.I (tempmin[3]), .O (n_30));
  INVDHD g1704(.I (tpreset[9]), .O (n_54));
  INVCKDHD g1676(.I (iend[6]), .O (n_44));
  INVCKDHD g1673(.I (tempmax[2]), .O (n_76));
  INVDHD g1685(.I (tpreset[4]), .O (n_109));
  INVCKDHD g1691(.I (tpreset[8]), .O (n_123));
  INVCKDHD g1697(.I (vpreset[4]), .O (n_126));
  INVCKDHD g1687(.I (tpreset[6]), .O (n_165));
  INVDHD g1690(.I (tpreset[10]), .O (n_64));
  INVDHD g1705(.I (tpreset[13]), .O (n_56));
  INVCKDHD g1708(.I (vbat[6]), .O (n_49));
  INVDHD g1712(.I (current_state[2]), .O (n_244));
  INVCKDHD g1710(.I (vbat[3]), .O (n_207));
  INVCKDHD g1682(.I (tbat[4]), .O (n_93));
  INVCKDHD g1692(.I (vbat[5]), .O (n_129));
  INVDHD g1693(.I (current_state[0]), .O (n_252));
  OAI12CHD g2(.A1 (n_278), .B1 (n_275), .B2 (current_state[1]), .O
       (n_357));
  OAI12CHD g1733(.A1 (n_363), .B1 (n_262), .B2 (current_state[1]), .O
       (n_358));
  OAI13BHD g1734(.A1 (n_364), .B1 (n_261), .B2 (n_247), .B3
       (current_state[1]), .O (n_359));
  OA12EHD g1735(.A1 (n_269), .B1 (n_270), .B2 (n_252), .O (n_360));
  AOI13BHD g1736(.A1 (vbat[3]), .B1 (vbat[1]), .B2 (vbat[0]), .B3
       (vbat[2]), .O (n_361));
  MXL2CHD g1737(.S (current_state[1]), .A (n_252), .B
       (current_state[0]), .OB (n_362));
  OAI112BHD g1738(.A1 (n_267), .B1 (n_266), .C1 (n_243), .C2
       (current_state[0]), .O (n_363));
  AO112EHD g1739(.A1 (n_265), .B1 (n_257), .C1 (n_260), .C2
       (current_state[0]), .O (n_364));
endmodule

