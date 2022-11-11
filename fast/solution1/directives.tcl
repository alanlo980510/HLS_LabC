############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_pipeline "fast_accel/Compute_Loop"
set_directive_array_partition -type complete -dim 1 "fast_accel" buffer
set_directive_interface -mode axis -register -register_mode both -depth 17000 "fast_accel" img_in
set_directive_interface -mode axis -register -register_mode both -depth 17000 "fast_accel" img_out
