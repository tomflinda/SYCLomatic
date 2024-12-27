// UNSUPPORTED: cuda-8.0, cuda-9.0, cuda-9.1, cuda-9.2, cuda-10.0, cuda-10.1, cuda-10.2
// UNSUPPORTED: v8.0, v9.0, v9.1, v9.2, v10.0, v10.1, v10.2
// RUN: dpct --format-range=none -out-root %T/cp %s --cuda-include-path="%cuda-path/include" -- -std=c++14 -x cuda --cuda-host-only
// RUN: FileCheck %s --match-full-lines --input-file %T/cp/cp.dp.cpp
// RUN: %if build_lit %{icpx -c -fsycl %T/cp/cp.dp.cpp -o %T/cp/cp.dp.o %}

// clang-format off
#include <cuda_runtime.h>
#include <cstdint>

// CHECK:inline void cp_async_commit_group() {
// CHECK-NEXT:  /*
// CHECK-NEXT:  DPCT1026:{{[0-9]+}}: The call to "cp.async.commit_group;" was removed because there is no equivalent functionality in SYCL side. You may need to adjust the code.
// CHECK-NEXT:  */
// CHECK-EMPTY:
// CHECK-NEXT:}
__device__ inline void cp_async_commit_group() {
asm volatile("cp.async.commit_group;" ::);
}


// CHECK:inline void cp_async_wait_group() {
// CHECK-NEXT:  /*
// CHECK-NEXT:  DPCT1026:{{[0-9]+}}: The call to "cp.async.wait_group 0;" was removed because there is no equivalent functionality in SYCL side. You may need to adjust the code.
// CHECK-NEXT:  */
// CHECK-EMPTY:
// CHECK-NEXT:}
__device__ inline void cp_async_wait_group() {
asm volatile("cp.async.wait_group 0;");
}

// CHECK:inline void cp_async_wait_all() {
// CHECK-NEXT:  /*
// CHECK-NEXT:  DPCT1026:{{[0-9]+}}: The call to "cp.async.wait_all;" was removed because there is no equivalent functionality in SYCL side. You may need to adjust the code.
// CHECK-NEXT:  */
// CHECK-EMPTY:
// CHECK-NEXT:}
__device__ inline void cp_async_wait_all() {
asm volatile("cp.async.wait_all;");
}

// clang-format on
