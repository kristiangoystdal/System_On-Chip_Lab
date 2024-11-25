`timescale 1ns / 1ps

module BATCHARGER_controller (
    output reg cc,      // Output to analog block: constant current mode with ich current
    output reg tc,      // Output to analog block: trickle mode with 0.1 x ich current
    output reg cv,      // Output to analog block: constant voltage mode vpreset voltage
    output reg imonen,  // Enables current monitor
    output reg vmonen,  // Enables voltage monitor
    output reg tmonen,  // Enables temperature monitor

    input vtok,  // Signals that voltage and temperature values are valid
    input [7:0] vbat,    // 8 bits data from ADC with battery voltage; vbat = adc(vref=0.5V, battery_voltage /10)
    input [7:0] ibat,    // 8 bits data from ADC with battery current; ibat = adc(vref=0.5V, battery_current * Rsens); 
    // Rsens = 0.5*vref/(0.5C); C = nominal capacity of battery; vadc(Ibat=0.5C) = vref/2
    input [7:0] tbat,  // 8 bits data from ADC with battery temperature; vadc = Temp/330 + 20/165; 
    // tbat = adc(vref=0.5V, vadc); vadc(-40º) = 0V, vadc(125º) = 0.5V
    input [7:0] vcutoff,  // Constant from OTP: voltage threshold for exiting trickle mode; 
    // vcutoff = Vcutof_dec * 255/5 = 51 * Vcutof_dec, e.g., 2.9V -> 1001_0011
    input [7:0] vpreset,  // Constant from OTP: voltage for constant voltage mode; 
    // vpreset = Vpreset_dec * 255/5 = 51 * Vpreset_dec, e.g., 3.7V -> 1011_1100
    input [7:0] tempmin,  // Constant from OTP: minimum temperature; see tbat for scaling
    input [7:0] tempmax,  // Constant from OTP: maximum temperature; see tbat for scaling
    input [7:0] tmax,    // Constant from OTP: maximum charge time; unit is 2^time_div_bits clock cycles (time_div_bits=8)
    input [7:0] iend,  // Charge current threshold for end of charging; 
    // e.g., 0.01C = 0.01 * 3.5 = 0.035 -> 0000_0010
    input clk,  // State machine clock
    input en,  // Enables the module
    input rstz,  // System reset
    inout dvdd,  // Digital supply
    inout dgnd  // Digital ground

);

  // State declarations
  parameter START = 3'b000, WAIT = 3'b001, TC = 3'b010, CC = 3'b011, CV = 3'b100, FINISH = 3'b101;

  reg [2:0] current_state, next_state;  // Registers for current and next states
  reg [15:0] tpreset;  // Time counter for preset time
  wire [15:0] tmax_scaled = tmax * 8'd255;

  reg timeout;  // Timeout signal

  parameter vmax = 8'b11010110;  // Maximum voltage for constant current mode

  // State transition logic (combinational)
  always @(*) begin
    case (current_state)
      START: begin
        if (en) begin 
          next_state = WAIT;  // If enabled, move to WAIT state
          tmonen = 1;  // Enable temperature monitor
        end else next_state = START;  // Remain in START state
      end

      WAIT: begin
        if (tempmin < tbat && tbat < tempmax) begin
          next_state = TC;  // Move to TC state if temperature is valid
          tc = 1; // Enable trickle mode
          vmonen = 1;  // Enable voltage monitor
        end else next_state = WAIT;  // Otherwise, remain in WAIT state
      end

      TC: begin
        if (vbat > vmax) next_state = FINISH;  // Example: Replace 4.2V with equivalent ADC value
        else if (vbat > vcutoff) begin
          next_state = CC;  // Move to CC state if voltage exceeds cutoff
          tc = 0;  // Disable trickle mode
          cc = 1;  // Enable constant current mode
        end
        else next_state = TC;  // Otherwise, remain in TC state
      end

      CC: begin
        if (vbat > vpreset) begin 
          next_state = CV;  // Move to CV state if voltage exceeds preset
          cc = 0;  // Disable constant current mode
          cv = 1;  // Enable constant voltage mode
          vmonen = 0;  // Disable voltage monitor
          imonen = 1;  // Enable current monitor
        end
        else next_state = CC;  // Otherwise, remain in CC state
      end

      CV: begin
        if (iend > ibat || tmax_scaled <= tpreset) begin
          if(tmax_scaled <= tpreset) timeout = 1;  // Signal timeout if time criteria met
          next_state = FINISH;  // Move to FINISH state if current or time criteria met
          cv = 0;  // Disable constant voltage mode
          imonen = 0;  // Disable current monitor
        end
        else next_state = CV;  // Otherwise, remain in CV state
      end

      FINISH: begin
        if (vbat < vcutoff) begin
          next_state = TC;  // Move to TC state if voltage exceeds cutoff
          tc = 1;  // Enable trickle mode
          vmonen = 1;  // Enable voltage monitor
        end else if (vbat > vcutoff && vbat < vpreset) begin
          next_state = CC;  // Move to CC state if voltage is below cutoff
          cc = 1;  // Enable constant current mode
          vmonen = 1;  // Enable voltage monitor
        end else next_state = FINISH;  // Otherwise, remain in FINISH state
      end

      default: begin
        next_state = WAIT;  // Default to WAIT state
      end
    endcase
  end

  // State update logic (sequential)
  always @(posedge clk or posedge rstz) begin
    if (!rstz) begin
      current_state <= START;   // Reset state to START
      tpreset       <= 11'b0;   // Reset time counter
      tc            <= 1'b0;    // Disable trickle mode
      cc            <= 1'b0;    // Disable constant current mode
      cv            <= 1'b0;    // Disable constant voltage mode
      imonen        <= 1'b0;    // Disable current monitor
      vmonen        <= 1'b0;    // Disable voltage monitor
      tmonen        <= 1'b0;    // Disable temperature monitor
      timeout       <= 0;       // Reset timeout
    end else begin
      if (tpreset >= tmax_scaled) begin
        timeout <= 1;  // Signal timeout when tpreset exceeds tmax
      end else begin
        timeout <= 0;  // Reset timeout
      end

      if(current_state == TC || current_state == CC || current_state == CV) begin
        tpreset <= tpreset + 1;   // Increment time counter
      end else begin
        tpreset <= 11'b0;    // Reset time counter
      end
      
      current_state <= next_state;    // Update current state
    end
  end
endmodule
