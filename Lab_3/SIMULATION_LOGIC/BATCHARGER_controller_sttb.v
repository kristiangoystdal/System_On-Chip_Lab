`timescale 1ns / 1ps

module BATCHARGER_controller_sttb;

  // Signals
  wire       cc;  // Constant current mode
  wire       tc;  // Trickle mode
  wire       cv;  // Constant voltage mode
  wire       imonen;  // Current monitor enable
  wire       vmonen;  // Voltage monitor enable
  wire       tmonen;  // Temperature monitor enable
  reg  [7:0] vbat;  // Battery voltage
  reg  [7:0] ibat;  // Battery current
  reg  [7:0] tbat;  // Battery temperature
  reg  [7:0] vcutoff;  // Trickle mode exit voltage
  reg  [7:0] vpreset;  // Constant voltage mode threshold
  reg  [7:0] tempmin;  // Minimum temperature
  reg  [7:0] tempmax;  // Maximum temperature
  reg  [7:0] tmax;  // Maximum charge time
  reg  [7:0] iend;  // End charging current threshold
  reg        clk;  // Clock
  reg        en;  // Enable signal
  reg        rstz;  // Reset
  reg        vtok;  // Valid temperature and voltage signal
  wire       dvdd;  // Digital supply
  wire       dgnd;  // Digital ground

  wire       se;
  wire       si;
  wire       so;

  // Instantiate the DUT
  BATCHARGER_controller uut (
      .cc(cc),
      .tc(tc),
      .cv(cv),
      .imonen(imonen),
      .vmonen(vmonen),
      .tmonen(tmonen),
      .vbat(vbat),
      .ibat(ibat),
      .tbat(tbat),
      .vcutoff(vcutoff),
      .vpreset(vpreset),
      .tempmin(tempmin),
      .tempmax(tempmax),
      .tmax(tmax),
      .iend(iend),
      .clk(clk),
      .rstz(rstz),
      .en(en),
      .vtok(vtok),
      .dvdd(dvdd),
      .dgnd(dgnd),
      .se(se),
      .si(si),
      .so(so)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Self-checking logic using integers for messages
  task check_state(input [2:0] expected_state, input integer step_id,
                   input [8*50:1] print_message);
    begin
      #1;
      if (uut.current_state !== expected_state) begin
        $display("Error at step %0d: Expected state = %b, Got state = %b", step_id, expected_state,
                 uut.current_state);
        $finish;
      end else begin
        $display("Pass at step %0d: Expected state = %b - %s", step_id, expected_state,
                 print_message);
      end
    end
  endtask

  initial begin
    // Initialize signals
    clk = 0;
    vtok = 0;
    rstz = 0;
    en = 0;

    vbat = 8'b10011001;   // Initial Vbat = 3V
    ibat = 8'b01100110;   // Initial Ibat = 0.2C
    tbat = 8'b00110110;   // Initial Tbat = 54°C
    vcutoff = 8'b10100011;  // Vcutoff = 3.2V
    vpreset = 8'b11000111;  // Vpreset = 3.9V
    tempmin = 8'b00101110;  // Tempmin = -10°C
    tempmax = 8'b10001011;  // Tempmax = 50°C
    tmax = 8'b00001000;     // Tmax = 2040 clock cycles
    iend = 8'b00110011;     // Iend = 0.1C

    // Test sequence
    #10 rstz = 1;
    en   = 1;
    vtok = 1;  // Release reset, enable controller

    #20
      check_state(
          3'b001,
          0,
          "Waiting for valid temperature and voltage"); // Step 0: Waiting for valid temperature and voltage
    #100 tbat = 8'b01100101;

    // Check trickle mode
    #10 check_state(3'b010, 1, "Trickle mode expected from wait mode");  // Step 1: TC mode expected

    #100 vbat = 8'b10100100;  // Vbat = Vcutoff + 1
    #10 check_state(3'b011, 2, "CC mode expected from TC");  // Step 2: CC mode expected

    #100 vbat = 8'b11001000;  // Vbat = Vpreset + 1
    #10 check_state(3'b100, 3, "CV mode expected from CC");  // Step 3: CV mode expected

    #100 ibat = 8'b00110010;  // Ibat < 0.1C
    #10
      check_state(
          3'b101, 4, "Finish mode by minimum current");  // Step 4: Exit CV mode by minimum current

    #100 ibat = 8'b01100110;  // Initial Ibat = 0.2C
    #100 vbat = 8'b11000110;  // Vbat = Vpreset - 1
    #10 check_state(3'b011, 5, "CC mode expected from Finish");  // Step 5: CC mode expected

    #100 vbat = 8'b11001000;  // Vbat = Vpreset + 1
    #10 check_state(3'b100, 6, "CV mode expected from CC");  // Step 6: CV mode expected

    #21000 #10 check_state(3'b101, 7, "Timeout expected");  // Step 7: Timeout expected

    vbat = 8'b10011001;  // Initial Vbat = 3V
    ibat = 8'b01100110;  // Initial Ibat = 0.2C

    #10 check_state(3'b010, 8, "Trickle mode expected from Finish");  // Step 8: TC mode expected

    #100 vbat = 8'b10100100;  // Vbat = Vcutoff + 1
    #10 check_state(3'b011, 9, "CC mode expected from TC");  // Step 9: CC mode expected

    #100 vbat = 8'b11001000;  // Vbat = Vpreset + 1
    #10 check_state(3'b100, 10, "CV mode expected from CC");  // Step 10: CV mode expected

    #100 ibat = 8'b00110010;  // Ibat < 0.1C
    #10
      check_state(
          3'b101,
          11,
          "Finish mode by minimum current");  // Step 11: Finish by minimum current expected

    #1000 $finish;
  end

endmodule
