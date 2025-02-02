if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name SS_LIB\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fsc0h_d_generic_core_ss1p08v125c.lib]
create_library_set -name FF_LIB\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fsc0h_d_generic_core_ff1p32vm40c.lib]
create_rc_corner -name SS_RC\
   -cap_table ${::IMEX::libVar}/mmmc/captable.cap\
   -preRoute_res 1.1\
   -postRoute_res 1.1\
   -preRoute_cap 1.1\
   -postRoute_cap 1.1\
   -postRoute_xcap 1.1\
   -preRoute_clkres 1.1\
   -preRoute_clkcap 1.1\
   -postRoute_clkcap 1.1\
   -postRoute_clkres 1.1\
   -T 125
create_rc_corner -name FF_RC\
   -cap_table ${::IMEX::libVar}/mmmc/captable.cap\
   -preRoute_res 0.9\
   -postRoute_res 0.9\
   -preRoute_cap 0.9\
   -postRoute_cap 0.9\
   -postRoute_xcap 0.9\
   -preRoute_clkres 0.9\
   -preRoute_clkcap 0.9\
   -postRoute_clkcap 0.9\
   -postRoute_clkres 0.9\
   -T -40
create_delay_corner -name FF_DELAY\
   -library_set FF_LIB\
   -rc_corner FF_RC
create_delay_corner -name SS_DELAY\
   -library_set SS_LIB\
   -rc_corner SS_RC
create_constraint_mode -name FF_SDC\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/BATCHARGER_controller_synth.sdc]
create_constraint_mode -name SS_SDC\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/BATCHARGER_controller_synth.sdc]
create_analysis_view -name WC_AN -constraint_mode SS_SDC -delay_corner SS_DELAY
create_analysis_view -name BC_AN -constraint_mode FF_SDC -delay_corner FF_DELAY
set_analysis_view -setup [list WC_AN] -hold [list BC_AN]
