set SynModuleInfo {
  {SRCNAME fast_accel_Pipeline_Compute_Loop MODELNAME fast_accel_Pipeline_Compute_Loop RTLNAME fast_accel_fast_accel_Pipeline_Compute_Loop
    SUBMODULES {
      {MODELNAME fast_accel_flow_control_loop_pipe_sequential_init RTLNAME fast_accel_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fast_accel_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fast_accel MODELNAME fast_accel RTLNAME fast_accel IS_TOP 1
    SUBMODULES {
      {MODELNAME fast_accel_regslice_both RTLNAME fast_accel_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME fast_accel_regslice_both_U}
    }
  }
}
