  #-----------------------------------------------------------------------------------------------------
  # configure the design for scan insertion
  # please use write_template -dft to have more information on 
  # the other options and refer to the DFT userguide
  #-----------------------------------------------------------------------------------------------------
  define_dft shift_enable -lec_value 0 -active high -name se se
  
  # define the signals to be tied to a value to setup the design in test mode.
  # this will make check_dft_rules passing with all the registers being scanable.
#  define_dft test_mode -lec_value 0 -active high TE
  
  #gives the signal to connect as the TEST sigal on clock gaters
#  set_db [find_unique_design] .lp_clock_gating_test_signal TE

  #this register from the clock generator will not be scanned
  #set_db inst:module_name/ckGen/ckDiv_reg .dft_dont_scan true
  
  # check the dft rules and verify all the DFF are scanable
  check_dft_rules

  # define the scan chains and create the scanin/scanout ports when necessary
  # one chain used for rising edge DFF, one for falling edge.
  # both rising/falling can share the same the same chain using the following attribute
  #    set_attr dft_mix_clock_edges_in_scan_chains true /designs/$bloc
  # define_dft scan_chain -sdi si -sdo so -shift_enable se -domain clk -edge rise -shared_output
  define_dft scan_chain -sdi si -sdo so -shift_enable se -domain clk -edge rise -non_shared_output
#  define_dft scan_chain -sdi sif -sdo sof -create_ports -shift_enable se -domain clk -edge fall
  #note: this design may not contain falling edge DFF

  # check the dft rules and verify all the DFF are scanable
  check_dft_rules
