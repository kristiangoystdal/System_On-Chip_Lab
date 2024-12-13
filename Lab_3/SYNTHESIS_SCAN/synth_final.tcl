######################
# Output paths
#
set OUT_DIR "./"
#
######################
# STA Timing analysis and power
#
report_timing > $OUT_DIR/timing_report
report_power > $OUT_DIR/power_report
report_area > $OUT_DIR/area_report
#
#############
# Outputs
#
write_hdl -language v2001 > $OUT_DIR/BATCHARGER_controller_synth.v
write_sdc -strict > $OUT_DIR/BATCHARGER_controller_synth.sdc
write_db $OUT_DIR/BATCHARGER_controller_synth.db
#
#############
