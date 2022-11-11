############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_top -name cordiccart2pol "cordiccart2pol"
set_directive_pipeline "cordiccart2pol/cordic_loop"
set_directive_array_partition -type complete -dim 1 "cordiccart2pol" angles
