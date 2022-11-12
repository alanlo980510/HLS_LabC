############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project cordic
set_top cordiccart2pol
add_files cordic/code_src/cordiccart2pol.h
add_files cordic/code_src/cordiccart2pol.cpp
add_files -tb cordic/code_src/cordiccart2pol_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 1000 -name default
set_clock_uncertainty 995.39
source "./cordic/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level port
export_design -format ip_catalog
