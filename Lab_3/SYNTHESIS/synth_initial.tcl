######################
# Paths
#
set DIG_DIR "~/DIGITAL"
set RTL_DIR "$DIG_DIR/SIMULATION/CHARGER/src"
set LIB_DIR "/opt/ic_tools/pdk/faraday/umc130/HS/fsc0h_d/2009Q1v3.0/GENERIC_CORE/FrontEnd/synopsys"
set script_dir "$DIG_DIR/SYNTHESIS/CHARGER"
#
set_db init_lib_search_path $LIB_DIR
set_db init_hdl_search_path $RTL_DIR 
#
######################
# Reads
#
read_libs fsc0h_d_generic_core_ss1p08v125c.lib 
#
read_hdl -v2001 BATCHARGER_controller.v
#
######################
# Elaboration
#
elaborate
#
######################
# Constrains
#
# --- clock and delays
#
create_clock -name clk -period 10 [get_ports clk]
#
######################
# --- wire cap
#
# Output bus external load 500fF
#
set_db [get_db ports count[*]] .external_wire_cap 500 
#
#
######################
# Synthesis
#
set_db use_scan_seqs_for_non_dft false

syn_generic
syn_map
#
#
######################
# Aditional
#
insert_tiehilo_cells -verbose
delete_unloaded_undriven -all *
#
######################

