#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Jan 10 10:29:58 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v20.11-s130_1 (64bit) 08/05/2020 15:53 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.11-s130_1 NR200802-2257/20_11-UB (database version 18.20.512) {superthreading v2.9}
#@(#)CDS: AAE 20.11-s008 (64bit) 08/05/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.11-s059_1 () Aug  2 2020 05:46:30 ( )
#@(#)CDS: SYNTECH 20.11-s028_1 () Aug  1 2020 06:14:27 ( )
#@(#)CDS: CPE v20.11-s013
#@(#)CDS: IQuantus/TQuantus 19.1.3-s260 (64bit) Thu May 28 10:57:28 PDT 2020 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_gnd_net dgnd
set init_lef_file {../lef_libs/header8m2t_V55.lef cnt.lef vco.lef }
set init_oa_search_lib {}
set init_pwr_net dvdd
set init_top_cell FULLCHIPcore
set init_verilog FULLCHIPcore.v
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core_2800 -d 50 76.8 5.6 5.6 5.6 5.6
uiSetTool select
getIoFlowFlag
setDrawView fplan
placeInstance counterinst 8.0 6.0
placeInstance vcoinst 8.0 38.0
setDrawView place
setDrawView fplan
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -use GROUND -pinWidth 2.0 -pinDepth 0.4 -fixOverlap 1 -side Right -layer 3 -assign 49.606 4.343 -pin agnd
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -use POWER -pinWidth 2.0 -pinDepth 0.4 -fixOverlap 1 -side Right -layer 3 -assign 49.606 22.0 -pin dvdd
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -use POWER -pinWidth 2.0 -pinDepth 0.4 -fixOverlap 1 -side Right -layer 3 -assign 49.721 54.708 -pin avdd
setPinAssignMode -pinEditInBatch false
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.4 -pinDepth 0.4 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 4.0 -pin {{count[0]} {count[1]} {count[2]} {count[3]} count_dir enable reset}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -use ANALOG -pinWidth 0.4 -pinDepth 0.4 -fixOverlap 1 -side Right -layer 1 -assign 49.843 30.22 -pin vctrl
setPinAssignMode -pinEditInBatch false
clearGlobalNets
globalNetConnect agnd -type pgpin -pin agnd -instanceBasename *
add_ndr -width {metal1 2.0 metal2 2.0 metal3 2.0 metal4 2.0 metal5 2.0 metal6 2.0 metal7 2.0 metal8 2.0 } -spacing {metal1 0.4 metal2 0.4 metal3 0.4 metal4 0.4 metal5 0.4 metal6 0.4 metal7 0.4 metal8 0.4 } -min_cut {via2 1 via3 1 via4 1 via5 1 via6 1 via7 1 } -add_via {VIAM1M2A VIAM2M3 VIAM3M4 VIAM4M5 VIAM5M6 VIAM6M7 VIAM7M8 genm1m2_w genm1m2a genm1m2b genm2m3_w genm2m3a genm2m3b genm3m4_w genm3m4a genm3m4b genm4m5_w genm4m5a genm4m5b genm5m6_w genm5m6a genm5m6b genm6m7_w genm6m7a genm6m7b genm7m8_w genm7m8a genm7m8b} -name pwr
setAttribute -net avdd -non_default_rule pwr
setAttribute -net agnd -non_default_rule pwr
setAttribute -net dgnd -non_default_rule pwr
setAttribute -net dvdd -non_default_rule pwr
selectNet agnd
routeDesign -selected
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal8(8) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal8(8) } -nets { agnd } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal8(8) }
placeAIO
setAttribute -net vctrl -shield_net agnd
selectNet -shield
routeDesign -selected
routeDesign -globalDetail
setDrawView place
deselectAll
write_lef_abstract -cutObsMinSpacing FULLCHIPcore.lef
fit
zoomBox -55.30000 2.49600 96.47600 74.30400
zoomBox -47.66700 7.88100 81.34300 68.91800
zoomBox -41.17900 12.45800 68.48000 64.34000
zoomBox -18.12400 29.51900 39.12200 56.60300
zoomBox -11.13800 34.69000 30.22400 54.25900
zoomBox -1.01900 42.17900 17.33600 50.86300
zoomBox 2.83900 45.03400 12.42200 49.56800
zoomBox -8.42100 36.70400 26.75600 53.34700
zoomBox -33.97700 17.79100 59.29700 61.92100
zoomBox -3.60000 46.91100 21.81900 58.93700
zoomBox 3.48600 53.70400 13.07600 58.24100
zoomBox -10.76200 40.04700 30.65100 59.64000
zoomBox -34.00900 17.76400 59.32900 61.92400
zoomBox -103.02400 -48.38600 144.46400 68.70500
fit
zoomBox -32.31200 5.31400 96.69800 66.35100
zoomBox -9.21600 11.92800 83.99500 56.02800
zoomBox 23.98200 21.91200 65.34400 41.48100
zoomBox 43.24700 27.70500 54.51900 33.03800
zoomBox 23.97400 21.90800 65.34700 41.48200
zoomBox -0.28400 14.61100 78.97500 52.11000
zoomBox -32.17200 5.02000 96.88900 66.08100
zoomBox -106.33900 -9.30500 140.90200 107.66900
zoomBox -7.44000 -1.93100 85.80900 42.18700
zoomBox 21.18500 0.20300 69.86200 23.23300
zoomBox -82.53500 -7.53300 127.64100 91.90500
zoomBox -167.34900 -13.86000 174.88900 148.05900
fit
saveDesign FULLCHIPcore
