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


  BATCHARGERlipo lipobattery (
      .vbat (vbat),  // battery voltage (V)
      .ibat (ibat),  // battery current (A)
      .vtbat(vtbat)  // Battery temperature
  );

  reg clk;
  reg clk1;

  always begin
    #10 clk = ~clk;

  end
  always begin
    #5 clk1 = ~clk1;
  end

  initial begin
    clk = 0;
    rl_vin = 4.5;
    rl_pgnd = 0.0;
    sel[3:0] = 4'b1000;  // 450mAh selection     
    en = 1'b1;

    #10000000;
    #10000000 $finish;
  end

  real expected_i_value;
  reg [2:0] Step_id;
  reg [63:0] temp_current_reg;
  real temp_current = 0;

  task check_state_rl_value_I(input real i_value, input [2:0] step_id);
    begin
      #1;

      // TC (Triple Current) mode
      if (step_id == 3'b001) begin
        expected_i_value = 0.1 * 0.45;

        // Check if the current is within the expected range (10% tolerance)
        if ((expected_i_value * 1.1) < i_value || expected_i_value * 0.9 > i_value) begin
          $display("Error at step %0d: Expected i_value = %f, Got i_value = %f", step_id,
                   expected_i_value, i_value);
          // $finish;
        end
      end

      // CC (Constant Current) mode
      if (step_id == 3'b010) begin
        expected_i_value = 0.5 * 0.45;

        // Check if the current is within the expected range (10% tolerance)
        if ((expected_i_value * 1.1) < i_value || expected_i_value * 0.9 > i_value) begin
          $display("Error at step %0d: Expected i_value = %f, Got i_value = %f", step_id,
                   temp_current, i_value);
          // $finish;
        end
      end

      // CV (Constant Voltage) mode
      if (step_id == 3'b100) begin
        expected_i_value = temp_current;

        // Check if the current is lower than the expected value
        if (expected_i_value < i_value) begin
          $display("Error at step %0d: Expected i_value = %f, Got i_value = %f", step_id,
                   expected_i_value, i_value);
          // $finish;
        end
      end
    end
  endtask


  //-- Signals conversion ---------------------------------------------------
  initial assign rl_vbat = $bitstoreal(vbat);
  initial assign rl_vtbat = $bitstoreal(vtbat);
  initial assign rl_ibat = $bitstoreal(ibat);
  initial assign rl_dvdd = $bitstoreal(dvdd);
  initial assign rl_dgnd = $bitstoreal(dgnd);

  assign vin  = $realtobits(rl_vin);
  assign pgnd = $realtobits(rl_pgnd);

  always @(posedge clk) begin
    temp_current_reg = $realtobits(uut.rl_iforcedbat);
    temp_current = $bitstoreal(temp_current_reg);
    Step_id = {uut.cv, uut.cc, uut.tc};

    check_state_rl_value_I(uut.rl_iforcedbat, Step_id);
  end
endmodule






