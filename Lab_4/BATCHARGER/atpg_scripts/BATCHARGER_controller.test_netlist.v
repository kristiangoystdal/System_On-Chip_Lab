
// Generated by Cadence Genus(TM) Synthesis Solution 19.14-s108_1
// Generated on: Dec 17 2024 11:02:22 WET (Dec 17 2024 11:02:22 UTC)

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
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_11, n_12, n_13, n_14, n_15, n_16;
  wire n_17, n_18, n_19, n_20, n_23, n_24, n_25, n_26;
  wire n_27, n_28, n_29, n_30, n_31, n_32, n_33, n_34;
  wire n_35, n_37, n_38, n_39, n_40, n_41, n_42, n_43;
  wire n_44, n_45, n_46, n_47, n_48, n_49, n_50, n_51;
  wire n_52, n_53, n_54, n_55, n_56, n_57, n_58, n_59;
  wire n_60, n_61, n_62, n_63, n_64, n_65, n_66, n_67;
  wire n_68, n_69, n_70, n_71, n_72, n_73, n_74, n_75;
  wire n_76, n_77, n_78, n_79, n_82, n_83, n_84, n_85;
  wire n_86, n_87, n_88, n_89, n_90, n_91, n_92, n_93;
  wire n_95, n_96, n_97, n_98, n_100, n_101, n_102, n_103;
  wire n_104, n_105, n_106, n_107, n_108, n_109, n_110, n_111;
  wire n_112, n_113, n_114, n_115, n_116, n_117, n_118, n_119;
  wire n_121, n_122, n_123, n_124, n_125, n_126, n_127, n_128;
  wire n_129, n_130, n_131, n_132, n_133, n_135, n_136, n_137;
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
  wire n_218, n_219, n_220, n_221, n_222, n_223, n_224, n_226;
  wire n_227, n_228, n_229, n_230, n_231, n_232, n_233, n_234;
  wire n_235, n_236, n_237, n_238, n_239, n_240, n_241, n_242;
  wire n_243, n_244, n_245, n_246, n_247, n_248, n_249, n_250;
  wire n_251, n_252, n_253, n_254, n_255, n_256, n_257, n_258;
  wire n_259, n_260, n_261, n_262, n_264, n_265, n_266, n_267;
  wire n_268, n_269, n_270, n_271, n_272, n_274, n_275, n_277;
  wire n_356, n_357, n_358, n_359, n_360;
  assign tmonen = imonen;
  assign vmonen = imonen;
  QDFZHHD \current_state_reg[0] (.CK (clk), .D (n_277), .TD (si), .SEL
       (se), .Q (current_state[0]));
  DFZCRBEHD \current_state_reg[1] (.CK (clk), .D (n_360), .RB (vtok),
       .TD (current_state[0]), .SEL (se), .Q (current_state[1]), .QB
       (n_15));
  DFZCRBEHD \current_state_reg[2] (.CK (clk), .D (n_274), .RB (rstz),
       .TD (n_15), .SEL (se), .Q (current_state[2]), .QB (n_14));
  AN4CHD g1489__2398(.I1 (vtok), .I2 (rstz), .I3 (n_275), .I4 (n_271),
       .O (n_277));
  OAI112BHD g1505__6260(.A1 (n_269), .B1 (current_state[2]), .C1
       (n_268), .C2 (current_state[0]), .O (n_275));
  AN4B1BHD g1491__4319(.I1 (n_264), .I2 (n_267), .I3 (vtok), .B1
       (n_131), .O (n_274));
  OAI222BHD g1503__5526(.A1 (n_270), .A2 (n_262), .B1
       (current_state[1]), .B2 (n_254), .C1 (current_state[1]), .C2
       (n_270), .O (n_271));
  OR2B1CHD g1507__6783(.I1 (n_268), .B1 (n_260), .O (n_269));
  OAI22CHD g1519__3680(.A1 (n_265), .A2 (n_259), .B1
       (current_state[1]), .B2 (n_250), .O (n_267));
  OAI22CHD g1518__1617(.A1 (n_256), .A2 (n_266), .B1 (n_266), .B2
       (n_265), .O (n_272));
  OR2B1CHD g1506__2802(.I1 (n_135), .B1 (n_356), .O (n_264));
  MOAI1CHD g1520__1705(.A1 (n_261), .A2 (current_state[0]), .B1
       (n_261), .B2 (current_state[0]), .O (n_262));
  OA112EHD g1523__5122(.A1 (n_253), .B1 (n_64), .C1 (n_241), .C2
       (n_175), .O (n_268));
  NR2BHD g1530__7098(.I1 (current_state[2]), .I2 (n_261), .O (n_259));
  OAI22CHD g1531__6131(.A1 (n_257), .A2 (n_258), .B1 (n_257), .B2
       (current_state[0]), .O (n_266));
  ND2DHD g1525__1881(.I1 (n_255), .I2 (n_254), .O (n_256));
  MOAI1CHD g1535__5115(.A1 (n_252), .A2 (n_251), .B1 (n_252), .B2
       (n_251), .O (n_253));
  INVCKDHD g1541(.I (n_258), .O (n_261));
  QDFZHHD \tpreset_reg[14] (.CK (clk), .D (n_247), .TD (n_12), .SEL
       (se), .Q (tpreset[14]));
  AO2222CHD g1545__7482(.A1 (n_248), .A2 (n_234), .B1 (n_202), .B2
       (n_193), .C1 (n_186), .C2 (n_187), .D1 (n_233), .D2 (n_218), .O
       (n_258));
  DFZCRBEHD \tpreset_reg[11] (.CK (clk), .D (n_240), .RB (n_249), .TD
       (n_8), .SEL (se), .Q (tpreset[11]), .QB (n_13));
  AN4B1BHD g1534__4733(.I1 (n_246), .I2 (n_213), .I3 (n_250), .B1
       (n_194), .O (n_254));
  DFZCRBEHD \tpreset_reg[13] (.CK (clk), .D (n_238), .RB (n_249), .TD
       (n_9), .SEL (se), .Q (tpreset[13]), .QB (n_12));
  AOI112BHD g1559__6161(.A1 (n_245), .B1 (n_229), .C1 (n_244), .C2
       (n_207), .O (n_252));
  DFZCRBEHD \tpreset_reg[9] (.CK (clk), .D (n_236), .RB (n_249), .TD
       (n_7), .SEL (se), .Q (tpreset[9]), .QB (n_11));
  DFZCRBEHD \tpreset_reg[15] (.CK (clk), .D (n_226), .RB (n_249), .TD
       (tpreset[14]), .SEL (se), .Q (tpreset[15]), .QB (so));
  DFZCRBEHD \tpreset_reg[12] (.CK (clk), .D (n_228), .RB (n_249), .TD
       (n_13), .SEL (se), .Q (tpreset[12]), .QB (n_9));
  DFZCRBEHD \tpreset_reg[10] (.CK (clk), .D (n_232), .RB (n_249), .TD
       (n_11), .SEL (se), .Q (tpreset[10]), .QB (n_8));
  DFZCRBEHD \tpreset_reg[8] (.CK (clk), .D (n_222), .RB (n_249), .TD
       (n_6), .SEL (se), .Q (tpreset[8]), .QB (n_7));
  OAI112BHD g1562__9315(.A1 (n_230), .B1 (n_220), .C1 (n_168), .C2
       (vbat[3]), .O (n_248));
  MUXB2CHD g1488__9945(.S (n_223), .A (tpreset[14]), .B (n_143), .EB
       (n_214), .O (n_247));
  NR2BHD g1548__2883(.I1 (n_196), .I2 (n_242), .O (n_246));
  DFZCRBEHD \tpreset_reg[7] (.CK (clk), .D (n_249), .RB (n_204), .TD
       (tpreset[6]), .SEL (se), .Q (tpreset[7]), .QB (n_6));
  OA112EHD g1561__2346(.A1 (n_244), .B1 (n_189), .C1 (n_197), .C2
       (n_184), .O (n_245));
  DFZCRBEHD \tpreset_reg[5] (.CK (clk), .D (n_249), .RB (n_200), .TD
       (n_3), .SEL (se), .Q (tpreset[5]), .QB (n_5));
  AO2222BHD g1529__1666(.A1 (n_206), .A2 (n_147), .B1 (n_54), .B2
       (n_57), .C1 (n_137), .C2 (vbat[7]), .D1 (n_146), .D2 (n_153), .O
       (n_243));
  AO2222BHD g1532__7410(.A1 (n_208), .A2 (n_141), .B1 (n_53), .B2
       (n_60), .C1 (n_136), .C2 (vbat[7]), .D1 (n_140), .D2 (n_151), .O
       (n_260));
  QDFZHHD \tpreset_reg[6] (.CK (clk), .D (n_215), .TD (n_5), .SEL (se),
       .Q (tpreset[6]));
  AN4B1BHD g1566__6417(.I1 (n_212), .I2 (n_129), .I3 (n_27), .B1
       (n_195), .O (n_242));
  AN4B1BHD g1533__5477(.I1 (n_209), .I2 (n_122), .I3 (n_39), .B1
       (n_174), .O (n_241));
  MOAI1CHD g1497__2398(.A1 (n_239), .A2 (tpreset[11]), .B1 (n_239), .B2
       (tpreset[11]), .O (n_240));
  MOAI1CHD g1498__5107(.A1 (n_237), .A2 (tpreset[13]), .B1 (n_237), .B2
       (tpreset[13]), .O (n_238));
  MOAI1CHD g1492__6260(.A1 (n_235), .A2 (tpreset[9]), .B1 (n_235), .B2
       (tpreset[9]), .O (n_236));
  AN3EHD g1575__4319(.I1 (n_233), .I2 (n_217), .I3 (n_190), .O (n_234));
  DFZCRBEHD \tpreset_reg[3] (.CK (clk), .D (n_249), .RB (n_159), .TD
       (n_1), .SEL (se), .Q (tpreset[3]), .QB (n_4));
  DFZCRBEHD \tpreset_reg[4] (.CK (clk), .D (n_249), .RB (n_164), .TD
       (n_4), .SEL (se), .Q (tpreset[4]), .QB (n_3));
  MOAI1CHD g1500__8428(.A1 (n_231), .A2 (tpreset[10]), .B1 (n_231), .B2
       (tpreset[10]), .O (n_232));
  OAI112BHD g1589__5526(.A1 (n_219), .B1 (n_179), .C1 (n_198), .C2
       (n_181), .O (n_230));
  OAI222BHD g1588__6783(.A1 (n_216), .A2 (n_157), .B1 (n_185), .B2
       (n_172), .C1 (n_82), .C2 (n_83), .O (n_229));
  MOAI1CHD g1501__3680(.A1 (n_227), .A2 (tpreset[12]), .B1 (n_227), .B2
       (tpreset[12]), .O (n_228));
  MOAI1CHD g1502__1617(.A1 (n_224), .A2 (tpreset[15]), .B1 (n_224), .B2
       (tpreset[15]), .O (n_226));
  NR3BHD g1512__2802(.I1 (n_142), .I2 (n_210), .I3 (n_221), .O (n_223));
  OAI22CHD g1681__1705(.A1 (tpreset[8]), .A2 (n_221), .B1 (n_211), .B2
       (n_138), .O (n_222));
  DFZCRBEHD \tpreset_reg[0] (.CK (clk), .D (n_249), .RB (tpreset[0]),
       .TD (n_14), .SEL (se), .Q (n_2), .QB (tpreset[0]));
  DFZCRBEHD \tpreset_reg[2] (.CK (clk), .D (n_249), .RB (n_357), .TD
       (n_0), .SEL (se), .Q (tpreset[2]), .QB (n_1));
  OR3B1EHD g1611__5122(.I1 (vbat[2]), .I2 (n_178), .B1 (n_219), .O
       (n_220));
  MOAI1CHD g1592__8246(.A1 (n_169), .A2 (vbat[5]), .B1 (n_217), .B2
       (n_177), .O (n_218));
  AOI112BHD g1618__7098(.A1 (n_216), .B1 (n_156), .C1 (n_155), .C2
       (n_154), .O (n_244));
  DFZCRBEHD \tpreset_reg[1] (.CK (clk), .D (n_249), .RB (n_52), .TD
       (n_2), .SEL (se), .Q (tpreset[1]), .QB (n_0));
  MUXB2CHD g1487__6131(.S (n_145), .A (tpreset[6]), .B (n_182), .EB
       (n_214), .O (n_215));
  AO13CHD g1567__1881(.A1 (n_133), .B1 (n_160), .B2 (n_69), .B3 (n_29),
       .O (n_213));
  OAI112BHD g1590__5115(.A1 (n_161), .B1 (n_93), .C1 (n_48), .C2
       (tbat[3]), .O (n_212));
  OR3B2CHD g1511__7482(.I1 (n_201), .B1 (n_211), .B2 (tpreset[10]), .O
       (n_239));
  OR3B2CHD g1514__4733(.I1 (n_210), .B1 (n_211), .B2 (tpreset[12]), .O
       (n_237));
  OAI112BHD g1538__6161(.A1 (n_167), .B1 (n_109), .C1 (n_50), .C2
       (iend[3]), .O (n_209));
  OAI112BHD g1537__9315(.A1 (n_166), .B1 (n_104), .C1 (n_205), .C2
       (vcutoff[3]), .O (n_208));
  OAI222BHD g1617__9945(.A1 (n_85), .A2 (n_188), .B1 (n_139), .B2
       (n_106), .C1 (n_100), .C2 (n_101), .O (n_207));
  OAI112BHD g1539__2883(.A1 (n_165), .B1 (n_115), .C1 (n_205), .C2
       (vpreset[3]), .O (n_206));
  MOAI1CHD g1499__2346(.A1 (n_203), .A2 (tpreset[7]), .B1 (n_203), .B2
       (tpreset[7]), .O (n_204));
  AN2EHD g1594__1666(.I1 (n_202), .I2 (n_192), .O (n_233));
  OR2B1CHD g1508__7410(.I1 (n_210), .B1 (n_211), .O (n_227));
  ND2CHD g1680__6417(.I1 (n_211), .I2 (tpreset[8]), .O (n_235));
  OR2B1CHD g1509__5477(.I1 (n_201), .B1 (n_211), .O (n_231));
  MOAI1CHD g1495__2398(.A1 (n_199), .A2 (tpreset[5]), .B1 (n_199), .B2
       (tpreset[5]), .O (n_200));
  AOI22BHD g1634__5107(.A1 (n_150), .A2 (vbat[0]), .B1 (n_180), .B2
       (vbat[1]), .O (n_198));
  ND2CHD g1513__6260(.I1 (n_211), .I2 (n_144), .O (n_224));
  AOI112BHD g1613__4319(.A1 (n_183), .B1 (n_71), .C1 (n_84), .C2
       (n_121), .O (n_197));
  OAI112BHD g1580__8428(.A1 (n_77), .B1 (n_31), .C1 (n_130), .C2
       (n_195), .O (n_196));
  OAI112BHD g1581__5526(.A1 (n_74), .B1 (n_34), .C1 (n_128), .C2
       (n_132), .O (n_194));
  NR2BHD g1600__6783(.I1 (vbat[6]), .I2 (n_191), .O (n_193));
  ND2CHD g1601__3680(.I1 (n_191), .I2 (vbat[6]), .O (n_192));
  ND2CHD g1602__1617(.I1 (n_176), .I2 (vbat[4]), .O (n_190));
  NR2CHD g1608__2802(.I1 (n_66), .I2 (n_188), .O (n_189));
  INVDHD g1685(.I (n_211), .O (n_221));
  OR2EHD g1605__1705(.I1 (n_187), .I2 (n_186), .O (n_202));
  OA13EHD g1653__5122(.A1 (n_126), .B1 (n_173), .B2 (n_171), .B3
       (n_170), .O (n_185));
  OAI222BHD g1616__8246(.A1 (n_183), .A2 (n_87), .B1 (n_30), .B2
       (n_45), .C1 (n_79), .C2 (n_182), .O (n_184));
  NR2BHD g1621__7098(.I1 (vbat[1]), .I2 (n_180), .O (n_181));
  ND2CHD g1623__6131(.I1 (n_178), .I2 (vbat[2]), .O (n_179));
  NR2BHD g1624__1881(.I1 (vbat[4]), .I2 (n_176), .O (n_177));
  OAI112BHD g1536__5115(.A1 (n_86), .B1 (n_40), .C1 (n_123), .C2
       (n_174), .O (n_175));
  AO112EHD g1638__7482(.A1 (n_173), .B1 (n_172), .C1 (n_171), .C2
       (n_170), .O (n_216));
  ND2CHD g1627__4733(.I1 (n_169), .I2 (vbat[5]), .O (n_217));
  ND2CHD g1626__6161(.I1 (n_168), .I2 (vbat[3]), .O (n_219));
  OAI112BHD g1555__9315(.A1 (n_95), .B1 (n_108), .C1 (n_107), .C2
       (ibat[2]), .O (n_167));
  OAI112BHD g1557__9945(.A1 (n_119), .B1 (n_103), .C1 (n_102), .C2
       (vbat[2]), .O (n_166));
  OAI112BHD g1558__2883(.A1 (n_88), .B1 (n_114), .C1 (n_113), .C2
       (vbat[2]), .O (n_165));
  MOAI1CHD g1683__2346(.A1 (n_163), .A2 (tpreset[4]), .B1 (n_163), .B2
       (tpreset[4]), .O (n_164));
  OR3EHD g1515__1666(.I1 (n_182), .I2 (n_162), .I3 (n_163), .O (n_203));
  NR3BHD g1687__7410(.I1 (n_25), .I2 (n_162), .I3 (n_163), .O (n_211));
  OAI112BHD g1615__6417(.A1 (n_90), .B1 (n_92), .C1 (n_91), .C2
       (tempmin[2]), .O (n_161));
  OAI112BHD g1614__5477(.A1 (n_89), .B1 (n_68), .C1 (n_67), .C2
       (tbat[2]), .O (n_160));
  MOAI1CHD g1494__2398(.A1 (n_158), .A2 (tpreset[3]), .B1 (n_158), .B2
       (tpreset[3]), .O (n_159));
  OA13EHD g1633__5107(.A1 (n_98), .B1 (n_156), .B2 (n_155), .B3
       (n_154), .O (n_157));
  AO12CHD g1540__6260(.A1 (n_61), .B1 (n_358), .B2 (n_152), .O (n_250));
  INVDHD g1490(.I (n_249), .O (n_214));
  OAI12CHD g1554__4319(.A1 (n_112), .B1 (n_152), .B2 (vpreset[5]), .O
       (n_153));
  OAI12CHD g1556__8428(.A1 (n_118), .B1 (n_152), .B2 (vcutoff[5]), .O
       (n_151));
  AOI22BHD g1666__5526(.A1 (n_149), .A2 (vpreset[0]), .B1 (n_148), .B2
       (vcutoff[0]), .O (n_150));
  AOI22BHD g1657__6783(.A1 (n_149), .A2 (vpreset[2]), .B1 (n_148), .B2
       (vcutoff[2]), .O (n_178));
  AOI22BHD g1658__3680(.A1 (n_149), .A2 (vpreset[3]), .B1 (n_148), .B2
       (vcutoff[3]), .O (n_168));
  AOI22BHD g1655__1617(.A1 (n_149), .A2 (vpreset[4]), .B1 (n_148), .B2
       (vcutoff[4]), .O (n_176));
  AOI22BHD g1669__2802(.A1 (n_149), .A2 (vpreset[1]), .B1 (n_148), .B2
       (vcutoff[1]), .O (n_180));
  AOI22BHD g1656__1705(.A1 (n_149), .A2 (vpreset[5]), .B1 (n_148), .B2
       (vcutoff[5]), .O (n_169));
  OA112CHD g1542__5122(.A1 (n_146), .B1 (n_111), .C1 (n_110), .C2
       (vbat[4]), .O (n_147));
  NR2BHD g1510__8246(.I1 (n_162), .I2 (n_163), .O (n_145));
  NR3BHD g1516__7098(.I1 (n_143), .I2 (n_142), .I3 (n_210), .O (n_144));
  OA112CHD g1543__6131(.A1 (n_140), .B1 (n_117), .C1 (n_116), .C2
       (vbat[4]), .O (n_141));
  AO12EHD g1654__1881(.A1 (n_139), .B1 (n_105), .B2 (n_138), .O
       (n_188));
  OR2B1CHD g1682__5115(.I1 (n_163), .B1 (tpreset[4]), .O (n_199));
  AOI22BHD g1636__7482(.A1 (n_149), .A2 (vpreset[6]), .B1 (n_148), .B2
       (vcutoff[6]), .O (n_191));
  OAI22CHD g1637__4733(.A1 (n_137), .A2 (n_148), .B1 (n_149), .B2
       (n_136), .O (n_186));
  AN4B1BHD g1496__6161(.I1 (n_135), .I2 (vtok), .I3 (rstz), .B1
       (n_265), .O (n_249));
  OR3B2CHD g1591__9945(.I1 (n_132), .B1 (n_127), .B2 (n_28), .O
       (n_133));
  NR2CHD g1677__2883(.I1 (n_124), .I2 (n_125), .O (n_173));
  AN2B1CHD g1522__2346(.I1 (n_265), .B1 (n_131), .O (n_270));
  AOI22BHD g1610__1666(.A1 (n_37), .A2 (n_129), .B1 (n_49), .B2
       (tempmin[5]), .O (n_130));
  AOI22BHD g1607__7410(.A1 (n_26), .A2 (n_127), .B1 (n_17), .B2
       (tbat[5]), .O (n_128));
  ND2DHD g1667__6417(.I1 (n_125), .I2 (n_124), .O (n_126));
  AOI22BHD g1546__5477(.A1 (n_41), .A2 (n_122), .B1 (n_51), .B2
       (ibat[5]), .O (n_123));
  OAI112BHD g1651__2398(.A1 (n_59), .B1 (n_44), .C1 (tpreset[1]), .C2
       (tmax[1]), .O (n_121));
  MAO222CHD g1577__6260(.A1 (n_35), .B1 (n_23), .C1 (vbat[1]), .O
       (n_119));
  ND3CHD g1576__4319(.I1 (n_117), .I2 (n_116), .I3 (vbat[4]), .O
       (n_118));
  ND3CHD g1574__8428(.I1 (n_114), .I2 (n_113), .I3 (vbat[2]), .O
       (n_115));
  ND3CHD g1573__5526(.I1 (n_111), .I2 (n_110), .I3 (vbat[4]), .O
       (n_112));
  ND3CHD g1563__6783(.I1 (n_108), .I2 (n_107), .I3 (ibat[2]), .O
       (n_109));
  OR2EHD g1665__3680(.I1 (n_138), .I2 (n_105), .O (n_106));
  ND3CHD g1572__1617(.I1 (n_103), .I2 (n_102), .I3 (vbat[2]), .O
       (n_104));
  AN2EHD g1670__2802(.I1 (n_101), .I2 (n_100), .O (n_139));
  ND2CHD g1684__1705(.I1 (n_359), .I2 (tpreset[2]), .O (n_158));
  NR2CHD g1668__5122(.I1 (n_96), .I2 (n_97), .O (n_156));
  ND3CHD g1688__8246(.I1 (n_359), .I2 (tpreset[2]), .I3 (tpreset[3]),
       .O (n_163));
  ND2DHD g1639__7098(.I1 (n_97), .I2 (n_96), .O (n_98));
  MAO222CHD g1579__6131(.A1 (n_32), .B1 (n_19), .C1 (ibat[1]), .O
       (n_95));
  NR2BHD g1476__1881(.I1 (n_63), .I2 (n_148), .O (cc));
  ND3CHD g1631__5115(.I1 (n_92), .I2 (n_91), .I3 (tempmin[2]), .O
       (n_93));
  MAO222CHD g1632__7482(.A1 (n_46), .B1 (n_20), .C1 (tempmin[1]), .O
       (n_90));
  MAO222CHD g1635__4733(.A1 (n_47), .B1 (n_18), .C1 (tbat[1]), .O
       (n_89));
  MAO222CHD g1578__6161(.A1 (n_33), .B1 (n_24), .C1 (vbat[1]), .O
       (n_88));
  AOI22BHD g1652__9315(.A1 (n_70), .A2 (n_42), .B1 (tpreset[4]), .B2
       (tmax[4]), .O (n_87));
  OR3B2CHD g1549__9945(.I1 (iend[6]), .B1 (n_78), .B2 (ibat[6]), .O
       (n_86));
  AOI13BHD g1649__2883(.A1 (n_43), .B1 (n_65), .B2 (tpreset[7]), .B3
       (tmax[7]), .O (n_85));
  MAOI1CHD g1650__2346(.A1 (tpreset[2]), .A2 (tmax[2]), .B1 (n_38), .B2
       (n_58), .O (n_84));
  AN2EHD g1645__1666(.I1 (n_83), .I2 (n_82), .O (n_172));
  AN2CHD g1478__7410(.I1 (n_131), .I2 (current_state[1]), .O (tc));
  NR3BHD g1477__6417(.I1 (current_state[0]), .I2 (current_state[1]),
       .I3 (n_255), .O (cv));
  MUX2EHD g1701__5477(.S (tmax[3]), .A (tpreset[11]), .B (n_56), .O
       (n_155));
  OAI22CHD g1706__2398(.A1 (tmax[6]), .A2 (tpreset[14]), .B1 (n_143),
       .B2 (n_79), .O (n_125));
  OAI12CHD g1606__5107(.A1 (n_73), .B1 (n_72), .B2 (tbat[6]), .O
       (n_132));
  MXL2CHD g1700__6260(.S (tmax[5]), .A (n_55), .B (tpreset[13]), .OB
       (n_171));
  OAI12CHD g1552__4319(.A1 (n_78), .B1 (n_16), .B2 (ibat[6]), .O
       (n_174));
  OAI12CHD g1604__8428(.A1 (n_76), .B1 (n_75), .B2 (tempmin[6]), .O
       (n_195));
  OAI12CHD g1707__5526(.A1 (imonen), .B1 (current_state[2]), .B2
       (current_state[1]), .O (n_265));
  ND3CHD g1609__6783(.I1 (n_76), .I2 (n_75), .I3 (tempmin[6]), .O
       (n_77));
  ND3CHD g1612__3680(.I1 (n_73), .I2 (n_72), .I3 (tbat[6]), .O (n_74));
  OAI12CHD g1642__1617(.A1 (n_70), .B1 (tpreset[3]), .B2 (tmax[3]), .O
       (n_71));
  ND3CHD g1629__2802(.I1 (n_68), .I2 (n_67), .I3 (tbat[2]), .O (n_69));
  OAI12CHD g1630__1705(.A1 (n_65), .B1 (tpreset[7]), .B2 (tmax[7]), .O
       (n_66));
  AOI22BHD g1550__5122(.A1 (n_62), .A2 (vpreset[6]), .B1 (n_187), .B2
       (vpreset[7]), .O (n_146));
  OAI22CHD g1544__8246(.A1 (current_state[1]), .A2 (n_64), .B1 (n_63),
       .B2 (current_state[0]), .O (n_257));
  AOI22BHD g1551__7098(.A1 (n_62), .A2 (vcutoff[6]), .B1 (n_187), .B2
       (vcutoff[7]), .O (n_140));
  OR3B2CHD g1524__6131(.I1 (n_201), .B1 (tpreset[10]), .B2
       (tpreset[11]), .O (n_210));
  INVDHD g1678(.I (n_148), .O (n_149));
  OAI112BHD g1553__1881(.A1 (vbat[7]), .B1 (vbat[6]), .C1 (vbat[5]),
       .C2 (vbat[4]), .O (n_61));
  NR2BHD g1564__5115(.I1 (vcutoff[6]), .I2 (n_62), .O (n_60));
  INVDHD g1674(.I (n_58), .O (n_59));
  NR2BHD g1560__7482(.I1 (vpreset[6]), .I2 (n_62), .O (n_57));
  ND2CHD g1586__4733(.I1 (n_205), .I2 (vpreset[3]), .O (n_114));
  ND2CHD g1694__6161(.I1 (tpreset[14]), .I2 (n_79), .O (n_82));
  NR2CHD g1693__9315(.I1 (tmax[3]), .I2 (n_56), .O (n_96));
  NR2CHD g1691__9945(.I1 (tmax[5]), .I2 (n_55), .O (n_124));
  MAOI1CHD g1702__2883(.A1 (tpreset[15]), .A2 (tmax[7]), .B1 (tmax[7]),
       .B2 (tpreset[15]), .O (n_83));
  MAOI1CHD g1703__2346(.A1 (tpreset[9]), .A2 (tmax[1]), .B1 (tmax[1]),
       .B2 (tpreset[9]), .O (n_105));
  MAOI1CHD g1704__1666(.A1 (tpreset[10]), .A2 (tmax[2]), .B1 (tmax[2]),
       .B2 (tpreset[10]), .O (n_101));
  MOAI1CHD g1705__7410(.A1 (tpreset[12]), .A2 (tmax[4]), .B1
       (tpreset[12]), .B2 (tmax[4]), .O (n_97));
  ND2CHD g1569__5477(.I1 (n_187), .I2 (vpreset[7]), .O (n_54));
  ND2CHD g1570__2398(.I1 (n_187), .I2 (vcutoff[7]), .O (n_53));
  MOAI1CHD g1699__5107(.A1 (tpreset[0]), .A2 (tpreset[1]), .B1
       (tpreset[0]), .B2 (tpreset[1]), .O (n_52));
  ND2CHD g1583__6260(.I1 (n_205), .I2 (vcutoff[3]), .O (n_103));
  ND2CHD g1584__4319(.I1 (n_152), .I2 (vcutoff[5]), .O (n_117));
  ND2CHD g1585__8428(.I1 (n_152), .I2 (vpreset[5]), .O (n_111));
  OR2CHD g1593__5526(.I1 (ibat[5]), .I2 (n_51), .O (n_122));
  ND2CHD g1587__6783(.I1 (n_50), .I2 (iend[3]), .O (n_108));
  ND2CHD g1643__3680(.I1 (n_49), .I2 (tempmax[5]), .O (n_127));
  OR2CHD g1646__1617(.I1 (tempmin[5]), .I2 (n_49), .O (n_129));
  ND2CHD g1647__2802(.I1 (n_48), .I2 (tbat[3]), .O (n_92));
  OAI22CHD g1648__1705(.A1 (tmax[5]), .A2 (tpreset[5]), .B1
       (tpreset[6]), .B2 (tmax[6]), .O (n_183));
  ND2DHD g1679__5122(.I1 (n_255), .I2 (current_state[0]), .O (n_148));
  OR2B1CHD g1659__8246(.I1 (tbat[0]), .B1 (tempmax[0]), .O (n_47));
  OR2B1CHD g1660__7098(.I1 (tempmin[0]), .B1 (tbat[0]), .O (n_46));
  ND2DHD g1661__6131(.I1 (tpreset[5]), .I2 (tmax[5]), .O (n_45));
  AN2B1CHD g1662__1881(.I1 (tmax[0]), .B1 (tpreset[0]), .O (n_44));
  NR2CHD g1663__5115(.I1 (tmax[0]), .I2 (tpreset[8]), .O (n_43));
  AN2EHD g1672__7482(.I1 (tpreset[3]), .I2 (tmax[3]), .O (n_42));
  AN2B1CHD g1582__4733(.I1 (ibat[4]), .B1 (iend[4]), .O (n_41));
  OR2B1CHD g1547__6161(.I1 (iend[7]), .B1 (ibat[7]), .O (n_40));
  OR2B1CHD g1565__9315(.I1 (ibat[4]), .B1 (iend[4]), .O (n_39));
  OR2B1CHD g1697__9945(.I1 (tmax[4]), .B1 (tpreset[12]), .O (n_170));
  OR2B1CHD g1696__2883(.I1 (tmax[2]), .B1 (tpreset[10]), .O (n_154));
  OR2B1CHD g1568__2346(.I1 (ibat[7]), .B1 (iend[7]), .O (n_78));
  ND2DHD g1517__1666(.I1 (current_state[0]), .I2 (current_state[2]), .O
       (n_135));
  ND2CHD g1673__7410(.I1 (tpreset[8]), .I2 (tmax[0]), .O (n_65));
  OR2B1CHD g1692__6417(.I1 (tmax[1]), .B1 (tpreset[9]), .O (n_100));
  OR2EHD g1676__5477(.I1 (tmax[4]), .I2 (tpreset[4]), .O (n_70));
  ND2CHD g1526__2398(.I1 (tpreset[12]), .I2 (tpreset[13]), .O (n_142));
  NR2CHD g1527__5107(.I1 (current_state[2]), .I2 (current_state[0]), .O
       (n_131));
  ND2DHD g1708__6260(.I1 (current_state[1]), .I2 (current_state[2]), .O
       (imonen));
  ND2DHD g1671__4319(.I1 (tpreset[1]), .I2 (tmax[1]), .O (n_38));
  AN2B1CHD g1641__8428(.I1 (tempmin[4]), .B1 (tbat[4]), .O (n_37));
  OR2B1CHD g1596__6783(.I1 (vbat[0]), .B1 (vcutoff[0]), .O (n_35));
  OR2B1CHD g1597__3680(.I1 (tempmax[7]), .B1 (tbat[7]), .O (n_34));
  OR2B1CHD g1598__1617(.I1 (vbat[0]), .B1 (vpreset[0]), .O (n_33));
  OR2B1CHD g1599__2802(.I1 (ibat[0]), .B1 (iend[0]), .O (n_32));
  OR2B1CHD g1603__1705(.I1 (tbat[7]), .B1 (tempmin[7]), .O (n_31));
  NR2CHD g1664__5122(.I1 (tmax[6]), .I2 (tpreset[6]), .O (n_30));
  OR2B1CHD g1619__8246(.I1 (tempmax[3]), .B1 (tbat[3]), .O (n_29));
  OR2B1CHD g1620__7098(.I1 (tbat[4]), .B1 (tempmax[4]), .O (n_28));
  OR2B1CHD g1622__6131(.I1 (tempmin[4]), .B1 (tbat[4]), .O (n_27));
  AN2B1CHD g1640__1881(.I1 (tbat[4]), .B1 (tempmax[4]), .O (n_26));
  ND2CHD g1690__5115(.I1 (tpreset[6]), .I2 (tpreset[7]), .O (n_25));
  OR2B1CHD g1695__7482(.I1 (tmax[7]), .B1 (tpreset[15]), .O (n_251));
  OR2B1CHD g1644__4733(.I1 (tbat[3]), .B1 (tempmax[3]), .O (n_68));
  OR2B1CHD g1628__6161(.I1 (tempmin[7]), .B1 (tbat[7]), .O (n_76));
  OR2B1CHD g1625__9315(.I1 (tbat[7]), .B1 (tempmax[7]), .O (n_73));
  NR2CHD g1675__9945(.I1 (tmax[2]), .I2 (tpreset[2]), .O (n_58));
  ND2CHD g1689__2883(.I1 (tpreset[4]), .I2 (tpreset[5]), .O (n_162));
  ND2DHD g1528__2346(.I1 (tpreset[8]), .I2 (tpreset[9]), .O (n_201));
  INVCKDHD g1715(.I (vpreset[1]), .O (n_24));
  INVCKDHD g1714(.I (vcutoff[1]), .O (n_23));
  INVDHD g1745(.I (current_state[0]), .O (n_64));
  INVCKDHD g1717(.I (vpreset[4]), .O (n_110));
  INVCKDHD g1732(.I (tempmin[3]), .O (n_48));
  INVCKDHD g1710(.I (ibat[3]), .O (n_50));
  INVCKDHD g1737(.I (vpreset[2]), .O (n_113));
  INVCKDHD g1738(.I (vcutoff[2]), .O (n_102));
  INVCKDHD g1731(.I (tempmax[6]), .O (n_72));
  INVCKDHD g1711(.I (tempmax[2]), .O (n_67));
  INVCKDHD g1733(.I (iend[2]), .O (n_107));
  INVDHD g1744(.I (current_state[1]), .O (n_63));
  INVDHD g1726(.I (tpreset[14]), .O (n_143));
  INVCKDHD g1722(.I (tmax[6]), .O (n_79));
  INVDHD g1743(.I (tpreset[8]), .O (n_138));
  INVDHD g1729(.I (current_state[2]), .O (n_255));
  INVCKDHD g1720(.I (tbat[1]), .O (n_20));
  INVCKDHD g1712(.I (iend[1]), .O (n_19));
  INVCKDHD g1709(.I (tempmax[1]), .O (n_18));
  INVCKDHD g1735(.I (tempmax[5]), .O (n_17));
  INVCKDHD g1730(.I (iend[6]), .O (n_16));
  INVCKDHD g1721(.I (tbat[6]), .O (n_75));
  INVCKDHD g1734(.I (iend[5]), .O (n_51));
  INVCKDHD g1716(.I (vcutoff[4]), .O (n_116));
  INVCKDHD g1736(.I (vpreset[7]), .O (n_137));
  INVCKDHD g1713(.I (vcutoff[7]), .O (n_136));
  INVDHD g1724(.I (tpreset[11]), .O (n_56));
  INVDHD g1725(.I (tpreset[13]), .O (n_55));
  INVCKDHD g1719(.I (tbat[2]), .O (n_91));
  INVCKDHD g1740(.I (tpreset[6]), .O (n_182));
  INVCKDHD g1718(.I (tbat[5]), .O (n_49));
  INVCKDHD g1728(.I (vbat[3]), .O (n_205));
  INVCKDHD g1741(.I (vbat[6]), .O (n_62));
  INVCKDHD g1742(.I (vbat[5]), .O (n_152));
  INVCKDHD g1727(.I (vbat[7]), .O (n_187));
  OAI12CHD g2(.A1 (n_260), .B1 (n_258), .B2 (n_243), .O (n_356));
  XOR2EHD g1765(.I1 (n_359), .I2 (tpreset[2]), .O (n_357));
  AOI13BHD g1766(.A1 (vbat[3]), .B1 (vbat[1]), .B2 (vbat[0]), .B3
       (vbat[2]), .O (n_358));
  AN2B1CHD g1767(.I1 (tpreset[1]), .B1 (tpreset[0]), .O (n_359));
  OA112EHD g1768(.A1 (rstz), .B1 (n_272), .C1 (n_356), .C2 (n_255), .O
       (n_360));
endmodule
