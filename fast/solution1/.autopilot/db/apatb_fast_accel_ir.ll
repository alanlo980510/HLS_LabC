; ModuleID = 'C:/Users/Alan/Desktop/upload/fast/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_int<9>" = type { %"struct.ap_int_base<9, true>" }
%"struct.ap_int_base<9, true>" = type { %"struct.ssdm_int<9, true>" }
%"struct.ssdm_int<9, true>" = type { i9 }

; Function Attrs: noinline
define void @apatb_fast_accel_ir(%"struct.ap_int<9>"* noalias nocapture nonnull readonly %img_in, i32 %threshold, %"struct.ap_int<9>"* noalias nocapture nonnull %img_out, i32 %rows, i32 %cols) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 34000)
  %img_in_copy = bitcast i8* %malloccall to [17000 x %"struct.ap_int<9>"]*
  %malloccall1 = tail call i8* @malloc(i64 34000)
  %img_out_copy = bitcast i8* %malloccall1 to [17000 x %"struct.ap_int<9>"]*
  %0 = bitcast %"struct.ap_int<9>"* %img_in to [17000 x %"struct.ap_int<9>"]*
  %1 = bitcast %"struct.ap_int<9>"* %img_out to [17000 x %"struct.ap_int<9>"]*
  call fastcc void @copy_in([17000 x %"struct.ap_int<9>"]* nonnull %0, [17000 x %"struct.ap_int<9>"]* %img_in_copy, [17000 x %"struct.ap_int<9>"]* nonnull %1, [17000 x %"struct.ap_int<9>"]* %img_out_copy)
  %2 = getelementptr inbounds [17000 x %"struct.ap_int<9>"], [17000 x %"struct.ap_int<9>"]* %img_in_copy, i32 0, i32 0
  %3 = getelementptr inbounds [17000 x %"struct.ap_int<9>"], [17000 x %"struct.ap_int<9>"]* %img_out_copy, i32 0, i32 0
  call void @apatb_fast_accel_hw(%"struct.ap_int<9>"* %2, i32 %threshold, %"struct.ap_int<9>"* %3, i32 %rows, i32 %cols)
  call void @copy_back([17000 x %"struct.ap_int<9>"]* %0, [17000 x %"struct.ap_int<9>"]* %img_in_copy, [17000 x %"struct.ap_int<9>"]* %1, [17000 x %"struct.ap_int<9>"]* %img_out_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([17000 x %"struct.ap_int<9>"]* noalias readonly, [17000 x %"struct.ap_int<9>"]* noalias, [17000 x %"struct.ap_int<9>"]* noalias readonly, [17000 x %"struct.ap_int<9>"]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a17000struct.ap_int<9>"([17000 x %"struct.ap_int<9>"]* %1, [17000 x %"struct.ap_int<9>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a17000struct.ap_int<9>"([17000 x %"struct.ap_int<9>"]* %3, [17000 x %"struct.ap_int<9>"]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a17000struct.ap_int<9>"([17000 x %"struct.ap_int<9>"]* noalias, [17000 x %"struct.ap_int<9>"]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [17000 x %"struct.ap_int<9>"]* %0, null
  %3 = icmp eq [17000 x %"struct.ap_int<9>"]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx7 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [17000 x %"struct.ap_int<9>"], [17000 x %"struct.ap_int<9>"]* %1, i64 0, i64 %for.loop.idx7, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [17000 x %"struct.ap_int<9>"], [17000 x %"struct.ap_int<9>"]* %0, i64 0, i64 %for.loop.idx7, i32 0, i32 0, i32 0
  %5 = bitcast i9* %src.addr.0.0.05 to i16*
  %6 = load i16, i16* %5
  %7 = trunc i16 %6 to i9
  store i9 %7, i9* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx7, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 17000
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([17000 x %"struct.ap_int<9>"]* noalias, [17000 x %"struct.ap_int<9>"]* noalias readonly, [17000 x %"struct.ap_int<9>"]* noalias, [17000 x %"struct.ap_int<9>"]* noalias readonly) unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a17000struct.ap_int<9>"([17000 x %"struct.ap_int<9>"]* %0, [17000 x %"struct.ap_int<9>"]* %1)
  call fastcc void @"onebyonecpy_hls.p0a17000struct.ap_int<9>"([17000 x %"struct.ap_int<9>"]* %2, [17000 x %"struct.ap_int<9>"]* %3)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_fast_accel_hw(%"struct.ap_int<9>"*, i32, %"struct.ap_int<9>"*, i32, i32)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([17000 x %"struct.ap_int<9>"]* noalias, [17000 x %"struct.ap_int<9>"]* noalias readonly, [17000 x %"struct.ap_int<9>"]* noalias, [17000 x %"struct.ap_int<9>"]* noalias readonly) unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a17000struct.ap_int<9>"([17000 x %"struct.ap_int<9>"]* %2, [17000 x %"struct.ap_int<9>"]* %3)
  ret void
}

define void @fast_accel_hw_stub_wrapper(%"struct.ap_int<9>"*, i32, %"struct.ap_int<9>"*, i32, i32) #4 {
entry:
  %5 = bitcast %"struct.ap_int<9>"* %0 to [17000 x %"struct.ap_int<9>"]*
  %6 = bitcast %"struct.ap_int<9>"* %2 to [17000 x %"struct.ap_int<9>"]*
  call void @copy_out([17000 x %"struct.ap_int<9>"]* null, [17000 x %"struct.ap_int<9>"]* %5, [17000 x %"struct.ap_int<9>"]* null, [17000 x %"struct.ap_int<9>"]* %6)
  %7 = bitcast [17000 x %"struct.ap_int<9>"]* %5 to %"struct.ap_int<9>"*
  %8 = bitcast [17000 x %"struct.ap_int<9>"]* %6 to %"struct.ap_int<9>"*
  call void @fast_accel_hw_stub(%"struct.ap_int<9>"* %7, i32 %1, %"struct.ap_int<9>"* %8, i32 %3, i32 %4)
  call void @copy_in([17000 x %"struct.ap_int<9>"]* null, [17000 x %"struct.ap_int<9>"]* %5, [17000 x %"struct.ap_int<9>"]* null, [17000 x %"struct.ap_int<9>"]* %6)
  ret void
}

declare void @fast_accel_hw_stub(%"struct.ap_int<9>"*, i32, %"struct.ap_int<9>"*, i32, i32)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
