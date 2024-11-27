`timescale 1ns / 10ps

module BATCHARGER_64b_sttb;

  // Signal Declarations
  wire [63:0] iforcedbat;  // Current forced to battery
  reg  [63:0] vsensbat;  // Voltage sensed at the battery
  reg  [63:0] vin;  // Input voltage
  reg  [63:0] vbattemp;  // Battery temperature voltage
  reg         en;  // Enable signal
  reg  [ 3:0] sel;  // Battery capacity selection
  wire [63:0] dvdd, dgnd, pgnd;  // Digital and power ground wires
  reg clk, rstz;  // Clock and reset signals

  // Assign Values to Ground and Power Signals
  assign dvdd = $realtobits(1.8);  // Digital supply: 1.8V
  assign dgnd = $realtobits(0.0);  // Ground
  assign pgnd = $realtobits(0.0);  // Ground

  // Instantiate the DUT
  BATCHARGER_64b_new uut (
      .iforcedbat(iforcedbat),
      .vsensbat(vsensbat),
      .vin(vin),
      .vbattemp(vbattemp),
      .en(en),
      .sel(sel),
      .dvdd(dvdd),
      .dgnd(dgnd),
      .pgnd(pgnd)
  );

  // Clock Generation: 10ns clock period
  always #5 clk = ~clk;

  // Task for Signal Validation
  task check_signal(input real expected_value, input real tolerance, input [8*50:1] signal_name,
                    input integer step_id);
    real actual_value;
    begin
      actual_value = $bitstoreal(iforcedbat);
      if (actual_value < (expected_value - tolerance) || actual_value > (expected_value + tolerance)) begin
        $display("Error at step %0d: %s out of range. Expected: %0f +/- %0f, Got: %0f", step_id,
                 signal_name, expected_value, tolerance, actual_value);
        $finish;
      end else begin
        $display("Pass at step %0d: %s within range. Expected: %0f +/- %0f, Got: %0f", step_id,
                 signal_name, expected_value, tolerance, actual_value);
      end
    end
  endtask

  // Test Procedure
  initial begin
    // Initialize signals
    clk      = 0;
    rstz     = 0;
    en       = 0;
    sel      = 4'b0000;
    vin      = $realtobits(4.5);  // Input voltage: 4.5V
    vsensbat = $realtobits(3.7);  // Initial battery voltage: 3.7V
    vbattemp = $realtobits(0.25);  // Battery temperature voltage: 0.25V

    // Reset the system
    #10 rstz = 1;

    // Test Sequence
    #10 en = 1;
    sel = 4'b1010;  // Enable module, set capacity to 450mAh
    #100 check_signal(0.0, 0.01, "iforcedbat", 1);  // Check initial charging current

    // Simulate constant current charging
    vsensbat = $realtobits(3.8);  // Battery voltage increases
    #50 check_signal(0.8, 0.05, "iforcedbat", 2);  // Check CC charging current

    // Simulate constant voltage charging
    vsensbat = $realtobits(4.2);  // Battery reaches target voltage
    #50 check_signal(0.05, 0.01, "iforcedbat", 3);  // Check reduced charging current

    // High temperature scenario
    vbattemp = $realtobits(0.5);  // High temperature voltage
    #50 check_signal(0.0, 0.01, "iforcedbat", 4);  // Ensure charging stopped

    // Disable the module
    en = 0;
    #50 check_signal(0.0, 0.01, "iforcedbat", 5);  // Ensure module disabled

    // Final Message
    $display("All tests passed successfully!");
    $finish;
  end

endmodule
