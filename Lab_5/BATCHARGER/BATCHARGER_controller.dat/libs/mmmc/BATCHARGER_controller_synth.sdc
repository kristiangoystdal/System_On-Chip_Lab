# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.14-s108_1 on Tue Jan 07 14:08:40 WET 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
