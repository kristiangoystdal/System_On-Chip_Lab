set init_top_cell BATCHARGERcore
set init_verilog BATCHARGERcore.v
set init_lef_file {../lef_libs/header8m2t_V55.lef BATCHARGERbg.lef BATCHARGERctr.lef BATCHARGERpower.lef BATCHARGERsaradc.lef}
set init_oa_search_lib {}
set init_pwr_net dvdd
set init_gnd_net dgnd

init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core_2800 -s 802.4 320.8 5.6 5.6 5.6 5.6
uiSetTool select
getIoFlowFlag

setDrawView fplan
placeInstance BATCHctr 15.6 15.6 R270
placeInstance BATCHpower 66.3 15.6
placeInstance BATCHbg 677.1 15.6 
placeInstance BATCHsaradc 677.1 115.6 R270
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
editPin -pinWidth 0.2 -pinDepth 0.52 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType center -spacing 0.4 -pin {en dvdd dgnd vbattemp}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.2 -pinDepth 0.52 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 2 -spreadType center -spacing 0.4 -pin {vin pgnd sel}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.2 -pinDepth 0.52 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 2 -spreadType center -spacing 0.4 -pin {iforcedbat vsensbat}
setPinAssignMode -pinEditInBatch false

clearGlobalNets
globalNetConnect agnd -type pgpin -pin agnd -instanceBasename *
add_ndr -width {metal1 2.0 metal2 2.0 metal3 2.0 metal4 2.0 metal5 2.0 metal6 2.0 metal7 2.0 metal8 2.0 } -spacing {metal1 0.4 metal2 0.4 metal3 0.4 metal4 0.4 metal5 0.4 metal6 0.4 metal7 0.4 metal8 0.4 } -min_cut {via2 1 via3 1 via4 1 via5 1 via6 1 via7 1 } -add_via {VIAM1M2A VIAM2M3 VIAM3M4 VIAM4M5 VIAM5M6 VIAM6M7 VIAM7M8 genm1m2_w genm1m2a genm1m2b genm2m3_w genm2m3a genm2m3b genm3m4_w genm3m4a genm3m4b genm4m5_w genm4m5a genm4m5b genm5m6_w genm5m6a genm5m6b genm6m7_w genm6m7a genm6m7b genm7m8_w genm7m8a genm7m8b} -name pwr
setAttribute -net avdd -non_default_rule pwr
setAttribute -net agnd -non_default_rule pwr
setAttribute -net dgnd -non_default_rule pwr
setAttribute -net dvdd -non_default_rule pwr
setAttribute -net pgnd -non_default_rule pwr
setAttribute -net vin -non_default_rule pwr
selectNet agnd
routeDesign -selected

setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal8(8) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal8(8) } -nets { agnd } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal8(8) }
placeAIO
setAttribute -net dgnd -shield_net agnd
selectNet -shield
routeDesign -selected
routeDesign -globalDetail
setDrawView place
deselectAll
write_lef_abstract -cutObsMinSpacing BATCHARGERcore.lef
