#
# Copyright 2019-2020 Xilinx, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set XPART xc7z020clg400-1
set CSIM 1
set CSYNTH 1
set COSIM 1
set Flow        "vitis"

set PROJ "serialization.prj"
set SOLN "solution1"

if {![info exists CLKP]} {
  set CLKP 3.33
}

open_project -reset $PROJ

add_files "top.cpp" -cflags "-I./"
add_files -tb "test.cpp" -cflags "-I./"
add_files -tb "data/fix_data.arrow" -cflags "-I./"
add_files -tb "data/fix.obj" -cflags "-I./"
add_files -tb "data/var_data.arrow" -cflags "-I./"
add_files -tb "data/var.obj" -cflags "-I./"
add_files -tb "data/mix_data.arrow" -cflags "-I./"
add_files -tb "data/mix.obj" -cflags "-I./"

set_top dut

open_solution -flow_target $Flow -reset $SOLN
 

set_part $XPART
create_clock -period $CLKP

exit

if {$CSIM == 1} {
  csim_design
}

if {$CSYNTH == 1} {
  csynth_design
}

if {$COSIM == 1} {
  cosim_design
} 
