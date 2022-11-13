`timescale 1 ns / 1 ps

module AESL_deadlock_kernel_monitor_top ( 
    input wire kernel_monitor_clock,
    input wire kernel_monitor_reset
);
wire [1:0] axis_block_sigs;
wire [2:0] inst_idle_sigs;
wire [0:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~AESL_inst_dut.grp_dut_Pipeline_VITIS_LOOP_37_1_fu_182.src_buff_TDATA_blk_n;
assign axis_block_sigs[1] = ~AESL_inst_dut.grp_dut_Pipeline_VITIS_LOOP_123_3_fu_202.dst_buff_TDATA_blk_n;

assign inst_block_sigs[0] = 1'b0;

assign inst_idle_sigs[0] = 1'b0;
assign inst_idle_sigs[1] = AESL_inst_dut.grp_dut_Pipeline_VITIS_LOOP_37_1_fu_182.ap_idle;
assign inst_idle_sigs[2] = AESL_inst_dut.grp_dut_Pipeline_VITIS_LOOP_123_3_fu_202.ap_idle;

AESL_deadlock_idx0_monitor AESL_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

initial begin
reg block_delay = 0;
    while(1) begin
        @(posedge kernel_monitor_clock);
    if (kernel_block == 1'b1 && block_delay == 1'b0)
    $display("find kernel block.");
    block_delay = kernel_block;
    end
end

endmodule
