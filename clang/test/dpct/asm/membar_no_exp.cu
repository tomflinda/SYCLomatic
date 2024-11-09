// UNSUPPORTED: cuda-8.0, cuda-9.0, cuda-9.1, cuda-9.2, cuda-10.0, cuda-10.1, cuda-10.2
// UNSUPPORTED: v8.0, v9.0, v9.1, v9.2, v10.0, v10.1, v10.2
// RUN: dpct --format-range=none -out-root %T/membar_no_exp %s --cuda-include-path="%cuda-path/include" -- -std=c++14 -x cuda --cuda-host-only
// RUN: FileCheck %s --match-full-lines --input-file %T/membar_no_exp/membar_no_exp.dp.cpp
// RUN: %if build_lit %{icpx -c -fsycl %T/membar_no_exp/membar_no_exp.dp.cpp -o %T/membar_no_exp/membar_no_exp.dp.o %}

// clang-format off
#include <cuda_runtime.h>
#include <cstdint>

__global__ void membar() {

  // CHECK: sycl::group_barrier(item_ct1.get_group());
  asm volatile("membar.cta;":::"memory"); 

  // CHECK:/*
  // CHECK-NEXT: DPCT1087:0: SYCL currently does not support cross group synchronization. You can specify "--use-experimental-features=root-group" to use the root-group to migrate membar.gl;.
  // CHECK-NEXT: */
  asm volatile("membar.gl;":::"memory"); 

  // CHECK:/*
  // CHECK-NEXT:DPCT1053:{{[0-9]+}}: Migration of device assembly code is not supported.
  // CHECK-NEXT:*/
  asm volatile("membar.sys;":::"memory");
}

// clang-format off
