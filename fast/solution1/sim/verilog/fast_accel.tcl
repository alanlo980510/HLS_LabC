
log_wave [get_objects -filter {type == in_port || type == out_port || type == inout_port || type == port} /apatb_fast_accel_top/AESL_inst_fast_accel/*]
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $coutputgroup]
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/img_out_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/img_out_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/img_out_TDATA -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $cinputgroup]
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/cols -into $return_group -radix hex
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/rows -into $return_group -radix hex
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/threshold -into $return_group -radix hex
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/img_in_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/img_in_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/img_in_TDATA -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/ap_start -into $blocksiggroup
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/ap_done -into $blocksiggroup
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/ap_idle -into $blocksiggroup
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_fast_accel_top/AESL_inst_fast_accel/ap_clk -into $clockgroup
save_wave_config fast_accel.wcfg
run all
quit

