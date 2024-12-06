# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.14-s108_1 on Fri Dec 06 10:25:14 WET 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_load -wire_load -max 0.5 [get_ports {count[3]}]
set_load -wire_load -max 0.5 [get_ports {count[2]}]
set_load -wire_load -max 0.5 [get_ports {count[1]}]
set_load -wire_load -max 0.5 [get_ports {count[0]}]
set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
