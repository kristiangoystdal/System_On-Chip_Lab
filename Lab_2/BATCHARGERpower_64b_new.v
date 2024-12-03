`timescale 1ns / 1ps

module BATCHARGERpower_64b_new (
    output reg [63:0] iforcedbat,  // output current to battery
    output reg [63:0] vbatcurr, // scaled mirrored current of iforcedbat (1000:1) x R ; R=Vref/C  (C is battery capacity)
    input [63:0]  vsensbat, // voltage sensed (obtained at the battery as "voltage from iforcedbat integration" + ESR * iforcedbat )			    
    input [63:0] vref,  // voltage reference (vref = 0.5V)
    input [63:0]  vin, // input voltage; must be at least 200mV higher than vsensbat to allow iforcedbat > 0
    input [63:0] ibias1u,  // reference current	(ibias1u = 1uA)
    input [7:0]   icc, // constant current mode output current value icc=8'b1111_1111 -> iforced = 2A; ex: icc=8'b11011111 -> iforced = 1.75A (0.5C)
    input [7:0]   itc, //  trickle current mode output current value itc=8'b1111_1111 -> iforced = 2A; ex: itc=8'b00101100 -> iforced = 0.35A (0.1C)
    input [7:0] vcv,  // constant voltage target value vcv = Vtarget*255/5 = 51*Vtarget
    input cc,  // enables constant current charging mode
    input tc,  // enables trickle  current charging mode 
    input cv,  // enables constant voltage charging mode
    input en,  // enables the module
    input [3:0]   sel, // battery capacity selection bits: b[3,2,1,0] weights are 400,200,100,50 mAh + offset of 50mAh covers the range from 50 up to 800 mAh 
    inout [63:0] avdd,  // analog supply to other modules
    inout [63:0] dvdd,  // digital supply to other modules
    inout [63:0] dgnd,  // digital ground
    inout [63:0] agnd,  // analog ground
    inout [63:0] pgnd  // power ground
);

  parameter IBIASMAX = 1.1e-6;
  parameter IBIASMIN = 0.9e-6;  // current limits for ibias1u acceptance
  parameter VINMIN = 3;  // minimum vin
  parameter DROPMIN = 0.2;  // minimum difference between vin and vsensbat
  parameter VREFMIN = 0.45;
  parameter VREFMAX = 0.55;  // voltage limits for vref acceptance

  real rl_vref;  // converted value of vref to real
  real rl_imirr;  // scaled mirrored current of iforcedbat (1000:1)
  real rl_iforcedbat;  // iforcedbat real value
  real rl_vsensbat;  // converted value of vsensbat to real 
  real rl_vin;  // converted value of vin to real 
  real rl_ibias1u;  // converted value of ibias1u to real 
  real rl_resibat;
  real rl_vbatcurr;
  real rl_C;  // [Ah] battery capacity
  real rl_Rch;     // [Ohm] constant voltage mode resistance: zero current step if Rch = (vcv - vpreset) / icc; Ex (4.2-3.8)/0.21 = 1.9 Ohm

  real rl_icc;
  real rl_itc;
  real rl_vcv;

  wire supply_ok;
  wire ibias_ok;
  wire vin_ok;
  wire vref_ok;

  // Check if the supply voltages are within acceptable ranges
  assign supply_ok = ($bitstoreal(
      avdd
  ) > 0) && ($bitstoreal(
      dvdd
  ) > 0) && ($bitstoreal(
      dgnd
  ) == 0) && ($bitstoreal(
      agnd
  ) == 0) && ($bitstoreal(
      pgnd
  ) == 0);

  // Check if the bias current is within acceptable ranges
  assign ibias_ok = ($bitstoreal(ibias1u) >= IBIASMIN) && ($bitstoreal(ibias1u) <= IBIASMAX);

  // Check if the input voltage is within acceptable ranges
  assign vin_ok = ($bitstoreal(
      vin
  ) >= VINMIN) && ($bitstoreal(
      vin
  ) - $bitstoreal(
      vsensbat
  ) >= DROPMIN);

  // Check if the reference voltage is within acceptable ranges
  assign vref_ok = ($bitstoreal(vref) >= VREFMIN) && ($bitstoreal(vref) <= VREFMAX);

  always @(*) begin
    // Convert input values to real
    rl_vref = $bitstoreal(vref);
    rl_vsensbat = $bitstoreal(vsensbat);
    rl_vin = $bitstoreal(vin);
    rl_ibias1u = $bitstoreal(ibias1u);

    if (en && vin_ok && vref_ok && ibias_ok && supply_ok) begin
      // Calculate battery capacity
      rl_C = 0.050 + (sel[3] * 0.400) + (sel[2] * 0.200) + (sel[1] * 0.100) + (sel[0] * 0.050);

      // Calculate the target voltage
      rl_vcv = 5 * (0.502 * vcv[7] + 0.251 * vcv[6] + 0.1255 * vcv[5] + 0.0627 * vcv[4] + 0.0314 * vcv[3] + 0.0157 * vcv[2] + 0.0078 * vcv[1] + 0.0039 * vcv[0]);

      // Calculate the constant voltage mode resistance
      rl_Rch = 0.4 / (0.5 * rl_C);

      // Calculate forced battery current
      if (cc) begin
        rl_iforcedbat = rl_C * (0.502 * icc[7] + 0.251 * icc[6] + 0.1255 * icc[5] + 0.0627 * icc[4] + 0.0314 * icc[3] + 0.0157 * icc[2] + 0.0078 * icc[1] + 0.0039 * icc[0]);
      end else if (tc) begin
        rl_iforcedbat = rl_C * (0.502 * itc[7] + 0.251 * itc[6] + 0.1255 * itc[5] + 0.0627 * itc[4] + 0.0314 * itc[3] + 0.0157 * itc[2] + 0.0078 * itc[1] + 0.0039 * itc[0]);
      end else if (cv) begin
        rl_iforcedbat = (rl_vcv - rl_vsensbat) / rl_Rch;
      end else begin
        rl_iforcedbat = 0;
      end

      // Calculate the scaled mirrored current of iforcedbat (1000:1)
      rl_vbatcurr = (rl_vref / rl_C) * rl_iforcedbat;

      // Convert real values to fixed-point
      iforcedbat = $realtobits(rl_iforcedbat);
      vbatcurr = $realtobits(rl_vbatcurr);
    end else begin
      iforcedbat = 0;
      vbatcurr   = 0;
    end
  end

endmodule
