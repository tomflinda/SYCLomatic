// UNSUPPORTED: cuda-8.0, cuda-9.0, cuda-9.1, cuda-9.2, cuda-10.0, cuda-10.1, cuda-10.2
// UNSUPPORTED: v8.0, v9.0, v9.1, v9.2, v10.0, v10.1, v10.2
// RUN: dpct --format-range=none -out-root %T/red %s --cuda-include-path="%cuda-path/include" -- -std=c++14 -x cuda --cuda-host-only
// RUN: FileCheck %s --match-full-lines --input-file %T/red/red.dp.cpp
// RUN: %if build_lit %{icpx -c -fsycl %T/red/red.dp.cpp -o %T/red/red.dp.o %}

// clang-format off
#include <cuda_runtime.h>

// CHECK: void atomicAddKernel(int* lock, int val) {
// CHECK-NEXT:    *lock += val;
// CHECK-NEXT:}
__global__ void atomicAddKernel(int* lock, int val) {
    asm volatile("red.relaxed.gpu.global.add.s32 [%0], %1;\n"
                 ::"l"(lock),"r"(val):"memory");
}

// clang-format on
