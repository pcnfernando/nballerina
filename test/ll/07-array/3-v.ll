@_bal_stack_guard = external global i8*
@_Bi04root0 = external constant {i32}
declare i8 addrspace(1)* @_bal_panic_construct(i64) cold
declare void @_bal_panic(i8 addrspace(1)*) noreturn cold
declare i8 addrspace(1)* @_bal_tagged_clear_exact_ptr(i8 addrspace(1)*) readnone
declare void @_Bb02ioprintln(i8 addrspace(1)*)
declare {{i32, i8 addrspace(1)*(i8 addrspace(1)*, i64)*, i64(i8 addrspace(1)*, i64, i8 addrspace(1)*)*, i64(i8 addrspace(1)*, i64)*, i64(i8 addrspace(1)*, i64, i64)*, double(i8 addrspace(1)*, i64)*, i64(i8 addrspace(1)*, i64, double)*, i64, {i32}*}*, i64, i64, i8* addrspace(1)*} addrspace(1)* @_bal_list_construct({i32}*, i64)
define void @_B04rootmain() !dbg !5 {
  %v = alloca i8 addrspace(1)*
  %1 = alloca i8 addrspace(1)*
  %2 = alloca i8 addrspace(1)*
  %3 = alloca i8
  %4 = load i8*, i8** @_bal_stack_guard
  %5 = icmp ult i8* %3, %4
  br i1 %5, label %11, label %6
6:
  %7 = call i8 addrspace(1)* @_B_foo(), !dbg !10
  store i8 addrspace(1)* %7, i8 addrspace(1)** %1, !dbg !10
  %8 = load i8 addrspace(1)*, i8 addrspace(1)** %1
  store i8 addrspace(1)* %8, i8 addrspace(1)** %v
  %9 = load i8 addrspace(1)*, i8 addrspace(1)** %v, !dbg !11
  %10 = call i8 addrspace(1)* @_bal_tagged_clear_exact_ptr(i8 addrspace(1)* %9), !dbg !11
  call void @_Bb02ioprintln(i8 addrspace(1)* %10), !dbg !11
  store i8 addrspace(1)* null, i8 addrspace(1)** %2, !dbg !11
  ret void
11:
  %12 = call i8 addrspace(1)* @_bal_panic_construct(i64 1028), !dbg !9
  call void @_bal_panic(i8 addrspace(1)* %12)
  unreachable
}
define internal i8 addrspace(1)* @_B_foo() !dbg !7 {
  %1 = alloca i8 addrspace(1)*
  %2 = alloca i8
  %3 = load i8*, i8** @_bal_stack_guard
  %4 = icmp ult i8* %2, %3
  br i1 %4, label %10, label %5
5:
  %6 = call {{i32, i8 addrspace(1)*(i8 addrspace(1)*, i64)*, i64(i8 addrspace(1)*, i64, i8 addrspace(1)*)*, i64(i8 addrspace(1)*, i64)*, i64(i8 addrspace(1)*, i64, i64)*, double(i8 addrspace(1)*, i64)*, i64(i8 addrspace(1)*, i64, double)*, i64, {i32}*}*, i64, i64, i8* addrspace(1)*} addrspace(1)* @_bal_list_construct({i32}* @_Bi04root0, i64 0)
  %7 = bitcast {{i32, i8 addrspace(1)*(i8 addrspace(1)*, i64)*, i64(i8 addrspace(1)*, i64, i8 addrspace(1)*)*, i64(i8 addrspace(1)*, i64)*, i64(i8 addrspace(1)*, i64, i64)*, double(i8 addrspace(1)*, i64)*, i64(i8 addrspace(1)*, i64, double)*, i64, {i32}*}*, i64, i64, i8* addrspace(1)*} addrspace(1)* %6 to i8 addrspace(1)*
  %8 = getelementptr i8, i8 addrspace(1)* %7, i64 1297036692682702852
  store i8 addrspace(1)* %8, i8 addrspace(1)** %1
  %9 = load i8 addrspace(1)*, i8 addrspace(1)** %1
  ret i8 addrspace(1)* %9
10:
  %11 = call i8 addrspace(1)* @_bal_panic_construct(i64 2564), !dbg !12
  call void @_bal_panic(i8 addrspace(1)* %11)
  unreachable
}
!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!2}
!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !DIFile(filename:"../../../compiler/testSuite/07-array/3-v.bal", directory:"")
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false)
!3 = !DISubroutineType(types: !4)
!4 = !{}
!5 = distinct !DISubprogram(name:"main", linkageName:"_B04rootmain", scope: !1, file: !1, line: 4, type: !3, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !6)
!6 = !{}
!7 = distinct !DISubprogram(name:"foo", linkageName:"_B_foo", scope: !1, file: !1, line: 10, type: !3, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !8)
!8 = !{}
!9 = !DILocation(line: 0, column: 0, scope: !5)
!10 = !DILocation(line: 5, column: 14, scope: !5)
!11 = !DILocation(line: 6, column: 4, scope: !5)
!12 = !DILocation(line: 0, column: 0, scope: !7)
