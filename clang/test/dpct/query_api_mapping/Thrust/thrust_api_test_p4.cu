
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

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::any_of --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_any_of
// thrust_any_of: CUDA API:
// thrust_any_of-NEXT:  struct greater_than_zero {
// thrust_any_of-NEXT:    __host__ __device__ bool operator()(int x) const { return x > 0; }
// thrust_any_of-NEXT:  };
// thrust_any_of-NEXT:  greater_than_zero pred;
// thrust_any_of-NEXT:  thrust::device_vector<int> A(4);
// thrust_any_of-NEXT:  thrust::device_vector<int> B(4);
// thrust_any_of-NEXT:  /*1*/ thrust::any_of(A.begin(), A.end(), pred);
// thrust_any_of-NEXT:  /*2*/ thrust::any_of(thrust::device, B.begin(), B.end(), pred);
// thrust_any_of-NEXT:Is migrated to:
// thrust_any_of-NEXT:  struct greater_than_zero {
// thrust_any_of-NEXT:    bool operator()(int x) const { return x > 0; }
// thrust_any_of-NEXT:  };
// thrust_any_of-NEXT:  greater_than_zero pred;
// thrust_any_of-NEXT:  dpct::device_vector<int> A(4);
// thrust_any_of-NEXT:  dpct::device_vector<int> B(4);
// thrust_any_of-NEXT:  /*1*/ oneapi::dpl::any_of(oneapi::dpl::execution::make_device_policy(q_ct1), A.begin(), A.end(), pred);
// thrust_any_of-NEXT:  /*2*/ oneapi::dpl::any_of(oneapi::dpl::execution::make_device_policy(q_ct1), B.begin(), B.end(), pred);


