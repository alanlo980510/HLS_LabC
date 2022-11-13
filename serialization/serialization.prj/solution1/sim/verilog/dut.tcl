
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set src_sz__return_group [add_wave_group src_sz__return(axi_slave) -into $cinoutgroup]
add_wave /apatb_dut_top/AESL_inst_dut/interrupt -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_BRESP -into $src_sz__return_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_BREADY -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_BVALID -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_RRESP -into $src_sz__return_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_RDATA -into $src_sz__return_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_RREADY -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_RVALID -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_ARREADY -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_ARVALID -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_ARADDR -into $src_sz__return_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_WSTRB -into $src_sz__return_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_WDATA -into $src_sz__return_group -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_WREADY -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_WVALID -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_AWREADY -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_AWVALID -into $src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/s_axi_control_AWADDR -into $src_sz__return_group -radix hex
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $coutputgroup]
add_wave /apatb_dut_top/AESL_inst_dut/dst_buff_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/dst_buff_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/dst_buff_TDATA -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $cinputgroup]
add_wave /apatb_dut_top/AESL_inst_dut/src_buff_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/src_buff_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/AESL_inst_dut/src_buff_TDATA -into $return_group -radix hex
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_dut_top/AESL_inst_dut/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_dut_top/AESL_inst_dut/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_dut_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_dut_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_dut_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_dut_top/LENGTH_src_buff -into $tb_portdepth_group -radix hex
add_wave /apatb_dut_top/LENGTH_src_sz -into $tb_portdepth_group -radix hex
add_wave /apatb_dut_top/LENGTH_dst_buff -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_src_sz__return_group [add_wave_group src_sz__return(axi_slave) -into $tbcinoutgroup]
add_wave /apatb_dut_top/control_INTERRUPT -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_BRESP -into $tb_src_sz__return_group -radix hex
add_wave /apatb_dut_top/control_BREADY -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_BVALID -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_RRESP -into $tb_src_sz__return_group -radix hex
add_wave /apatb_dut_top/control_RDATA -into $tb_src_sz__return_group -radix hex
add_wave /apatb_dut_top/control_RREADY -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_RVALID -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_ARREADY -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_ARVALID -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_ARADDR -into $tb_src_sz__return_group -radix hex
add_wave /apatb_dut_top/control_WSTRB -into $tb_src_sz__return_group -radix hex
add_wave /apatb_dut_top/control_WDATA -into $tb_src_sz__return_group -radix hex
add_wave /apatb_dut_top/control_WREADY -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_WVALID -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_AWREADY -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_AWVALID -into $tb_src_sz__return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/control_AWADDR -into $tb_src_sz__return_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcoutputgroup]
add_wave /apatb_dut_top/dst_buff_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/dst_buff_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/dst_buff_TDATA -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcinputgroup]
add_wave /apatb_dut_top/src_buff_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/src_buff_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_dut_top/src_buff_TDATA -into $tb_return_group -radix hex
save_wave_config dut.wcfg
run all
quit

