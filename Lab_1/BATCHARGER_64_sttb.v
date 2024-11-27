`timescale 1 ns / 10 ps


module BATCHARGER_64b_tb;

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



  initial begin
    rl_vin = 4.5;
    rl_pgnd = 0.0;
    sel[3:0] = 4'b1000;  // 450mAh selection     
    en = 1'b1;

    #10000000;
    #10000000 $finish;

  end

wire expected_i_value;
wire expected_v_value;
wire Step_id;
reg [63:0]temp_current;
reg [63:0]temp_voltage;

// task check_state_rl_value_I_V(input real i_value, input real v_value, input [2:0] step_id);

//     begin
//       #1;
//       //Sjekke riktig state, på riktig tidspunkt
//       //Sjekke at real verdiene er riktig
      
//       if (step_id!=001 || step_id!=010 || step_id!=100) begin $display("Error at step %0d: Several state at the same time", step_id, uut.current_state); $finish; end
      
//       //step_id= (CV, CC, TC)

//       if(step_id==001) begin
//         assign expected_i_value = $bitstoreal(uut.itcpar);
//         assign expected_v_value = $bitstoreal(uut.vcutoffpar);

//         if (expected_i_value != i_value || expected_v_value >! v_value ) begin
//           $display("Error at step %0d: Expected i_value = %b, Got i_value = %b", step_id,  i_value);
//           $finish;
//         end
      
//         end

//       if(step_id==010) begin
//         assign expected_i_value = temp_current;
//         assign expected_v_value = temp_voltage;


//         if (expected_i_value != i_value || expected_v_value <! v_value ) begin
//           $display("Error at step %0d: Expected i_value = %b, Got i_value = %b", step_id,  i_value);
//           $finish;
//         end
      
//       end
//       if(step_id==100) begin
//         assign expected_i_value = temp_current;
//         assign expected_v_value = temp_voltage;


//         if (expected_i_value >! i_value || expected_v_value != v_value ) begin
//           $display("Error at step %0d: Expected i_value = %b, Got i_value = %b", step_id,  i_value);
//           $finish;
//         end
      
//       end
//     end


//   endtask
task check_state_rl_value_I_V(input real i_value, input real v_value, input [2:0] step_id);
    begin
        #1;

      // Validate `step_id`
      if (!(step_id == 3'b001 || step_id == 3'b010 || step_id == 3'b100)) begin
          $display("Error at step %0d: Several states active simultaneously", step_id);
          $finish;
      end

        // Handle CV (Constant Voltage) mode
      if (step_id == 3'b001) begin
          expected_i_value = $bitstoreal(uut.itcpar);
          expected_v_value = $bitstoreal(uut.vcutoffpar);

          if (expected_i_value != i_value || expected_v_value > v_value) begin 
            $display("Error at step %0d: Expected i_value = %f, Got i_value = %f", step_id, expected_i_value, i_value);
                $finish;
            end
        end

        // Handle CC (Constant Current) mode
      if (step_id == 3'b010) begin
          expected_i_value = temp_current;
          expected_v_value = temp_voltage;

          if (expected_i_value != i_value || expected_v_value < v_value) begin
            $display("Error at step %0d: Expected i_value = %f, Got i_value = %f", step_id, expected_i_value, i_value);
            $finish;
            end
        end

        // Handle TC (Trickle Charge) mode
      if (step_id == 3'b100) begin
          expected_i_value = temp_current;
          expected_v_value = temp_voltage;

          if (expected_i_value > i_value || expected_v_value != v_value) begin
            $display("Error at step %0d: Expected i_value = %f, Got i_value = %f", step_id, expected_i_value, i_value);
            $finish;
            end
        end
    end
endtask

// Signal conversions




  //-- Signals conversion ---------------------------------------------------
  initial assign rl_vbat = $bitstoreal(vbat);
  initial assign rl_vtbat = $bitstoreal(vtbat);
  initial assign rl_ibat = $bitstoreal(ibat);
  initial assign rl_dvdd = $bitstoreal(dvdd);
  initial assign rl_dgnd = $bitstoreal(dgnd);


  assign vin  = $realtobits(rl_vin);
  assign pgnd = $realtobits(rl_pgnd);

endmodule

// always @posedge clk begin
//   temp_current = uut.rl_iforcedbat;
//   temp_voltage = rl_vbat;

//   step_id = {uut.cv, uut.cc, uut.tc};

//   check_state_rl_value_I_V(r1_ibat, r1_vbat, step_id);

always @(posedge clk) begin
    temp_current = uut.rl_iforcedbat;
    temp_voltage = rl_vbat;

    step_id = {uut.cv, uut.cc, uut.tc};

    check_state_rl_value_I_V(uut.r1_iforcedbat, rl_vbat, step_id);
end


 
