`timescale 1ns / 1ps


module BATCHARGERsaradc_64b_tb;

  wire [ 7:0] vbat;  // 8 bits data with battery voltage conversion result
  wire [ 7:0] ibat;  // 8 bits data with battery current conversion result
  wire [ 7:0] tbat;  // 8 bits data with battery temperature conversion result	       
  wire [63:0] vref;  // voltage reference to be used as full scale value (vref = 0.5V)
  wire [63:0] ibias1u;  // current reference 
  wire [63:0] vbattemp;  // temperature normalized value: -40 to 125 fitted in the range 0V to vref
  wire [63:0] vbatvolt;  // battery voltage devided by 10
  wire [63:0] vbatcurr;  // current proportional to battery current (1000:1) * (R = Vref/C)
  reg         imeasen;  // enables battery current periodic monitor
  reg         vmeasen;  // enables battery voltage periodic monitor 
  reg         tmeasen;  // enables battery temperature periodic monitor	              
  reg         clk;  // state machine clock
  reg         rstz;  // system reset
  reg         en;  // block enable
  wire        vtok;
  wire [63:0] dvdd;  // digital supply
  wire [63:0] dgnd;  // digital ground
  wire [63:0] avdd;  // analog supply
  wire [63:0] agnd;  // analog ground



  real        rl_vbatvolt;
  real        rl_vbatcurr;
  real        rl_vbattemp;
  real        rl_vref;
  real        rl_ibias1u;
  real        rl_avdd;
  real        rl_dvdd;
  real        rl_agnd;
  real        rl_dgnd;
  real        rl_resibat;



  parameter tempch = 0, currch = 1, voltch = 2, noch = 3;  // input multiplexer states
  parameter eocstate=0, bit7=12, bit6=4, bit5=5, bit4=7, bit3=6, bit2=2, bit1=3, bit0=1, start=8;  // Sucessive Aproximations Register (SAR) ADC states
  parameter C = 3.5;



  BATCHARGERsaradc_64b uut (
      .vbat(vbat),
      .ibat(ibat),
      .tbat(tbat),
      .vref(vref),
      .ibias1u(ibias1u),
      .vtok(vtok),
      .vbattemp(vbattemp),
      .vbatvolt(vbatvolt),
      .vbatcurr(vbatcurr),
      .imeasen(imeasen),
      .vmeasen(vmeasen),
      .tmeasen(tmeasen),
      .en(en),
      .clk(clk),
      .rstz(rstz),
      .avdd(avdd),
      .dvdd(dvdd),
      .dgnd(dgnd),
      .agnd(agnd)
  );


  initial assign rl_resibat = 1000 * rl_vref / C;


  initial begin
    clk = 0;
    rstz = 0;  // active 0 reset at the begining
    en = 1;
    imeasen = 0;
    vmeasen = 0;
    tmeasen = 0;  // all measurements are disabled at beginning of simulation
    rl_vref = 0.5;
    rl_ibias1u = 1e-6;
    rl_dvdd = 1.2;
    rl_avdd = 1.8;
    rl_dgnd = 0.0;
    rl_agnd = 0.0;
    #1 rl_vbatvolt = 0.3;  // delay to allow vref to propagate to rl_resibat
    rl_vbatcurr = rl_resibat * 1.75e-3;
    rl_vbattemp = 0.19;
  end

  always #5 clk = ~clk;


  initial begin
    #12 rstz = 1;  // reset end
    #100;  // start state must be kept since no measurement is enabled
    if (uut.state != start) begin
      $display("ERROR: start state was not kept with measurements disabled");
      $finish;
    end
    #10 imeasen = 1;
    wait (uut.eoc);
    #2
      $display(
          "ibat real value %f converted to %b=%f",
          rl_vbatcurr / rl_resibat,
          ibat,
          (ibat[7]*128+ibat[6]*64+ibat[5]*32+ibat[4]*16+ibat[3]*8+ibat[2]*4+ibat[1]*2+ibat[0])*rl_vref/(255 * rl_resibat)
      );
    wait (uut.ready);
    imeasen = 0;
    vmeasen = 1;
    wait (uut.eoc);
    #2
      $display(
          "vbat real value %f converted to %b=%f",
          rl_vbatvolt,
          vbat,
          (vbat[7]*128+vbat[6]*64+vbat[5]*32+vbat[4]*16+vbat[3]*8+vbat[2]*4+vbat[1]*2+vbat[0])*5.0/255
      );  // voltage is first divided by 10, before converting
    wait (uut.ready);
    vmeasen = 0;
    tmeasen = 1;
    wait (uut.eoc);
    #2
      $display(
          "bat temp real value %f converted to %b=%f",
          (rl_vbattemp / rl_vref) * 165.0 - 40.0,
          tbat,
          (tbat[7]*128+tbat[6]*64+tbat[5]*32+tbat[4]*16+tbat[3]*8+tbat[2]*4+tbat[1]*2 +tbat[0]) * 165.0 / 255.0 - 40.0
      );
    wait (uut.ready);
    #12 vmeasen = 1;
    imeasen = 1;

    #1000 $finish;
  end






  //-- Signal conversion ------------------

  //   initial assign rl_var1    = $bitstoreal (var1_64b);
  //   assign var2_64b           = $realtobits (rl_var2);

  assign avdd     = $realtobits(rl_avdd);
  assign dvdd     = $realtobits(rl_dvdd);
  assign agnd     = $realtobits(rl_agnd);
  assign dgnd     = $realtobits(rl_dgnd);
  assign vref     = $realtobits(rl_vref);
  assign ibias1u  = $realtobits(rl_ibias1u);
  assign vbatvolt = $realtobits(rl_vbatvolt);
  assign vbatcurr = $realtobits(rl_vbatcurr);
  assign vbattemp = $realtobits(rl_vbattemp);


endmodule  // saradc




