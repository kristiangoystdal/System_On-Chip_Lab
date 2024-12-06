`timescale 1 ns / 10 ps

module BATCHARGER_64b_sttb;

  // Define the input and output signals
  wire [63:0] vin;  // Input voltage
  wire [63:0] vbat;  // Battery voltage
  wire [63:0] ibat;  // Battery current
  wire [63:0] vtbat;  // Battery temperature
  wire [63:0] dvdd;  // Digital supply
  wire [63:0] dgnd;  // Digital ground
  wire [63:0] pgnd;  // Power ground

  reg         en;  // Module enable signal
  reg  [ 3:0] sel;  // Battery capacity selection bits

  real rl_vin, rl_vbat, rl_ibat, rl_vtbat, rl_pgnd;
  real expected_ibat;

  real tolerance = 0.005;  // Tolerance for current comparison
  real rl_C = 0.45;  // Battery capacity in Ah

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
    sel = 4'b1000;  // Set battery capacity

    // Loop through a range of battery temperatures and voltages
    for (rl_vtbat = 0.0; rl_vtbat <= 0.31; rl_vtbat = rl_vtbat + 0.1) begin
      for (rl_vbat = 2.5; rl_vbat <= 4.2; rl_vbat = rl_vbat + 0.01) begin
        #5000;  // Time delay for each state
        expected_ibat = calculate_expected_ibat(rl_vtbat, rl_vbat, rl_vin);
        if (!((expected_ibat - tolerance < $bitstoreal(
                ibat
            )) && ($bitstoreal(
                ibat
            ) < expected_ibat + tolerance))) begin
          $display("Mismatch: Expected %f A, but got %f A at T=%f Vbat=%f", expected_ibat,
                   $bitstoreal(ibat), rl_vtbat, rl_vbat);
        end else begin
          $display("Match: Correct current, %f, at T=%f, Vbat=%f", expected_ibat, rl_vtbat,
                   rl_vbat);
        end
      end
    end

    #1000000 $display("Simulation complete");
    $finish;
  end

  // Conversion of real to binary for compatibility
  assign vbat  = $realtobits(rl_vbat);
  assign vtbat = $realtobits(rl_vtbat);
  assign vin   = $realtobits(rl_vin);
  assign pgnd  = $realtobits(rl_pgnd);

  // Conversion of binary to real for compatibility
  always @(*) begin
    rl_ibat = $bitstoreal(ibat);
  end

  // Function to calculate the expected battery current based on state
  function real calculate_expected_ibat;
    input real vtbat, vbat, vin;
    begin
      if (vtbat < 0.121 || vtbat > 0.265625) begin  // Too cold to charge
        calculate_expected_ibat = 0.0;
      end else if (vin < vbat + 0.2) begin  // Insufficient input voltage
        calculate_expected_ibat = 0.0;
      end else if (vbat <= 3) begin
        calculate_expected_ibat = 0.1 * rl_C;
      end else if (vbat > 3 && vbat < 3.8) begin
        calculate_expected_ibat = 0.5 * rl_C;
      end else if (vbat >= 3.8) begin
        if (((4.2 - vbat) / 1.8) > 0.01 * rl_C) begin
          calculate_expected_ibat = ((4.2 - vbat) / 1.8);
        end else begin
          calculate_expected_ibat = 0;
        end
      end
    end
  endfunction



endmodule
