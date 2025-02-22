; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=aarch64-none-linux-gnu -mattr=+neon | FileCheck %s

define i1 @combine_setcc_eq_vecreduce_or_v8i1(<8 x i8> %a) {
; CHECK-LABEL: combine_setcc_eq_vecreduce_or_v8i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmeq v0.8b, v0.8b, #0
; CHECK-NEXT:    mov w8, #1
; CHECK-NEXT:    umaxv b0, v0.8b
; CHECK-NEXT:    fmov w9, s0
; CHECK-NEXT:    bic w0, w8, w9
; CHECK-NEXT:    ret
  %cmp1 = icmp eq <8 x i8> %a, zeroinitializer
  %cast = bitcast <8 x i1> %cmp1 to i8
  %cmp2 = icmp eq i8 %cast, zeroinitializer
  ret i1 %cmp2
}

define i1 @combine_setcc_eq_vecreduce_or_v16i1(<16 x i8> %a) {
; CHECK-LABEL: combine_setcc_eq_vecreduce_or_v16i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmeq v0.16b, v0.16b, #0
; CHECK-NEXT:    mov w8, #1
; CHECK-NEXT:    umaxv b0, v0.16b
; CHECK-NEXT:    fmov w9, s0
; CHECK-NEXT:    bic w0, w8, w9
; CHECK-NEXT:    ret
  %cmp1 = icmp eq <16 x i8> %a, zeroinitializer
  %cast = bitcast <16 x i1> %cmp1 to i16
  %cmp2 = icmp eq i16 %cast, zeroinitializer
  ret i1 %cmp2
}

define i1 @combine_setcc_eq_vecreduce_or_v32i1(<32 x i8> %a) {
; CHECK-LABEL: combine_setcc_eq_vecreduce_or_v32i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmeq v1.16b, v1.16b, #0
; CHECK-NEXT:    mov w8, #1
; CHECK-NEXT:    cmeq v0.16b, v0.16b, #0
; CHECK-NEXT:    orr v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    umaxv b0, v0.16b
; CHECK-NEXT:    fmov w9, s0
; CHECK-NEXT:    bic w0, w8, w9
; CHECK-NEXT:    ret
  %cmp1 = icmp eq <32 x i8> %a, zeroinitializer
  %cast = bitcast <32 x i1> %cmp1 to i32
  %cmp2 = icmp eq i32 %cast, zeroinitializer
  ret i1 %cmp2
}

define i1 @combine_setcc_eq_vecreduce_or_v64i1(<64 x i8> %a) {
; CHECK-LABEL: combine_setcc_eq_vecreduce_or_v64i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmeq v2.16b, v2.16b, #0
; CHECK-NEXT:    mov w8, #1
; CHECK-NEXT:    cmeq v3.16b, v3.16b, #0
; CHECK-NEXT:    cmeq v1.16b, v1.16b, #0
; CHECK-NEXT:    cmeq v0.16b, v0.16b, #0
; CHECK-NEXT:    orr v1.16b, v1.16b, v3.16b
; CHECK-NEXT:    orr v0.16b, v0.16b, v2.16b
; CHECK-NEXT:    orr v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    umaxv b0, v0.16b
; CHECK-NEXT:    fmov w9, s0
; CHECK-NEXT:    bic w0, w8, w9
; CHECK-NEXT:    ret
  %cmp1 = icmp eq <64 x i8> %a, zeroinitializer
  %cast = bitcast <64 x i1> %cmp1 to i64
  %cmp2 = icmp eq i64 %cast, zeroinitializer
  ret i1 %cmp2
}

define i1 @combine_setcc_ne_vecreduce_or_v8i1(<8 x i8> %a) {
; CHECK-LABEL: combine_setcc_ne_vecreduce_or_v8i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmtst v0.8b, v0.8b, v0.8b
; CHECK-NEXT:    umaxv b0, v0.8b
; CHECK-NEXT:    fmov w8, s0
; CHECK-NEXT:    and w0, w8, #0x1
; CHECK-NEXT:    ret
  %cmp1 = icmp ne <8 x i8> %a, zeroinitializer
  %cast = bitcast <8 x i1> %cmp1 to i8
  %cmp2 = icmp ne i8 %cast, zeroinitializer
  ret i1 %cmp2
}

define i1 @combine_setcc_ne_vecreduce_or_v16i1(<16 x i8> %a) {
; CHECK-LABEL: combine_setcc_ne_vecreduce_or_v16i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmtst v0.16b, v0.16b, v0.16b
; CHECK-NEXT:    umaxv b0, v0.16b
; CHECK-NEXT:    fmov w8, s0
; CHECK-NEXT:    and w0, w8, #0x1
; CHECK-NEXT:    ret
  %cmp1 = icmp ne <16 x i8> %a, zeroinitializer
  %cast = bitcast <16 x i1> %cmp1 to i16
  %cmp2 = icmp ne i16 %cast, zeroinitializer
  ret i1 %cmp2
}

