

module FULLCHIP (
    count_dir,
    enable,
    reset,
    count,
    vctrl
);
  input enable, reset, count_dir, vctrl;
  output [3:0] count;

  wire pu, pd, smt, en, e2, e4, sr;
  wire [7:0] count_core;


  assign pu  = 1'b0;
  assign pd  = 1'b0;
  assign smt = 1'b0;
  assign en  = 1'b1;
  assign e2  = 1'b0;
  assign e4  = 1'b0;
  assign sr  = 1'b1;


  FULLCHIPcore counter12 (
      .enable(enable_core),
      .count_dir(count_dir_core),
      .reset(reset_core),
      .count(count_core),
      .vctrl(vctrl),
      .avdd(avdd),
      .agnd(agnd),
      .dvdd(dvdd)
  );


  LCUT12HB instlc ();

  VCC12ACUTHB vccinst2 (.VCC12ANA(avdd));

  ULSCI0CUTHB analogpad (.O(vctrl));

  GNDACUTHB gndinst2 (.GNDANA(agnd));

  RCUT12HB instrc ();

  GND3IOHB gndio;
  VCC3IOHB vcc3io;


  GNDKHB gndinst1 (.GND(agnd));
  VCCKHB vccinst1 (.VCC(dvdd));

  XMHB inst1 (
      .O  (enable_core),
      .I  (enable),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );
  XMHB inst2 (
      .O  (reset_core),
      .I  (reset),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );
  XMHB inst3 (
      .O  (count_dir_core),
      .I  (count_dir),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );

  YA28SHB inst4 (
      .O (count[0]),
      .I (count_core[0]),
      .E (en),
      .E2(e2),
      .E4(e4),
      .SR(sr)
  );
  YA28SHB inst5 (
      .O (count[1]),
      .I (count_core[1]),
      .E (en),
      .E2(e2),
      .E4(e4),
      .SR(sr)
  );
  YA28SHB inst6 (
      .O (count[2]),
      .I (count_core[2]),
      .E (en),
      .E2(e2),
      .E4(e4),
      .SR(sr)
  );
  YA28SHB inst7 (
      .O (count[3]),
      .I (count_core[3]),
      .E (en),
      .E2(e2),
      .E4(e4),
      .SR(sr)
  );

endmodule

