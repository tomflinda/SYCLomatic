// UNSUPPORTED: cuda-8.0, cuda-9.0, cuda-9.1, cuda-9.2, cuda-10.0, cuda-10.1, cuda-10.2
// UNSUPPORTED: v8.0, v9.0, v9.1, v9.2, v10.0, v10.1, v10.2
// RUN: dpct --format-range=none -out-root %T/cvta %s --cuda-include-path="%cuda-path/include" -- -std=c++14 -x cuda --cuda-host-only
// RUN: FileCheck %s --match-full-lines --input-file %T/cvta/cvta.dp.cpp
// RUN: %if build_lit %{icpx -c -fsycl %T/cvta/cvta.dp.cpp -o %T/cvta/cvta.dp.o %}

// clang-format off
#include <cstdint>
#include <cuda_runtime.h>


// CHECK: void test_cvta_to_shared_u64(uint64_t* output, const sycl::nd_item<3> &item_ct1,
// CHECK-NEXT:                             int *shared_data) {
// CHECK-NEXT:     // Shared memory 
// CHECK-NEXT:    shared_data[0] = 0;
// CHECK-NEXT:    uint64_t shared_addr = 0;
// CHECK-NEXT:    shared_addr = (uint64_t)(&shared_data[0]);
// CHECK-NEXT:    output[item_ct1.get_local_id(2)] = shared_addr;
// CHECK-NEXT:}
__global__ void test_cvta_to_shared_u64(uint64_t* output) {
    __shared__ int shared_data[1]; // Shared memory
    shared_data[0] = 0;
    uint64_t shared_addr = 0;
    asm volatile("cvta.to.shared.u64 %0, %1;" : "=l"(shared_addr) : "l"(&shared_data[0]));
    output[threadIdx.x] = shared_addr;
}


__global__ void test_cvta_to_shared_u32(uint32_t* output) {
    __shared__ int shared_data[1]; // Shared memory
    shared_data[0] = 0;
    uint64_t shared_addr = 0;
    asm volatile("cvta.to.shared.u32 %0, %1;" : "=l"(shared_addr) : "l"(&shared_data[0]));
    output[threadIdx.x] = shared_addr;
}
// clang-format on
