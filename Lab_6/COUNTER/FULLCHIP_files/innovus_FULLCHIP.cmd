

set init_gnd_net dgnd
set init_io_file FULLCHIP.save.io
set init_lef_file {../lef_libs/header8m2t_V55.lef FULLCHIPcore.lef foc0h_a33_t33_generic_io.8m2t.lef  }
set init_oa_search_lib {}
set init_original_verilog_files FULLCHIP.v
set init_pwr_net dvdd
set init_top_cell FULLCHIP
set init_verilog FULLCHIP.v
set init_gnd_net agnd
set init_lef_file {../lef_libs/header8m2t_V55.lef FULLCHIPcore.lef foc0h_a33_t33_generic_io.8m2t.lef  foc0h_a33_t12_analogesd_io.8m2t.lef}
init_design
floorPlan -site core_2800 -d 572.4 544.0 6.0 6.0 6.0 6.0
placeInstance counter12 220.0 210.0
add_ndr -width {metal1 2.0 metal2 2.0 metal3 2.0 metal4 2.0 metal5 2.0 metal6 2.0 metal7 2.0 metal8 2.0 } -spacing {metal1 0.4 metal2 0.4 metal3 0.4 metal4 0.4 metal5 0.4 metal6 0.4 metal7 0.4 metal8 0.4 } -min_cut {via2 1 via3 1 via4 1 via5 1 via6 1 via7 1 } -add_via {VIAM1M2A VIAM2M3 VIAM3M4 VIAM4M5 VIAM5M6 VIAM6M7 VIAM7M8 genm1m2_w genm1m2a genm1m2b genm2m3_w genm2m3a genm2m3b genm3m4_w genm3m4a genm3m4b genm4m5_w genm4m5a genm4m5b genm5m6_w genm5m6a genm5m6b genm6m7_w genm6m7a genm6m7b genm7m8_w genm7m8a genm7m8b} -name pwr
setAttribute -net avdd -non_default_rule pwr
setAttribute -net agnd -non_default_rule pwr
setAttribute -net dvdd -non_default_rule pwr
clearGlobalNets
globalNetConnect dvdd -type tiehi -instanceBasename *
globalNetConnect agnd -type tielo -instanceBasename *
addIoFiller -cell EMPTY8HB
addIoFiller -cell EMPTY4HB
addIoFiller -cell EMPTY2HB
addIoFiller -cell EMPTY1HB

globalNetConnect agnd -type pgpin -pin GND -instanceBasename * -hierarchicalInstance {}
globalNetConnect dvdd -type pgpin -pin VCC -instanceBasename * -hierarchicalInstance {}

setSrouteMode -viaConnectToShape { noshape }

sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal8(8) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal8(8) } -nets { dvdd } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal8(8) }

setSrouteMode -viaConnectToShape { noshape }

sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal8(8) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal8(8) } -nets { agnd } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal8(8) }


setAttribute -net vctrl -shield_net agnd
selectNet -shield
routeDesign -selected
routeDesign -globalDetail
