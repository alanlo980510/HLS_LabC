// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fast_accel_fast_accel,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.130000,HLS_SYN_LAT=16783,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=7766,HLS_SYN_LUT=1651,HLS_VERSION=2022_1}" *)

module fast_accel (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        img_in_TDATA,
        img_in_TVALID,
        img_in_TREADY,
        threshold,
        img_out_TDATA,
        img_out_TVALID,
        img_out_TREADY,
        rows,
        cols
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] img_in_TDATA;
input   img_in_TVALID;
output   img_in_TREADY;
input  [31:0] threshold;
output  [15:0] img_out_TDATA;
output   img_out_TVALID;
input   img_out_TREADY;
input  [31:0] rows;
input  [31:0] cols;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [31:0] op2_assign_fu_73_p2;
reg   [31:0] op2_assign_reg_100;
wire   [31:0] op2_assign_1_fu_79_p2;
reg   [31:0] op2_assign_1_reg_105;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_start;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_done;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_idle;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_ready;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_out_TREADY;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_in_TREADY;
wire   [15:0] grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_out_TDATA;
wire    grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_out_TVALID;
reg    grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_start_reg;
reg   [3:0] ap_NS_fsm;
wire    ap_NS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    regslice_both_img_out_U_apdone_blk;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    regslice_both_img_in_U_apdone_blk;
wire   [15:0] img_in_TDATA_int_regslice;
wire    img_in_TVALID_int_regslice;
reg    img_in_TREADY_int_regslice;
wire    regslice_both_img_in_U_ack_in;
wire    img_out_TREADY_int_regslice;
wire    regslice_both_img_out_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_start_reg = 1'b0;
end

fast_accel_fast_accel_Pipeline_Compute_Loop grp_fast_accel_Pipeline_Compute_Loop_fu_60(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_start),
    .ap_done(grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_done),
    .ap_idle(grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_idle),
    .ap_ready(grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_ready),
    .img_in_TVALID(img_in_TVALID_int_regslice),
    .img_out_TREADY(grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_out_TREADY),
    .threshold(threshold),
    .cols(cols),
    .op2_assign(op2_assign_reg_100),
    .op2_assign_1(op2_assign_1_reg_105),
    .rows(rows),
    .img_in_TDATA(img_in_TDATA_int_regslice),
    .img_in_TREADY(grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_in_TREADY),
    .img_out_TDATA(grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_out_TDATA),
    .img_out_TVALID(grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_out_TVALID)
);

fast_accel_regslice_both #(
    .DataWidth( 16 ))
regslice_both_img_in_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(img_in_TDATA),
    .vld_in(img_in_TVALID),
    .ack_in(regslice_both_img_in_U_ack_in),
    .data_out(img_in_TDATA_int_regslice),
    .vld_out(img_in_TVALID_int_regslice),
    .ack_out(img_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_img_in_U_apdone_blk)
);

fast_accel_regslice_both #(
    .DataWidth( 16 ))
regslice_both_img_out_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_out_TDATA),
    .vld_in(grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_out_TVALID),
    .ack_in(img_out_TREADY_int_regslice),
    .data_out(img_out_TDATA),
    .vld_out(regslice_both_img_out_U_vld_out),
    .ack_out(img_out_TREADY),
    .apdone_blk(regslice_both_img_out_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_NS_fsm_state2) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_start_reg <= 1'b1;
        end else if ((grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_ready == 1'b1)) begin
            grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        op2_assign_1_reg_105 <= op2_assign_1_fu_79_p2;
        op2_assign_reg_100 <= op2_assign_fu_73_p2;
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
    if ((grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((regslice_both_img_out_U_apdone_blk == 1'b1)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_img_out_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_img_out_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        img_in_TREADY_int_regslice = grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_in_TREADY;
    end else begin
        img_in_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((regslice_both_img_out_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_NS_fsm_state2 = ap_NS_fsm[32'd1];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_start = grp_fast_accel_Pipeline_Compute_Loop_fu_60_ap_start_reg;

assign grp_fast_accel_Pipeline_Compute_Loop_fu_60_img_out_TREADY = (img_out_TREADY_int_regslice & ap_CS_fsm_state3);

assign img_in_TREADY = regslice_both_img_in_U_ack_in;

assign img_out_TVALID = regslice_both_img_out_U_vld_out;

assign op2_assign_1_fu_79_p2 = ($signed(cols) + $signed(32'd4294967293));

assign op2_assign_fu_73_p2 = ($signed(rows) + $signed(32'd4294967293));

endmodule //fast_accel