define i1 @combine_setcc_ne_vecreduce_or_v32i1(<32 x i8> %a) {
; CHECK-LABEL: combine_setcc_ne_vecreduce_or_v32i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    cmtst v0.16b, v0.16b, v0.16b
; CHECK-NEXT:    umaxv b0, v0.16b
; CHECK-NEXT:    fmov w8, s0
; CHECK-NEXT:    and w0, w8, #0x1
; CHECK-NEXT:    ret
  %cmp1 = icmp ne <32 x i8> %a, zeroinitializer
  %cast = bitcast <32 x i1> %cmp1 to i32
  %cmp2 = icmp ne i32 %cast, zeroinitializer
  ret i1 %cmp2
}

define i1 @combine_setcc_ne_vecreduce_or_v64i1(<64 x i8> %a) {
; CHECK-LABEL: combine_setcc_ne_vecreduce_or_v64i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr v1.16b, v1.16b, v3.16b
; CHECK-NEXT:    orr v0.16b, v0.16b, v2.16b
; CHECK-NEXT:    orr v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    cmtst v0.16b, v0.16b, v0.16b
; CHECK-NEXT:    umaxv b0, v0.16b
; CHECK-NEXT:    fmov w8, s0
; CHECK-NEXT:    and w0, w8, #0x1
; CHECK-NEXT:    ret
  %cmp1 = icmp ne <64 x i8> %a, zeroinitializer
  %cast = bitcast <64 x i1> %cmp1 to i64
  %cmp2 = icmp ne i64 %cast, zeroinitializer
  ret i1 %cmp2
}

define i1 @combine_setcc_eq0_conjunction_xor_or(ptr %a, ptr %b) {
; CHECK-LABEL: combine_setcc_eq0_conjunction_xor_or:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    cmp x8, x10
; CHECK-NEXT:    ccmp x9, x11, #0, eq
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
  %bcmp = tail call i32 @bcmp(ptr dereferenceable(16) %a, ptr dereferenceable(16) %b, i64 16)
  %cmp = icmp eq i32 %bcmp, 0
  ret i1 %cmp
}

define i1 @combine_setcc_ne0_conjunction_xor_or(ptr %a, ptr %b) {
; CHECK-LABEL: combine_setcc_ne0_conjunction_xor_or:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldp x8, x9, [x0]
; CHECK-NEXT:    ldp x10, x11, [x1]
; CHECK-NEXT:    cmp x8, x10
; CHECK-NEXT:    ccmp x9, x11, #0, eq
; CHECK-NEXT:    cset w0, ne
; CHECK-NEXT:    ret
  %bcmp = tail call i32 @bcmp(ptr dereferenceable(16) %a, ptr dereferenceable(16) %b, i64 16)
  %cmp = icmp ne i32 %bcmp, 0
  ret i1 %cmp
}

; Doesn't increase the number of instructions, where the LHS has multiple uses
define i32 @combine_setcc_multiuse(i32 %0, i32 %1, i32 %2, i32 %3) {
; CHECK-LABEL: combine_setcc_multiuse:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor w8, w1, w0
; CHECK-NEXT:    eor w9, w3, w2
; CHECK-NEXT:    orr w8, w9, w8
; CHECK-NEXT:    cbz w8, .LBB10_2
; CHECK-NEXT:  // %bb.1:
; CHECK-NEXT:    mov w0, w8
; CHECK-NEXT:    b use
; CHECK-NEXT:  .LBB10_2:
; CHECK-NEXT:    ret
  %5 = xor i32 %1, %0
  %6 = xor i32 %3, %2
  %7 = or i32 %6, %5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %11, label %9

9:                                                ; preds = %4
  %10 = tail call i32 @use(i32 %7) #2
  br label %11

11:                                               ; preds = %4, %9
  %12 = phi i32 [ %10, %9 ], [ %0, %4 ]
  ret i32 %12
}

; There may be issues with the CMP/CCMP with the scheduling of instructions
; that ISel will create out of the DAG
define i32 @combine_setcc_glue(i128 noundef %x, i128 noundef %y) {
; CHECK-LABEL: combine_setcc_glue:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    cmp x0, x2
; CHECK-NEXT:    ccmp x1, x3, #0, eq
; CHECK-NEXT:    ccmp x0, x2, #4, ne
; CHECK-NEXT:    cset w0, eq
; CHECK-NEXT:    ret
entry:
  %cmp3 = icmp eq i128 %x, %y
  %conv = trunc i128 %x to i64
  %conv1 = trunc i128 %y to i64
  %cmp = icmp eq i64 %conv, %conv1
  %or7 = or i1 %cmp3, %cmp
  %or = zext i1 %or7 to i32
  ret i32 %or
}

declare i32 @bcmp(ptr nocapture, ptr nocapture, i64)
declare i32 @use(i32 noundef)
