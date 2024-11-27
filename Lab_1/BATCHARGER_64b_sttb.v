`timescale 1 ns / 10 ps


module BATCHARGER_64b_sttb;

  wire [63:0] vin; // input voltage; must be at least 200mV higher than vsensbat to allow iforcedbat > 0
  wire [63:0] vbat;  // battery voltage (V)
  wire [63:0] ibat;  // battery current (A)
  wire [63:0] vtbat;  // Battery temperature
  wire [63:0] dvdd;  // digital supply
  wire [63:0] dgnd;  // digital ground
  wire [63:0] pgnd;  // power ground		       


  reg en;  // enables the module
  reg [3:0]   sel;  // battery capacity selection bits: b[3,2,1,0] weights are 400,200,100,50 mAh + offset of 50mAh covers the range from 50 up to 800 mAh 


  real rl_dvdd, rl_dgnd, rl_pgnd;
  real rl_ibat, rl_vbat, rl_vtbat;
  real rl_vin;  // converted value of vin to real 




  BATCHARGER_64b uut (
      .iforcedbat(ibat),  // output current to battery
      .vsensbat(vbat), // voltage sensed (obtained at the battery as "voltage from iforcedbat integration" + ESR * iforcedbat)
      .vin(vin), // input voltage; must be at least 200mV higher than vsensbat to allow iforcedbat > 0
      .vbattemp(vtbat),	// voltage that represents the battery temperature -40ºC to 125ºC -> 0 to 0.5V	   
      .en(en),  // block enable control
      .sel(sel), // battery capacity selection bits: b[3,2,1,0] weights are 400,200,100,50 mAh + offset of 50mAh covers the range from 50 up to 800 mAh 
      .dvdd(dvdd),  // digital supply
      .dgnd(dgnd),  // digital ground
      .pgnd(pgnd)  // power ground		       

  );

/*
  BATCHARGERlipo lipobattery (
      .vbat (vbat),  // battery voltage (V)
      .ibat (ibat),  // battery current (A)
      .vtbat(vtbat)  // Battery temperature
  );
*/


  initial begin
    rl_vin = 4.5;
    rl_pgnd = 0.0;
    sel[3:0] = 4'b1000;  // 450mAh selection     
    rl_vtbat = 0.106; // Voltage corresponding to -5°C
    rl_vbat = 0.25;
    en = 1'b1;

    #3000

    if ($bitstoreal(ibat) != 0) begin
        $display("Error: Charging at -5°C with iforcedbat = %f A.", $bitstoreal(ibat));
    end else begin
        $display("Correct: No charging at -5°C (iforcedbat = %f A).", $bitstoreal(ibat));
    end

    #4000

    rl_vtbat = 0.136; // Voltage corresponding to 5°C

    #6000

    if ($bitstoreal(ibat) == 0) begin
      $display("Error: No charging at 5°C with iforcedbat = %f A.", $bitstoreal(ibat));
    end else begin
      $display("Correct: Charging at 5°C (iforcedbat = %f A).", $bitstoreal(ibat));
    end

    #7000

    rl_vbat = 3.5;

    #9000

    $display("Forced current at 3.5V battery voltage: %f A", $bitstoreal(ibat));





    #10000000;
    #10000000 $finish;

  end


  //-- Signals conversion ---------------------------------------------------
  initial assign rl_ibat = $bitstoreal(ibat);
  initial assign rl_dvdd = $bitstoreal(dvdd);
  initial assign rl_dgnd = $bitstoreal(dgnd);

  assign vbat = $realtobits(rl_vbat);
  assign vtbat = $realtobits(rl_vtbat);
  assign vin  = $realtobits(rl_vin);
  assign pgnd = $realtobits(rl_pgnd);

endmodule
