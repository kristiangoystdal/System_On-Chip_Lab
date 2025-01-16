#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Thu Jan 16 19:26:12 2025                
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
set init_top_cell BATCHARGERcore
set init_verilog BATCHARGERcore.v
set init_lef_file {../lef_libs/header8m2t_V55.lef BATCHARGERbg.lef BATCHARGERctr.lef BATCHARGERpower.lef BATCHARGERsaradc.lef}
set init_oa_search_lib {}
set init_pwr_net dvdd
set init_gnd_net dgnd
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core_2800 -s 852.8 352.0 5.6 5.6 5.6 5.6
uiSetTool select
getIoFlowFlag
setDrawView fplan
placeInstance BATCHctr 20.6 30.6 R270
placeInstance BATCHpower 86.4 30.6
placeInstance BATCHbg 712.2 30.6
placeInstance BATCHsaradc 712.2 130.6 R270
setDrawView place
setDrawView fplan
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.2 -pinDepth 0.52 -fixOverlap 1 -spreadDirection clockwise -side Bottom -layer 2 -spreadType range -start 700.0 0.0 -end 200.0 0.0 -pin {vin {sel[3]} {sel[2]} {sel[1]} {sel[0]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -USE POWER -pinWidth 2.0 -pinDepth 0.52 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType start -spacing 0.4 -start 400.0 363.2 -pin dvdd
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -use GROUND -pinWidth 2.0 -pinDepth 0.52 -fixOverlap 1 -spreadDirection clockwise -side Top -layer 3 -spreadType range -start 600.0 360.0 -end 500.0 360.0 -pin {pgnd dgnd}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.2 -pinDepth 0.52 -fixOverlap 1 -spreadDirection clockwise -side Right -layer 3 -spreadType range -start 864.0 363.2 -end 864.0 50.2 -pin {vsensbat iforcedbat vbattemp en}
setPinAssignMode -pinEditInBatch false
clearGlobalNets
globalNetConnect dgnd -type pgpin -pin dgnd -instanceBasename *
add_ndr -width {metal1 2.0 metal2 2.0 metal3 2.0 metal4 2.0 metal5 2.0 metal6 2.0 metal7 2.0 metal8 2.0 } -spacing {metal1 0.4 metal2 0.4 metal3 0.4 metal4 0.4 metal5 0.4 metal6 0.4 metal7 0.4 metal8 0.4 } -min_cut {via2 1 via3 1 via4 1 via5 1 via6 1 via7 1 } -add_via {VIAM1M2A VIAM2M3 VIAM3M4 VIAM4M5 VIAM5M6 VIAM6M7 VIAM7M8 genm1m2_w genm1m2a genm1m2b genm2m3_w genm2m3a genm2m3b genm3m4_w genm3m4a genm3m4b genm4m5_w genm4m5a genm4m5b genm5m6_w genm5m6a genm5m6b genm6m7_w genm6m7a genm6m7b genm7m8_w genm7m8a genm7m8b} -name pwr
setAttribute -net dgnd -non_default_rule pwr
selectNet dgnd
routeDesign -selected
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal8(8) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal8(8) } -nets dgnd -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal8(8) }
placeAIO
routeDesign -globalDetail
setDrawView place
deselectAll
write_lef_abstract -cutObsMinSpacing FULLCHIPcore.lef
fit
