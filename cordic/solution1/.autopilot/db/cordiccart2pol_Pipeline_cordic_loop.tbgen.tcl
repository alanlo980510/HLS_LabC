set moduleName cordiccart2pol_Pipeline_cordic_loop
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {cordiccart2pol_Pipeline_cordic_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ select_ln1697 int 15 regular  }
	{ select_ln1697_1 int 15 regular  }
	{ x_cordic_V_5_out int 15 regular {pointer 1}  }
	{ theta_out_V_out int 15 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "select_ln1697", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1697_1", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "x_cordic_V_5_out", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY"} , 
 	{ "Name" : "theta_out_V_out", "interface" : "wire", "bitwidth" : 15, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ select_ln1697 sc_in sc_lv 15 signal 0 } 
	{ select_ln1697_1 sc_in sc_lv 15 signal 1 } 
	{ x_cordic_V_5_out sc_out sc_lv 15 signal 2 } 
	{ x_cordic_V_5_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ theta_out_V_out sc_out sc_lv 15 signal 3 } 
	{ theta_out_V_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "select_ln1697", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "select_ln1697", "role": "default" }} , 
 	{ "name": "select_ln1697_1", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "select_ln1697_1", "role": "default" }} , 
 	{ "name": "x_cordic_V_5_out", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "x_cordic_V_5_out", "role": "default" }} , 
 	{ "name": "x_cordic_V_5_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "x_cordic_V_5_out", "role": "ap_vld" }} , 
 	{ "name": "theta_out_V_out", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "theta_out_V_out", "role": "default" }} , 
 	{ "name": "theta_out_V_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "theta_out_V_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "cordiccart2pol_Pipeline_cordic_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "select_ln1697", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln1697_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_cordic_V_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "theta_out_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "cordic_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_114_15_1_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_114_15_1_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	cordiccart2pol_Pipeline_cordic_loop {
		select_ln1697 {Type I LastRead 0 FirstWrite -1}
		select_ln1697_1 {Type I LastRead 0 FirstWrite -1}
		x_cordic_V_5_out {Type O LastRead -1 FirstWrite 1}
		theta_out_V_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "13", "Max" : "13"}
	, {"Name" : "Interval", "Min" : "13", "Max" : "13"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	select_ln1697 { ap_none {  { select_ln1697 in_data 0 15 } } }
	select_ln1697_1 { ap_none {  { select_ln1697_1 in_data 0 15 } } }
	x_cordic_V_5_out { ap_vld {  { x_cordic_V_5_out out_data 1 15 }  { x_cordic_V_5_out_ap_vld out_vld 1 1 } } }
	theta_out_V_out { ap_vld {  { theta_out_V_out out_data 1 15 }  { theta_out_V_out_ap_vld out_vld 1 1 } } }
}
