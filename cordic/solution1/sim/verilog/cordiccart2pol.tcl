
log_wave [get_objects -filter {type == in_port || type == out_port || type == inout_port || type == port} /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/*]
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(wire) -into $coutputgroup]
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/theta_ap_vld -into $return_group -color #ffff00 -radix hex
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/theta -into $return_group -radix hex
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/r_ap_vld -into $return_group -color #ffff00 -radix hex
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/r -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(wire) -into $cinputgroup]
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/y -into $return_group -radix hex
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/x -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/ap_start -into $blocksiggroup
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/ap_done -into $blocksiggroup
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/ap_idle -into $blocksiggroup
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_cordiccart2pol_top/AESL_inst_cordiccart2pol/ap_clk -into $clockgroup
save_wave_config cordiccart2pol.wcfg
run all
quit

