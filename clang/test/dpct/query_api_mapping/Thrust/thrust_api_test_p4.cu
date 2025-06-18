
// UNSUPPORTED: v8.0, v9.0, v9.1, v9.2, v10.0, v10.1
// UNSUPPORTED: cuda-8.0, cuda-9.0, cuda-9.1, cuda-9.2, cuda-10.0, cuda-10.1
// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::adjacent_difference --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_adjacent_difference
// thrust_adjacent_difference: CUDA API:
// thrust_adjacent_difference-NEXT:   float *host_ptr_A;
// thrust_adjacent_difference-NEXT:   float *host_ptr_R;
// thrust_adjacent_difference-NEXT:   float *device_ptr_A;
// thrust_adjacent_difference-NEXT:   float *device_ptr_R;
// thrust_adjacent_difference-NEXT:   /*1*/ thrust::adjacent_difference(thrust::device, device_ptr_A, device_ptr_A+10, device_ptr_R);
// thrust_adjacent_difference-NEXT:   /*2*/ thrust::adjacent_difference(host_ptr_A, host_ptr_A+10, host_ptr_R, thrust::minus<float>());
// thrust_adjacent_difference-NEXT:   /*3*/ thrust::adjacent_difference(thrust::device, device_ptr_A, device_ptr_A+10, device_ptr_R, thrust::minus<float>());
// thrust_adjacent_difference-NEXT:   /*4*/ thrust::adjacent_difference(host_ptr_A, host_ptr_A+10, host_ptr_R);
// thrust_adjacent_difference-NEXT: Is migrated to:
// thrust_adjacent_difference-NEXT:   float *host_ptr_A;
// thrust_adjacent_difference-NEXT:   float *host_ptr_R;
// thrust_adjacent_difference-NEXT:   float *device_ptr_A;
// thrust_adjacent_difference-NEXT:   float *device_ptr_R;
// thrust_adjacent_difference-NEXT:  /*1*/ oneapi::dpl::adjacent_difference(oneapi::dpl::execution::make_device_policy(q_ct1), device_ptr_A, device_ptr_A+10, device_ptr_R);
// thrust_adjacent_difference-NEXT:  /*2*/ oneapi::dpl::adjacent_difference(oneapi::dpl::execution::seq, host_ptr_A, host_ptr_A+10, host_ptr_R, std::minus<float>());
// thrust_adjacent_difference-NEXT:  /*3*/ oneapi::dpl::adjacent_difference(oneapi::dpl::execution::make_device_policy(q_ct1), device_ptr_A, device_ptr_A+10, device_ptr_R, std::minus<float>());
// thrust_adjacent_difference-NEXT:  /*4*/ oneapi::dpl::adjacent_difference(oneapi::dpl::execution::seq, host_ptr_A, host_ptr_A+10, host_ptr_R);
