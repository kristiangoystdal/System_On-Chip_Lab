module FULLCHIP (
    vsensbat,
    vin,
    vbattemp,
    en,
    iforcedbat,
    sel,
    pgnd,
    dvdd,
    dgnd
);
  inout pgnd, dvdd, dgnd;
  output iforcedbat;
  input vsensbat, vin, vbattemp, en;
  input [3:0] sel;

  wire pu, pd, smt, enable, e2, e4, sr;
  wire iforcedbat_core, vsensbat_core, vin_core, vbattemp_core, en_core;
  wire [3:0] sel_core;

  assign pu = 1'b0;
  assign pd = 1'b0;
  assign smt = 1'b0;
  assign enable = 1'b1;
  assign e2 = 1'b0;
  assign e4 = 1'b0;
  assign sr = 1'b1;

  FULLCHIPcore core_instance (
      .iforcedbat(iforcedbat),
      .vsensbat(vsensbat_core),
      .vin(vin_core),
      .vbattemp(vbattemp_core),
      .en(en_core),
      .sel(sel_core),
      .dvdd(dvdd),
      .dgnd(dgnd),
      .pgnd(pgnd)
  );

  LCUT12HB instlc ();

  VCC12ACUTHB vccinst2 (.VCC12ANA(dvdd));

  ULSCI0CUTHB analogpad (.O(dgnd));

  GNDACUTHB gndinst2 (.GNDANA(pgnd));

  RCUT12HB instrc ();

  GND3IOHB gndio;
  VCC3IOHB vcc3io;

  GNDKHB gndinst1 (.GND(pgnd));
  VCCKHB vccinst1 (.VCC(dvdd));

  XMHB inst1 (
      .O  (sel_core[0]),
      .I  (sel[0]),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );
  XMHB inst2 (
      .O  (sel_core[1]),
      .I  (sel[1]),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );
  XMHB inst3 (
      .O  (sel_core[2]),
      .I  (sel[2]),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );
  XMHB inst4 (
      .O  (sel_core[3]),
      .I  (sel[3]),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );

  XMHB inst5 (
      .O  (en_core),
      .I  (en),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );

  XMHB inst6 (
      .O  (vin_core),
      .I  (vin),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );

  XMHB inst7 (
      .O  (vsensbat_core),
      .I  (vsensbat),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );

  XMHB inst8 (
      .O  (vbattemp_core),
      .I  (vbattemp),
      .PU (pu),
      .PD (pd),
      .SMT(smt)
  );

  YA28SHB inst9 (
      .O (iforcedbat),
      .I (iforcedbat_core),
      .E (enable),
      .E2(e2),
      .E4(e4),
      .SR(sr)
  );

endmodule
