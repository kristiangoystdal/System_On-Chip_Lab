`timescale 1 ns / 10 ps

module BATCHARGER_64b_sttb;

  // Define the input and output signals
  wire [63:0] vin;     // Input voltage
  wire [63:0] vbat;    // Battery voltage
  wire [63:0] ibat;    // Battery current
  wire [63:0] vtbat;   // Battery temperature
  wire [63:0] dvdd;    // Digital supply
  wire [63:0] dgnd;    // Digital ground
  wire [63:0] pgnd;    // Power ground

  reg en;              // Module enable signal
  reg [3:0] sel;       // Battery capacity selection bits

  real rl_vin, rl_vbat, rl_ibat, rl_vtbat, rl_pgnd;
  real expected_ibat;

  integer fail_counter = 0;
  integer test_counter = 0;

  BATCHARGER_64b uut (
      .iforcedbat(ibat), 
      .vsensbat(vbat),
      .vin(vin),
      .vbattemp(vtbat), 
      .en(en), 
      .sel(sel), 
      .dvdd(dvdd), 
      .dgnd(dgnd), 
      .pgnd(pgnd)
  );

  initial begin
    en = 1'b1;
    rl_pgnd = 0.0;
    rl_vin = 4.5;  // Initialize input voltage
    sel = 4'b1000; // Set battery capacity

    // Loop through a range of battery temperatures and voltages
    for (rl_vtbat = 0.1; rl_vtbat < 0.3; rl_vtbat = rl_vtbat + 0.1) begin
      for (rl_vbat = 2.5; rl_vbat <= 4.2; rl_vbat = rl_vbat + 0.001) begin
        test_counter = test_counter + 1;
        #5000; // Time delay for each state
        expected_ibat = calculate_expected_ibat(rl_vtbat, rl_vbat, rl_vin);
        if (!((expected_ibat - 0.005 < $bitstoreal(ibat)) && ($bitstoreal(ibat) < expected_ibat + 0.005))) begin
          $display("---Mismatch: Expected %f A, but got %f A at T=%f Vbat=%f",
                    expected_ibat, $bitstoreal(ibat), rl_vtbat, rl_vbat);
                    fail_counter = fail_counter + 1;
        end else begin
          $display("Match: Expected %f A, and got %f A at T=%f Vbat=%f",
                    expected_ibat, $bitstoreal(ibat), rl_vtbat, rl_vbat);
        end
      end
    end
    $display("FINISHED. Failed %d of %d tests", fail_counter, test_counter);
    $finish;
  end


  // Conversion of real to binary for compatibility
  assign vbat = $realtobits(rl_vbat);
  assign vtbat = $realtobits(rl_vtbat);
  assign vin  = $realtobits(rl_vin);
  assign pgnd = $realtobits(rl_pgnd);

  // Function to calculate the expected battery current based on state
  function real calculate_expected_ibat;
    input real vtbat, vbat, vin;
    begin
      if (vtbat < 0.121) begin // Too cold to charge
        calculate_expected_ibat = 0.0;
      end else if (vin < vbat + 0.2) begin // Insufficient input voltage
        calculate_expected_ibat = 0.0;
      end else if (vbat <= 3) begin
        calculate_expected_ibat = 0.0450;
      end else if (vbat > 3 && vbat < 3.8) begin
        calculate_expected_ibat = 0.225;
      end else if ((vbat >= 3.8)) begin
        if (((4.2 - vbat) / 1.8) > 0.0045) begin
        calculate_expected_ibat = ((4.2 - vbat) / 1.8);
        end else begin
        calculate_expected_ibat = 0;
        end
      end else begin
        calculate_expected_ibat = 0;
      end
    end
  endfunction

endmodule
