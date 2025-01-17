; Test -sanitizer-coverage-inline-bool-flag=1
; RUN: opt -opaque-pointers < %s -passes='module(sancov-module)' -sanitizer-coverage-level=1 -sanitizer-coverage-inline-bool-flag=1  -S | FileCheck %s

; CHECK:      $foo = comdat nodeduplicate
; CHECK:      @__sancov_gen_ = private global [1 x i1] zeroinitializer, section "__sancov_bools", comdat($foo), align 1{{$}}
; CHECK:      @__start___sancov_bools = extern_weak hidden global i1
; CHECK-NEXT: @__stop___sancov_bools = extern_weak hidden global i1
; CHECK:      @llvm.used = appending global [1 x ptr] [ptr @sancov.module_ctor_bool_flag], section "llvm.metadata"
; CHECK:      @llvm.compiler.used = appending global [1 x ptr] [ptr @__sancov_gen_], section "llvm.metadata"

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"
define void @foo() {
; CHECK-LABEL: @foo(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = load i1, ptr @__sancov_gen_, align 1, !nosanitize ![[#EMPTY:]]
; CHECK-NEXT:    [[TMP1:%.*]] = icmp eq i1 [[TMP0]], false
; CHECK-NEXT:    br i1 [[TMP1]], label [[TMP2:%.*]], label [[TMP3:%.*]]
; CHECK:       2:
; CHECK-NEXT:    store i1 true, ptr @__sancov_gen_, align 1, !nosanitize ![[#EMPTY:]]
; CHECK-NEXT:    br label [[TMP3]]
; CHECK:       3:
; CHECK-NEXT:    ret void
;
entry:
  ret void
}
; CHECK: call void @__sanitizer_cov_bool_flag_init(ptr @__start___sancov_bools, ptr @__stop___sancov_bools)

; CHECK: ![[#EMPTY]] = !{}
