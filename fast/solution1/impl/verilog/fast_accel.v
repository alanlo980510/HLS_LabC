// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fast_accel_fast_accel,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.254000,HLS_SYN_LAT=16400,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=8185,HLS_SYN_LUT=1786,HLS_VERSION=2022_1}" *)

module fast_accel (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        img_in_address0,
        img_in_ce0,
        img_in_q0,
        threshold,
        img_out_address0,
        img_out_ce0,
        img_out_we0,
        img_out_d0,
        rows,
        cols
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [14:0] img_in_address0;
output   img_in_ce0;
input  [8:0] img_in_q0;
input  [31:0] threshold;
output  [14:0] img_out_address0;
output   img_out_ce0;
output   img_out_we0;
output  [8:0] img_out_d0;
input  [31:0] rows;
input  [31:0] cols;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [14:0] trunc_ln126_fu_69_p1;
reg   [14:0] trunc_ln126_reg_95;
wire   [31:0] op2_assign_fu_73_p2;
reg   [31:0] op2_assign_reg_100;
wire   [31:0] op2_assign_1_fu_79_p2;
reg   [31:0] op2_assign_1_reg_105;
wire    ap_CS_fsm_state2;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_start;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_done;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_idle;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_ready;
wire   [14:0] grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_in_address0;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_in_ce0;
wire   [14:0] grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_address0;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_ce0;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_we0;
wire   [8:0] grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_d0;
reg    grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_start_reg;
wire    ap_CS_fsm_state3;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_start_reg = 1'b0;
end

fast_accel_fast_accel_Pipeline_Compute_Loop grp_fast_accel_Pipeline_Compute_Loop_fu_54(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_start),
    .ap_done(grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_done),
    .ap_idle(grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_idle),
    .ap_ready(grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_ready),
    .rows(rows),
    .cols(cols),
    .trunc_ln(trunc_ln126_reg_95),
    .img_in_address0(grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_in_address0),
    .img_in_ce0(grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_in_ce0),
    .img_in_q0(img_in_q0),
    .threshold(threshold),
    .op2_assign(op2_assign_reg_100),
    .op2_assign_1(op2_assign_1_reg_105),
    .img_out_address0(grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_address0),
    .img_out_ce0(grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_ce0),
    .img_out_we0(grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_we0),
    .img_out_d0(grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_d0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_start_reg <= 1'b1;
        end else if ((grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_ready == 1'b1)) begin
            grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        op2_assign_1_reg_105 <= op2_assign_1_fu_79_p2;
        op2_assign_reg_100 <= op2_assign_fu_73_p2;
        trunc_ln126_reg_95 <= trunc_ln126_fu_69_p1;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_start = grp_fast_accel_Pipeline_Compute_Loop_fu_54_ap_start_reg;

assign img_in_address0 = grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_in_address0;

assign img_in_ce0 = grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_in_ce0;

assign img_out_address0 = grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_address0;

assign img_out_ce0 = grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_ce0;

assign img_out_d0 = grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_d0;

assign img_out_we0 = grp_fast_accel_Pipeline_Compute_Loop_fu_54_img_out_we0;

assign op2_assign_1_fu_79_p2 = ($signed(cols) + $signed(32'd4294967293));

assign op2_assign_fu_73_p2 = ($signed(rows) + $signed(32'd4294967293));

assign trunc_ln126_fu_69_p1 = rows[14:0];

endmodule //fast_accel
