@_bal_stack_guard = external global i8*
declare i8 addrspace(1)* @_bal_panic_construct(i64) cold
declare void @_bal_panic(i8 addrspace(1)*) noreturn cold
declare i8 addrspace(1)* @_bal_int_to_tagged(i64)
declare i64 @_bal_tagged_to_int(i8 addrspace(1)*) readonly
define void @_B04rootmain() !dbg !5 {
  %b = alloca i1
  %x = alloca i8 addrspace(1)*
  %1 = alloca i1
  %2 = alloca i1
  %3 = alloca i1
  %x.1 = alloca i8 addrspace(1)*
  %_ = alloca i8 addrspace(1)*
  %4 = alloca i1
  %5 = alloca i1
  %6 = alloca i1
  %_.1 = alloca i8 addrspace(1)*
  %x.2 = alloca i64
  %_.2 = alloca i64
  %7 = alloca i8
  %8 = load i8*, i8** @_bal_stack_guard
  %9 = icmp ult i8* %7, %8
  br i1 %9, label %51, label %10
10:
  store i1 1, i1* %b
  %11 = call i8 addrspace(1)* @_bal_int_to_tagged(i64 1)
  store i8 addrspace(1)* %11, i8 addrspace(1)** %x
  %12 = load i1, i1* %b
  br i1 %12, label %13, label %22
13:
  %14 = load i8 addrspace(1)*, i8 addrspace(1)** %x
  %15 = addrspacecast i8 addrspace(1)* %14 to i8*
  %16 = ptrtoint i8* %15 to i64
  %17 = and i64 %16, 2233785415175766016
  %18 = icmp eq i64 %17, 504403158265495552
  store i1 %18, i1* %1
  %19 = load i1, i1* %1
  %20 = xor i1 1, %19
  store i1 %20, i1* %2
  %21 = load i1, i1* %2
  store i1 %21, i1* %3
  br label %24
22:
  %23 = load i1, i1* %b
  store i1 %23, i1* %3
  br label %24
24:
  %25 = load i1, i1* %3
  br i1 %25, label %26, label %29
26:
  %27 = load i8 addrspace(1)*, i8 addrspace(1)** %x
  store i8 addrspace(1)* %27, i8 addrspace(1)** %x.1
  %28 = load i8 addrspace(1)*, i8 addrspace(1)** %x.1
  store i8 addrspace(1)* %28, i8 addrspace(1)** %_
  br label %29
29:
  %30 = load i1, i1* %b
  br i1 %30, label %40, label %31
31:
  %32 = load i8 addrspace(1)*, i8 addrspace(1)** %x
  %33 = addrspacecast i8 addrspace(1)* %32 to i8*
  %34 = ptrtoint i8* %33 to i64
  %35 = and i64 %34, 2233785415175766016
  %36 = icmp eq i64 %35, 504403158265495552
  store i1 %36, i1* %4
  %37 = load i1, i1* %4
  %38 = xor i1 1, %37
  store i1 %38, i1* %5
  %39 = load i1, i1* %5
  store i1 %39, i1* %6
  br label %42
40:
  %41 = load i1, i1* %b
  store i1 %41, i1* %6
  br label %42
42:
  %43 = load i1, i1* %6
  br i1 %43, label %44, label %46
44:
  %45 = load i8 addrspace(1)*, i8 addrspace(1)** %x
  store i8 addrspace(1)* %45, i8 addrspace(1)** %_.1
  br label %50
46:
  %47 = load i8 addrspace(1)*, i8 addrspace(1)** %x
  %48 = call i64 @_bal_tagged_to_int(i8 addrspace(1)* %47)
  store i64 %48, i64* %x.2
  %49 = load i64, i64* %x.2
  store i64 %49, i64* %_.2
  br label %50
50:
  ret void
51:
  %52 = call i8 addrspace(1)* @_bal_panic_construct(i64 260), !dbg !7
  call void @_bal_panic(i8 addrspace(1)* %52)
  unreachable
}
!llvm.module.flags = !{!0}
!llvm.dbg.cu = !{!2}
!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !DIFile(filename:"../../../compiler/testSuite/13-logical/16-v.bal", directory:"")
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false)
!3 = !DISubroutineType(types: !4)
!4 = !{}
!5 = distinct !DISubprogram(name:"main", linkageName:"_B04rootmain", scope: !1, file: !1, line: 1, type: !3, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !6)
!6 = !{}
!7 = !DILocation(line: 0, column: 0, scope: !5)
