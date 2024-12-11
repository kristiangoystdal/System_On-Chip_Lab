//***************************************************************************//
//                           VERILOG MAINSIM FILE                            //
//Cadence(R) Modus(TM) DFT Software Solution, Version 19.12-s004_1, built Dec//
//***************************************************************************//
//                                                                           //
//  FILE CREATED..............December 11, 2024 at 14:56:20                  //
//                                                                           //
//  PROJECT NAME..............atpg_scripts                                   //
//                                                                           //
//  TESTMODE..................FULLSCAN                                       //
//                                                                           //
//  INEXPERIMENT..............BATCHARGER_controller_atpg                     //
//                                                                           //
//  TDR.......................dummy.tdr                                      //
//                                                                           //
//  TEST PERIOD...............80.000   TEST TIME UNITS...........ns          //
//  TEST PULSE WIDTH..........8.000                                          //
//  TEST STROBE OFFSET........72.000   TEST STROBE TYPE..........edge        //
//  TEST BIDI OFFSET..........0.000                                          //
//  TEST PI OFFSET............0.000    X VALUE...................X           //
//                                                                           //
//  SCAN FORMAT...............parallel SCAN OVERLAP..............yes         //
//  SCAN PERIOD...............80.000   SCAN TIME UNITS...........ns          //
//  SCAN PULSE WIDTH..........8.000                                          //
//  SCAN STROBE OFFSET........8.000    SCAN STROBE TYPE..........edge        //
//  SCAN BIDI OFFSET..........0.000                                          //
//  SCAN PI OFFSET............0.000    X VALUE...................X           //
//                                                                           //
//                                                                           //
//   Individually set PIs                                                    //
//  "clk" (PI # 1)                                                           //
//  TEST OFFSET...............8.000    PULSE WIDTH...............8.000       //
//  SCAN OFFSET...............16.000   PULSE WIDTH...............8.000       //
//                                                                           //
//  "rstz" (PI # 21)                                                         //
//  TEST OFFSET...............8.000    PULSE WIDTH...............8.000       //
//  SCAN OFFSET...............0.000                                          //
//                                                                           //
//  Active TESTMODEs TM = 1 ..FULLSCAN                                       //
//                                                                           //
//***************************************************************************//

  `timescale 1 ns / 1 ps

  module atpg_scripts_FULLSCAN_BATCHARGER_controller_atpg ;

//***************************************************************************//
//                DEFINE VARIABLES FOR ALL PRIMARY I/O PORTS                 //
//***************************************************************************//

  reg [1:80] stim_PIs;   
  reg [1:80] part_PIs;   

  reg [1:80] stim_CIs;   

  reg [1:9] meas_POs;   

  reg [1:9] scan_POs;   
  wire [1:9] part_POs;   

//***************************************************************************//
//                   DEFINE VARIABLES FOR ALL SHIFT CHAINS                   //
//***************************************************************************//

  reg [1:19] stim_CR_1;   

  reg [1:19] meas_OR_1;   

  reg [1:19] part_S_CR_1_TM_1;   

  wire [1:19] part_M_OR_1_TM_1;   


//***************************************************************************//
//                             OTHER DEFINITIONS                             //
//***************************************************************************//

  integer  CYCLE, SCANCYCLE, SERIALCYCLE, PInum, POnum, ORnum, MODENUM, EXPNUM, SCANOPNUM, SEQNUM, TASKNUM, START, NUM_SHIFTS, MultiShift, maxMultiShifts, MultiShiftsLeft, forcePointStart, forcePoint, SCANNUM ; 
  integer  CMD, DATAID, SAVEID, TID, rc_read, repeat_depth, repeat_heart, repeat_num, MAX, FAILSETID, DIAG_DATAID; 
  integer  num_repeats [1:15]; 
  reg      [1:8185] name_POs [1:9]; 
  reg      [130:0] good_compares, miscompares, miscompare_limit, total_good_compares, total_miscompares, measure_current; 
  reg      [130:0] start_of_repeat [1:15]; 
  reg      [130:0] start_of_current_line, line_number, save_line_number, fseek_offset; 
  reg      sim_trace, sim_heart, sim_range, failset, global_term, sim_debug, sim_more_debug, diag_debug; 
  reg      [1:800] PATTERN, pattern, TESTFILE, INITFILE, SOD, EOD, eventID, DIAG_DEBUG_FILE; 
  reg      [1:8184] DATAFILE, SAVEFILE, COMMENT, FAILSET; 
  reg      [1:4096] PROCESSNAME; 

//***************************************************************************//
//        INSTANTIATE THE STRUCTURE AND CONNECT TO VERILOG VARIABLES         //
//***************************************************************************//

  BATCHARGER_controller
    BATCHARGER_controller_inst (
      .cc      ( part_POs[01] ),      // pinName = cc; 
      .tc      ( part_POs[07] ),      // pinName = tc; 
      .cv      ( part_POs[02] ),      // pinName = cv; 
      .imonen  ( part_POs[05] ),      // pinName = imonen; 
      .vmonen  ( part_POs[09] ),      // pinName = vmonen; 
      .tmonen  ( part_POs[08] ),      // pinName = tmonen; 
      .vtok    ( part_PIs[80] ),      // pinName = vtok; testOffset = 0.000000;  scanOffset = 0.000000;  
      .vbat    ({part_PIs[63]  ,      // pinName = vbat[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[62]  ,      // pinName = vbat[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[61]  ,      // pinName = vbat[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[60]  ,      // pinName = vbat[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[59]  ,      // pinName = vbat[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[58]  ,      // pinName = vbat[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[57]  ,      // pinName = vbat[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[56]}),      // pinName = vbat[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ibat    ({part_PIs[12]  ,      // pinName = ibat[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[11]  ,      // pinName = ibat[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[10]  ,      // pinName = ibat[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[09]  ,      // pinName = ibat[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[08]  ,      // pinName = ibat[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[07]  ,      // pinName = ibat[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[06]  ,      // pinName = ibat[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[05]}),      // pinName = ibat[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .tbat    ({part_PIs[31]  ,      // pinName = tbat[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[30]  ,      // pinName = tbat[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[29]  ,      // pinName = tbat[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[28]  ,      // pinName = tbat[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[27]  ,      // pinName = tbat[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[26]  ,      // pinName = tbat[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[25]  ,      // pinName = tbat[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[24]}),      // pinName = tbat[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .vcutoff ({part_PIs[71]  ,      // pinName = vcutoff[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[70]  ,      // pinName = vcutoff[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[69]  ,      // pinName = vcutoff[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[68]  ,      // pinName = vcutoff[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[67]  ,      // pinName = vcutoff[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[66]  ,      // pinName = vcutoff[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[65]  ,      // pinName = vcutoff[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[64]}),      // pinName = vcutoff[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .vpreset ({part_PIs[79]  ,      // pinName = vpreset[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[78]  ,      // pinName = vpreset[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[77]  ,      // pinName = vpreset[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[76]  ,      // pinName = vpreset[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[75]  ,      // pinName = vpreset[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[74]  ,      // pinName = vpreset[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[73]  ,      // pinName = vpreset[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[72]}),      // pinName = vpreset[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .tempmin ({part_PIs[47]  ,      // pinName = tempmin[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[46]  ,      // pinName = tempmin[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[45]  ,      // pinName = tempmin[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[44]  ,      // pinName = tempmin[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[43]  ,      // pinName = tempmin[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[42]  ,      // pinName = tempmin[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[41]  ,      // pinName = tempmin[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[40]}),      // pinName = tempmin[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .tempmax ({part_PIs[39]  ,      // pinName = tempmax[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[38]  ,      // pinName = tempmax[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[37]  ,      // pinName = tempmax[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[36]  ,      // pinName = tempmax[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[35]  ,      // pinName = tempmax[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[34]  ,      // pinName = tempmax[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[33]  ,      // pinName = tempmax[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[32]}),      // pinName = tempmax[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .tmax    ({part_PIs[55]  ,      // pinName = tmax[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[54]  ,      // pinName = tmax[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[53]  ,      // pinName = tmax[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[52]  ,      // pinName = tmax[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[51]  ,      // pinName = tmax[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[50]  ,      // pinName = tmax[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[49]  ,      // pinName = tmax[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[48]}),      // pinName = tmax[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .iend    ({part_PIs[20]  ,      // pinName = iend[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[19]  ,      // pinName = iend[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[18]  ,      // pinName = iend[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[17]  ,      // pinName = iend[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[16]  ,      // pinName = iend[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[15]  ,      // pinName = iend[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[14]  ,      // pinName = iend[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                 part_PIs[13]}),      // pinName = iend[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .clk     ( part_PIs[01] ),      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      .en      ( part_PIs[04] ),      // pinName = en; testOffset = 0.000000;  scanOffset = 0.000000;  
      .rstz    ( part_PIs[21] ),      // pinName = rstz;  tf = +SC  ; testOffset = 8.000000;  scanOffset = 0.000000;  
      .dvdd    ( part_POs[04] ),      // pinName = dvdd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .dgnd    ( part_POs[03] ),      // pinName = dgnd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .se      ( part_PIs[22] ),      // pinName = se;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .si      ( part_PIs[23] ),      // pinName = si;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .so      ( part_POs[06] )     // pinName = so;  tf =  SO  ; 
      );

//***************************************************************************//
//                        MAKE SOME OTHER CONNECTIONS                        //
//***************************************************************************//

  assign // BiDi Connections 
    part_POs [3] = part_PIs [2],     // pinName = dgnd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
    part_POs [4] = part_PIs [3];      // pinName = dvdd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
  assign ( weak0, weak1 ) // Termination 
    part_POs [1] = global_term,     // pinName = cc; 
    part_POs [2] = global_term,     // pinName = cv; 
    part_POs [3] = global_term,     // pinName = dgnd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
    part_POs [4] = global_term,     // pinName = dvdd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
    part_POs [5] = global_term,     // pinName = imonen; 
    part_POs [6] = global_term,     // pinName = so;  tf =  SO  ; 
    part_POs [7] = global_term,     // pinName = tc; 
    part_POs [8] = global_term,     // pinName = tmonen; 
    part_POs [9] = global_term;      // pinName = vmonen; 


  assign ( supply0, supply1 ) // CR = 1 
    BATCHARGER_controller_inst.si = part_S_CR_1_TM_1 [19] ,   // CR = 1;  pos = 1;  Pin Index = 20;  Pin Name = si;  pinInvFromLatch = no;  Latch Index = 21;  Latch Name = \current_state_reg[0].g2.dff_primitive;   
    BATCHARGER_controller_inst.\current_state_reg[1] .TD = part_S_CR_1_TM_1 [18] ,   // CR = 1;  pos = 2;  Pin Index = 174;  Pin Name = \current_state_reg[1].TD;  pinInvFromLatch = no;  Latch Index = 49;  Latch Name = \current_state_reg[1].g2.dff_primitive;   
    BATCHARGER_controller_inst.\current_state_reg[2] .TD = part_S_CR_1_TM_1 [17] ,   // CR = 1;  pos = 3;  Pin Index = 257;  Pin Name = \current_state_reg[2].TD;  pinInvFromLatch = no;  Latch Index = 77;  Latch Name = \current_state_reg[2].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[0] .TD = part_S_CR_1_TM_1 [16] ,   // CR = 1;  pos = 4;  Pin Index = 340;  Pin Name = \tpreset_reg[0].TD;  pinInvFromLatch = no;  Latch Index = 105;  Latch Name = \tpreset_reg[0].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[1] .TD = part_S_CR_1_TM_1 [15] ,   // CR = 1;  pos = 5;  Pin Index = 921;  Pin Name = \tpreset_reg[1].TD;  pinInvFromLatch = no;  Latch Index = 301;  Latch Name = \tpreset_reg[1].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[2] .TD = part_S_CR_1_TM_1 [14] ,   // CR = 1;  pos = 6;  Pin Index = 1004;  Pin Name = \tpreset_reg[2].TD;  pinInvFromLatch = no;  Latch Index = 329;  Latch Name = \tpreset_reg[2].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[3] .TD = part_S_CR_1_TM_1 [13] ,   // CR = 1;  pos = 7;  Pin Index = 1087;  Pin Name = \tpreset_reg[3].TD;  pinInvFromLatch = no;  Latch Index = 357;  Latch Name = \tpreset_reg[3].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[4] .TD = part_S_CR_1_TM_1 [12] ,   // CR = 1;  pos = 8;  Pin Index = 1170;  Pin Name = \tpreset_reg[4].TD;  pinInvFromLatch = no;  Latch Index = 385;  Latch Name = \tpreset_reg[4].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[5] .TD = part_S_CR_1_TM_1 [11] ,   // CR = 1;  pos = 9;  Pin Index = 1253;  Pin Name = \tpreset_reg[5].TD;  pinInvFromLatch = no;  Latch Index = 413;  Latch Name = \tpreset_reg[5].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[6] .TD = part_S_CR_1_TM_1 [10] ,   // CR = 1;  pos = 10;  Pin Index = 1336;  Pin Name = \tpreset_reg[6].TD;  pinInvFromLatch = no;  Latch Index = 441;  Latch Name = \tpreset_reg[6].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[7] .TD = part_S_CR_1_TM_1 [9] ,   // CR = 1;  pos = 11;  Pin Index = 1419;  Pin Name = \tpreset_reg[7].TD;  pinInvFromLatch = no;  Latch Index = 469;  Latch Name = \tpreset_reg[7].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[8] .TD = part_S_CR_1_TM_1 [8] ,   // CR = 1;  pos = 12;  Pin Index = 1502;  Pin Name = \tpreset_reg[8].TD;  pinInvFromLatch = no;  Latch Index = 497;  Latch Name = \tpreset_reg[8].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[9] .TD = part_S_CR_1_TM_1 [7] ,   // CR = 1;  pos = 13;  Pin Index = 1585;  Pin Name = \tpreset_reg[9].TD;  pinInvFromLatch = no;  Latch Index = 525;  Latch Name = \tpreset_reg[9].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[10] .TD = part_S_CR_1_TM_1 [6] ,   // CR = 1;  pos = 14;  Pin Index = 423;  Pin Name = \tpreset_reg[10].TD;  pinInvFromLatch = no;  Latch Index = 133;  Latch Name = \tpreset_reg[10].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[11] .TD = part_S_CR_1_TM_1 [5] ,   // CR = 1;  pos = 15;  Pin Index = 506;  Pin Name = \tpreset_reg[11].TD;  pinInvFromLatch = no;  Latch Index = 161;  Latch Name = \tpreset_reg[11].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[12] .TD = part_S_CR_1_TM_1 [4] ,   // CR = 1;  pos = 16;  Pin Index = 589;  Pin Name = \tpreset_reg[12].TD;  pinInvFromLatch = no;  Latch Index = 189;  Latch Name = \tpreset_reg[12].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[13] .TD = part_S_CR_1_TM_1 [3] ,   // CR = 1;  pos = 17;  Pin Index = 672;  Pin Name = \tpreset_reg[13].TD;  pinInvFromLatch = no;  Latch Index = 217;  Latch Name = \tpreset_reg[13].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[14] .TD = part_S_CR_1_TM_1 [2] ,   // CR = 1;  pos = 18;  Pin Index = 755;  Pin Name = \tpreset_reg[14].TD;  pinInvFromLatch = no;  Latch Index = 245;  Latch Name = \tpreset_reg[14].g2.dff_primitive;   
    BATCHARGER_controller_inst.\tpreset_reg[15] .TD = part_S_CR_1_TM_1 [1] ;   // CR = 1;  pos = 19;  Pin Index = 838;  Pin Name = \tpreset_reg[15].TD;  pinInvFromLatch = no;  Latch Index = 273;  Latch Name = \tpreset_reg[15].g2.dff_primitive;   

  assign // OR = 1 
    part_M_OR_1_TM_1 [1] =  BATCHARGER_controller_inst.so ,   // OR = 1;  pos = 1;  Pin Index = 83;  Pin Name = so;  pinInvFromLatch = no;  Latch Index = 273;  Latch Name = \tpreset_reg[15].g2.dff_primitive;   
    part_M_OR_1_TM_1 [2] =  BATCHARGER_controller_inst.\tpreset_reg[14] .Q ,   // OR = 1;  pos = 2;  Pin Index = 756;  Pin Name = \tpreset_reg[14].Q;  pinInvFromLatch = no;  Latch Index = 245;  Latch Name = \tpreset_reg[14].g2.dff_primitive;   
    part_M_OR_1_TM_1 [3] =  BATCHARGER_controller_inst.\tpreset_reg[13] .Q ,   // OR = 1;  pos = 3;  Pin Index = 673;  Pin Name = \tpreset_reg[13].Q;  pinInvFromLatch = no;  Latch Index = 217;  Latch Name = \tpreset_reg[13].g2.dff_primitive;   
    part_M_OR_1_TM_1 [4] =  BATCHARGER_controller_inst.\tpreset_reg[12] .Q ,   // OR = 1;  pos = 4;  Pin Index = 590;  Pin Name = \tpreset_reg[12].Q;  pinInvFromLatch = no;  Latch Index = 189;  Latch Name = \tpreset_reg[12].g2.dff_primitive;   
    part_M_OR_1_TM_1 [5] =  BATCHARGER_controller_inst.\tpreset_reg[11] .Q ,   // OR = 1;  pos = 5;  Pin Index = 507;  Pin Name = \tpreset_reg[11].Q;  pinInvFromLatch = no;  Latch Index = 161;  Latch Name = \tpreset_reg[11].g2.dff_primitive;   
    part_M_OR_1_TM_1 [6] =  BATCHARGER_controller_inst.\tpreset_reg[10] .Q ,   // OR = 1;  pos = 6;  Pin Index = 424;  Pin Name = \tpreset_reg[10].Q;  pinInvFromLatch = no;  Latch Index = 133;  Latch Name = \tpreset_reg[10].g2.dff_primitive;   
    part_M_OR_1_TM_1 [7] =  BATCHARGER_controller_inst.\tpreset_reg[9] .Q ,   // OR = 1;  pos = 7;  Pin Index = 1586;  Pin Name = \tpreset_reg[9].Q;  pinInvFromLatch = no;  Latch Index = 525;  Latch Name = \tpreset_reg[9].g2.dff_primitive;   
    part_M_OR_1_TM_1 [8] =  BATCHARGER_controller_inst.\tpreset_reg[8] .Q ,   // OR = 1;  pos = 8;  Pin Index = 1503;  Pin Name = \tpreset_reg[8].Q;  pinInvFromLatch = no;  Latch Index = 497;  Latch Name = \tpreset_reg[8].g2.dff_primitive;   
    part_M_OR_1_TM_1 [9] =  BATCHARGER_controller_inst.\tpreset_reg[7] .Q ,   // OR = 1;  pos = 9;  Pin Index = 1420;  Pin Name = \tpreset_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 469;  Latch Name = \tpreset_reg[7].g2.dff_primitive;   
    part_M_OR_1_TM_1 [10] =  BATCHARGER_controller_inst.\tpreset_reg[6] .Q ,   // OR = 1;  pos = 10;  Pin Index = 1337;  Pin Name = \tpreset_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 441;  Latch Name = \tpreset_reg[6].g2.dff_primitive;   
    part_M_OR_1_TM_1 [11] =  BATCHARGER_controller_inst.\tpreset_reg[5] .Q ,   // OR = 1;  pos = 11;  Pin Index = 1254;  Pin Name = \tpreset_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 413;  Latch Name = \tpreset_reg[5].g2.dff_primitive;   
    part_M_OR_1_TM_1 [12] =  BATCHARGER_controller_inst.\tpreset_reg[4] .Q ,   // OR = 1;  pos = 12;  Pin Index = 1171;  Pin Name = \tpreset_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 385;  Latch Name = \tpreset_reg[4].g2.dff_primitive;   
    part_M_OR_1_TM_1 [13] =  BATCHARGER_controller_inst.\tpreset_reg[3] .Q ,   // OR = 1;  pos = 13;  Pin Index = 1088;  Pin Name = \tpreset_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 357;  Latch Name = \tpreset_reg[3].g2.dff_primitive;   
    part_M_OR_1_TM_1 [14] =  BATCHARGER_controller_inst.\tpreset_reg[2] .Q ,   // OR = 1;  pos = 14;  Pin Index = 1005;  Pin Name = \tpreset_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 329;  Latch Name = \tpreset_reg[2].g2.dff_primitive;   
    part_M_OR_1_TM_1 [15] =  BATCHARGER_controller_inst.\tpreset_reg[1] .Q ,   // OR = 1;  pos = 15;  Pin Index = 922;  Pin Name = \tpreset_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 301;  Latch Name = \tpreset_reg[1].g2.dff_primitive;   
    part_M_OR_1_TM_1 [16] =  BATCHARGER_controller_inst.\tpreset_reg[0] .Q ,   // OR = 1;  pos = 16;  Pin Index = 341;  Pin Name = \tpreset_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 105;  Latch Name = \tpreset_reg[0].g2.dff_primitive;   
    part_M_OR_1_TM_1 [17] =  BATCHARGER_controller_inst.\current_state_reg[2] .Q ,   // OR = 1;  pos = 17;  Pin Index = 258;  Pin Name = \current_state_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 77;  Latch Name = \current_state_reg[2].g2.dff_primitive;   
    part_M_OR_1_TM_1 [18] =  BATCHARGER_controller_inst.\current_state_reg[1] .Q ,   // OR = 1;  pos = 18;  Pin Index = 175;  Pin Name = \current_state_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 49;  Latch Name = \current_state_reg[1].g2.dff_primitive;   
    part_M_OR_1_TM_1 [19] =  BATCHARGER_controller_inst.\current_state_reg[0] .Q ;   // OR = 1;  pos = 19;  Pin Index = 92;  Pin Name = \current_state_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 21;  Latch Name = \current_state_reg[0].g2.dff_primitive;   

//***************************************************************************//
//                     OPEN THE FILE AND RUN SIMULATION                      //
//***************************************************************************//

  initial 
    begin 

      $timeformat ( -12, 2, " ps", 10 ); 

      `ifdef sdf_annotate 
        `ifdef SDF_Minimum 
          $sdf_annotate ("default.sdf",BATCHARGER_controller_inst,,"sdf_Min.log","MINIMUM");
        `endif 
        `ifdef SDF_Maximum 
          $sdf_annotate ("default.sdf",BATCHARGER_controller_inst,,"sdf_Max.log","MAXIMUM");
        `endif 
        `ifdef SDF_Typical
          $sdf_annotate ("default.sdf",BATCHARGER_controller_inst,,"sdf_Typ.log","TYPICAL");
        `endif 
      `endif 

      `ifndef NOT_NC 
        if ( $test$plusargs ( "simvision" ) )  begin 
          $shm_open("simvision.shm"); 
          $shm_probe("AC"); 
        end  
      `endif 

      if ( $test$plusargs ( "vcd" ) )  begin 
        $dumpfile("out.vcd"); 
        $dumpvars(0,atpg_scripts_FULLSCAN_BATCHARGER_controller_atpg ); 
      end  

      DATAFILE = 0; 
      sim_setup; 

      `ifdef MISCOMPAREDEBUG 
        diag_debug = 1'b0; 
        if ( $value$plusargs ( "MISCOMPAREDEBUGFILE=%s", DIAG_DEBUG_FILE )) begin 
          DIAG_DATAID = $fopen ( DIAG_DEBUG_FILE, "r" ); 
          if ( DIAG_DATAID ) begin 
            diag_debug = 1'b1; 
            $fclose ( DIAG_DATAID ); 
          end  
          else $display ( "\nERROR (TVE-951): Failed to open Diagnostic 'MISCOMPAREDEBUGFILE' file: %0s. \n", DIAG_DEBUG_FILE ); 
        end  
      `endif  

      for ( TID = 1; TID <= 99; TID = TID + 1 ) begin 
        $sformat ( TESTFILE, "TESTFILE%0d=%s", TID, "%s" ); 
        if ( $value$plusargs ( TESTFILE, DATAFILE )) begin 
          DATAID = $fopen ( DATAFILE, "r" ); 
          if ( DATAID )  sim_vector_file; 
          else $display ( "\nERROR (TVE-951): Failed to open the file: %0s. \n", DATAFILE ); 
        end  
      end  

      if ( FAILSETID )  $fclose ( FAILSETID ); 

      if ( DATAFILE )  begin
        $display ( "\nINFO (TVE-204): The total number of good comparing vectors is %0.0f ", total_good_compares ); 
        $display ( "\nINFO (TVE-203): The total number of miscomparing vectors is %0.0f \n", total_miscompares ); 
      end  
      else $display ( "\nWARNING (TVE-661): No input data files found. The data file must be specified using +TESTFILE1=<string>, +TESTFILE2=<string>, ... The +TESTFILEn=<string> keyword is an NC-Sim command. \n" ); 

      $finish; 

    end  

//***************************************************************************//
//                     DEFINE SIMULATION SETUP PROCEDURE                     //
//***************************************************************************//

  task sim_setup; 
    begin 

      total_good_compares = 0; 
      total_miscompares = 0; 
      miscompare_limit = 0; 
      SOD = ""; 
      EOD = ""; 
      START = 0; 
      NUM_SHIFTS = 0; 
      MAX = 1; 

      sim_heart = 1'b0; 
      sim_range = 1'b1; 
      sim_trace = 1'b0; 
      sim_debug = 1'b0; 
      sim_more_debug = 1'b0; 

      global_term = 1'bZ; 

      failset = 1'b0; 
      FAILSETID = 0; 

      CYCLE = 0; 
      SCANCYCLE = 0; 
      SERIALCYCLE = 0; 
      SEQNUM = 0; 
      name_POs [1] = "cc";      // pinName = cc; 
      name_POs [2] = "cv";      // pinName = cv; 
      name_POs [3] = "dgnd";      // pinName = dgnd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
      name_POs [4] = "dvdd";      // pinName = dvdd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
      name_POs [5] = "imonen";      // pinName = imonen; 
      name_POs [6] = "so";      // pinName = so;  tf =  SO  ; 
      name_POs [7] = "tc";      // pinName = tc; 
      name_POs [8] = "tmonen";      // pinName = tmonen; 
      name_POs [9] = "vmonen";      // pinName = vmonen; 



      if ( $test$plusargs ( "MODUS_DEBUG" ) )  sim_trace = 1'b1; 

      if ( $test$plusargs ( "HEARTBEAT" ) )  sim_heart = 1'b1; 

      if ( $value$plusargs ( "START_RANGE=%s", SOD ) )  sim_range = 1'b0; 

      if ( $value$plusargs ( "END_RANGE=%s", EOD ) ); 

      if ( $value$plusargs ( "miscompare_limit=%0f", miscompare_limit ) ); 

      if ( $test$plusargs ( "FAILSET" ) )  failset = 1'b1; 

      stim_PIs = {80{1'bX}};   
      stim_CIs = 80'b0XXXXXXXXXXXXXXXXXXX1XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX; 
      meas_POs = {9{1'bX}};   
      stim_CR_1 = {19{1'b0}};   
      part_S_CR_1_TM_1 = {19{1'bZ}};   
      meas_OR_1 = {19{1'bX}};   

    end  
  endtask  

//***************************************************************************//
//                          FAILSET SETUP PROCEDURE                          //
//***************************************************************************//

  task failset_setup; 
    begin 

      $sformat ( FAILSET, "%0s_FAILSET", DATAFILE ); 
      FAILSETID = $fopen ( FAILSET, "w" ); 
      if ( ! FAILSETID ) 
        $display ( "\nERROR (TVE-951): Failed to open the file: %0s. \n", FAILSET ); 

    end  
  endtask 

//***************************************************************************//
//                           SET UP FOR SIMULATION                           //
//***************************************************************************//

  task sim_vector_file; 
    begin 

      CYCLE = 0; 
      SCANCYCLE = 0; 
      SERIALCYCLE = 0; 
      good_compares = 0; 
      miscompares = 0; 
      measure_current = 0; 
      repeat_depth = 0; 
      repeat_heart = 1000; 


      $display ( "\nINFO (TVE-200): Reading vector file: %0s ", DATAFILE ); 

      start_of_current_line = $ftell ( DATAID ); 
      line_number = 1; 
      rc_read = $fscanf ( DATAID, "%d", CMD ); 
      while ( rc_read > 0 ) begin 

        cmd_code; 

        if ( rc_read > 0 )  begin 
          if ( sim_range )  begin 
            if (( miscompare_limit > 0 ) & ( miscompares > miscompare_limit ))  begin 
              sim_range = 1'b0; 
              $display ( "\nINFO (TVE-207): The miscompare limit (+miscompare_limit) of %0.0f has been reached. ", miscompare_limit ); 
            end  
            if ( EOD == pattern )  begin 
              sim_range = 1'b0; 
            end  
          end  
          start_of_current_line = $ftell ( DATAID ); 
          rc_read = $fscanf ( DATAID, "%d", CMD ); 
          if ( rc_read <= 0 )  begin 
            rc_read = $fgets ( COMMENT, DATAID ); 
            if ( rc_read > 0 )  bad_cmd_code; 
            else  line_number = 0; 
          end  
        end  
      end  

      if ( line_number == 0 )  begin
        $display ( "\nINFO (TVE-201): Simulation complete on vector file: %0s ", DATAFILE ); 
        $display ( "\nINFO (TVE-206): The number of good comparing vectors for the file just completed is %0.0f ", good_compares ); 
        $display ( "\nINFO (TVE-205): The number of miscomparing vectors for the file just completed is %0.0f \n", miscompares ); 
      end  

      $fclose ( DATAID ); 

      total_good_compares = total_good_compares + good_compares; 

      total_miscompares = total_miscompares + miscompares; 

    end  
  endtask  

//***************************************************************************//
//                           DEFINE TEST PROCEDURE                           //
//***************************************************************************//

  task test_cycle; 
    begin 

      CYCLE = CYCLE + 1; 
      SERIALCYCLE = SERIALCYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_PIs [4] = stim_PIs [4];      // pinName = en; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [5] = stim_PIs [5];      // pinName = ibat[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [6] = stim_PIs [6];      // pinName = ibat[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [7] = stim_PIs [7];      // pinName = ibat[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [8] = stim_PIs [8];      // pinName = ibat[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [9] = stim_PIs [9];      // pinName = ibat[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [10] = stim_PIs [10];      // pinName = ibat[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [11] = stim_PIs [11];      // pinName = ibat[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [12] = stim_PIs [12];      // pinName = ibat[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [13] = stim_PIs [13];      // pinName = iend[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [14] = stim_PIs [14];      // pinName = iend[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [15] = stim_PIs [15];      // pinName = iend[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [16] = stim_PIs [16];      // pinName = iend[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [17] = stim_PIs [17];      // pinName = iend[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [18] = stim_PIs [18];      // pinName = iend[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [19] = stim_PIs [19];      // pinName = iend[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [20] = stim_PIs [20];      // pinName = iend[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [22] = stim_PIs [22];      // pinName = se;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [23] = stim_PIs [23];      // pinName = si;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [24] = stim_PIs [24];      // pinName = tbat[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [25] = stim_PIs [25];      // pinName = tbat[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [26] = stim_PIs [26];      // pinName = tbat[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [27] = stim_PIs [27];      // pinName = tbat[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [28] = stim_PIs [28];      // pinName = tbat[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [29] = stim_PIs [29];      // pinName = tbat[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [30] = stim_PIs [30];      // pinName = tbat[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [31] = stim_PIs [31];      // pinName = tbat[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [32] = stim_PIs [32];      // pinName = tempmax[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [33] = stim_PIs [33];      // pinName = tempmax[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [34] = stim_PIs [34];      // pinName = tempmax[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [35] = stim_PIs [35];      // pinName = tempmax[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [36] = stim_PIs [36];      // pinName = tempmax[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [37] = stim_PIs [37];      // pinName = tempmax[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [38] = stim_PIs [38];      // pinName = tempmax[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [39] = stim_PIs [39];      // pinName = tempmax[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [40] = stim_PIs [40];      // pinName = tempmin[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [41] = stim_PIs [41];      // pinName = tempmin[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [42] = stim_PIs [42];      // pinName = tempmin[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [43] = stim_PIs [43];      // pinName = tempmin[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [44] = stim_PIs [44];      // pinName = tempmin[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [45] = stim_PIs [45];      // pinName = tempmin[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [46] = stim_PIs [46];      // pinName = tempmin[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [47] = stim_PIs [47];      // pinName = tempmin[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [48] = stim_PIs [48];      // pinName = tmax[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [49] = stim_PIs [49];      // pinName = tmax[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [50] = stim_PIs [50];      // pinName = tmax[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [51] = stim_PIs [51];      // pinName = tmax[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [52] = stim_PIs [52];      // pinName = tmax[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [53] = stim_PIs [53];      // pinName = tmax[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [54] = stim_PIs [54];      // pinName = tmax[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [55] = stim_PIs [55];      // pinName = tmax[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [56] = stim_PIs [56];      // pinName = vbat[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [57] = stim_PIs [57];      // pinName = vbat[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [58] = stim_PIs [58];      // pinName = vbat[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [59] = stim_PIs [59];      // pinName = vbat[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [60] = stim_PIs [60];      // pinName = vbat[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [61] = stim_PIs [61];      // pinName = vbat[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [62] = stim_PIs [62];      // pinName = vbat[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [63] = stim_PIs [63];      // pinName = vbat[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [64] = stim_PIs [64];      // pinName = vcutoff[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [65] = stim_PIs [65];      // pinName = vcutoff[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [66] = stim_PIs [66];      // pinName = vcutoff[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [67] = stim_PIs [67];      // pinName = vcutoff[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [68] = stim_PIs [68];      // pinName = vcutoff[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [69] = stim_PIs [69];      // pinName = vcutoff[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [70] = stim_PIs [70];      // pinName = vcutoff[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [71] = stim_PIs [71];      // pinName = vcutoff[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [72] = stim_PIs [72];      // pinName = vpreset[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [73] = stim_PIs [73];      // pinName = vpreset[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [74] = stim_PIs [74];      // pinName = vpreset[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [75] = stim_PIs [75];      // pinName = vpreset[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [76] = stim_PIs [76];      // pinName = vpreset[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [77] = stim_PIs [77];      // pinName = vpreset[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [78] = stim_PIs [78];      // pinName = vpreset[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [79] = stim_PIs [79];      // pinName = vpreset[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [80] = stim_PIs [80];      // pinName = vtok; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [2] = stim_PIs [2];      // pinName = dgnd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [3] = stim_PIs [3];      // pinName = dvdd;  tf = BIDI ; testOffset = 0.000000;  scanOffset = 0.000000;  
     #8.000000;        // 8.000000 ns;  From the start of the cycle.
      part_PIs [1] = stim_PIs [1];      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [21] = stim_PIs [21];      // pinName = rstz;  tf = +SC  ; testOffset = 8.000000;  scanOffset = 0.000000;  
     #8.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [1] = stim_CIs [1];      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [21] = stim_CIs [21];      // pinName = rstz;  tf = +SC  ; testOffset = 8.000000;  scanOffset = 0.000000;  
     #56.000000;        // 72.000000 ns;  From the start of the cycle.

      for ( POnum = 1; POnum <= 9; POnum = POnum + 1 ) begin 
        if (( part_POs [ POnum ] !== meas_POs [ POnum ] ) & ( meas_POs [ POnum ] !== 1'bX )) begin 
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-650): PO miscompare at pattern: %0s at Time: %0t ", PATTERN, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   On PO: %0s   ", meas_POs [ POnum ], part_POs [ POnum ], name_POs [ POnum ] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "BATCHARGER_controller", name_POs [ POnum ], PATTERN, -1, part_POs [ POnum ] ); 
          end  
        end  
        else if ( meas_POs [ POnum ] !== 1'bX )  good_compares = good_compares + 1; 
      end  
     #8.000000;        // 80.000000 ns;  From the start of the cycle.
      meas_POs = {9{1'bX}}; 

    end  
  endtask  

//***************************************************************************//
//                       DEFINE SCAN PRECOND PROCEDURE                       //
//***************************************************************************//

  task Scan_Preconditioning_Sequence_TM_1_SEQ_1_SOP_1; 
    begin 

      PROCESSNAME = "SCAN PRECONDITIONING (Scan_Preconditioning_Sequence)";
      stim_PIs [22] = 1'b1;      // pinName = se;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  

      test_cycle; 
      PROCESSNAME = "";
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                      DEFINE SCAN SEQUENCE PROCEDURE                       //
//***************************************************************************//

  task Scan_Sequence_TM_1_SEQ_2_SOP_1; 
    begin 

      PROCESSNAME = "SCAN SEQUENCE (Scan_Sequence)";
      SERIALCYCLE = SERIALCYCLE + MAX; 
      CYCLE = CYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.

      for ( SCANCYCLE = 1; SCANCYCLE <= MAX; SCANCYCLE = SCANCYCLE + 1 ) begin 

        if (( part_M_OR_1_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_1 [ 0 + SCANCYCLE ] ) & ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = so;  tf =  SO  ; 
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at pattern: %0s at Time: %0t ", PATTERN, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 1;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_1 [ 0 + SCANCYCLE ], part_M_OR_1_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [6] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "BATCHARGER_controller", name_POs [6], PATTERN, SCANCYCLE, part_M_OR_1_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 
      end  
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 [1:19] = stim_CR_1 [1:19]; 
     #16.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [1] = 1'b1;      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 24.000000 ns;  From the start of the cycle.
      part_PIs [1] = 1'b0;      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 80.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 = {19{1'bZ}};   
     #0; 
      meas_OR_1 = {19{1'bX}};   
      stim_CR_1 = {19{1'b0}};   
      stim_PIs = part_PIs; 
      SCANCYCLE = 0; 
      NUM_SHIFTS = 0; 
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                 READ COMMANDS AND DATA AND RUN SIMULATION                 //
//***************************************************************************//

  task cmd_code; 
    begin 

      if ( sim_trace )  $display ( "\nCommand code:  %0d ", CMD ); 

      case ( CMD ) 

        000: begin 
          rc_read = 0;  // This will stop execution 
          line_number = line_number + 1; 
        end  

        100: begin 
          rc_read = $fgets ( COMMENT, DATAID ); 
          if ( rc_read > 0 )  begin 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
          end  
          line_number = line_number + 1; 
        end  

        104: begin 
          rc_read = $fgets ( PROCESSNAME, DATAID ); 
          if ( rc_read > 0 )  begin 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, PROCESSNAME ); 
          end  
          line_number = line_number + 1; 
        end  

        110: begin 
          rc_read = $fgets ( COMMENT, DATAID ); 
          if ( rc_read > 0 )  begin 
            $display ( "\n %0s ", COMMENT ); 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
          end  
          line_number = line_number + 1; 
        end  

        200: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_PIs [1:80] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        201: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_CIs [1:80] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        202: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", meas_POs [1:9] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        203: begin 
          rc_read = $fscanf ( DATAID, "%b", global_term ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        300: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_1 [1:19] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                  endcase  
                end  
              end  

            endcase  
          end  
        end  

        301: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_1 [1:19] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                  endcase  
                end  
              end  

            endcase  
          end  
        end  

        400: begin 
          if ( sim_range )  test_cycle; 
          line_number = line_number + 1; 
        end  

        500: begin 
          repeat_depth = repeat_depth + 1; 
          rc_read = $fscanf ( DATAID, "%d", num_repeats [repeat_depth] ); 
          if ( rc_read > 0 )  begin 
            start_of_repeat[repeat_depth] = $ftell ( DATAID ); 
          end  
          else  bad_cmd_code; 
          if ((sim_range & sim_heart) && repeat_heart) 
            $display ( "\nINFO (TVE-202): Simulating pattern %0s at Time %0t.  Start of %0d cycles of a repeat loop.", pattern, $time, num_repeats [repeat_depth] ); 
          line_number = line_number + 1; 
        end  

        501: begin 
          num_repeats [repeat_depth] = num_repeats [repeat_depth] - 1; 
          if ( num_repeats [repeat_depth] )  begin 
            if ((sim_range & sim_heart) && repeat_heart && (num_repeats [repeat_depth] % repeat_heart == 0 )) 
              $display ( "\nINFO (TVE-202): Simulating pattern %0s at Time %0t.  Number of cycles remaining in this repeat loop is %0d.", pattern, $time, num_repeats [repeat_depth] ); 
            rc_read = $fseek ( DATAID, start_of_repeat [repeat_depth], 0 ); 
            rc_read = 1; 
            fseek_offset = $ftell ( DATAID ); 
            if ( fseek_offset != start_of_repeat [repeat_depth] )  begin 
              $display ( "\nERROR (TVE-956): An ncsim limitation in the fseek routine has been reached.  The size of the Verilog Data file is so big that it can not support branching using fseek in ncsim.  Any branching after 2147483647 (0x7fffffff) bytes of data will not run correctly under ncsim.  It is recommended that you break up the Verilog Data file using the keyword maxvectorsperfile.  The Verilog Data file:  %0s  \n", DATAFILE ); 
              rc_read = 0;  // This will stop execution 
            end  
          end  
          else  repeat_depth = repeat_depth - 1; 
          line_number = line_number + 1; 
        end  

        600: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SEQNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SEQNUM ) 

                    1: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Preconditioning_Sequence_TM_1_SEQ_1_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                    2: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Sequence_TM_1_SEQ_2_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                  endcase  
                end  
              end 

            endcase  
          end  
        end  

        900: begin 
          rc_read = $fscanf ( DATAID, "%s", pattern ); 
          if ( rc_read > 0 )  begin 
            if ( SOD == pattern )  begin 
              sim_range = 1'b1; 
            end  
            if (( CMD == 900 ) & sim_range & sim_heart )  $display ( "\nINFO (TVE-202): Simulating pattern %0s at Time %0t. ", pattern, $time ); 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        901: begin 
          rc_read = $fscanf ( DATAID, "%s", PATTERN ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        903: begin 
          measure_current = measure_current + 1; 
          line_number = line_number + 1; 
        end  

        904: begin 
          rc_read = $fscanf ( DATAID, "%s", eventID ); 
          if ( rc_read > 0 )  begin 
            `ifdef MISCOMPAREDEBUG 
              if ( diag_debug ) begin 
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "BATCHARGER_controller_inst", eventID ); 
              end 
            `endif 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        905: begin 
          rc_read = $fscanf ( DATAID, "%s", eventID ); 
          if ( rc_read > 0 )  begin 
            `ifdef MISCOMPAREDEBUG 
              if ( diag_debug ) begin 
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "BATCHARGER_controller_inst", eventID ); 
              end 
            `endif 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  


        default: begin 
          bad_cmd_code; 
          rc_read = 0;  // This will stop execution 
          line_number = line_number + 1; 
        end  

      endcase  

    end  
  endtask  

//***************************************************************************//
//                          PRINT BAD CMD CODE DATA                          //
//***************************************************************************//

  task bad_cmd_code; 
    begin 

      $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
      start_of_current_line = $ftell ( DATAID ); 
      rc_read = $fgets ( COMMENT, DATAID ); 
      $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
      rc_read = 0;  // This will stop execution 

    end  
  endtask  

  endmodule 
