
// UNSUPPORTED: v8.0, v9.0, v9.1, v9.2, v10.0, v10.1, v10.2, v11.0, v11.1, v11.2, v11.3, v11.4, v11.5, v11.6, v11.7, v11.8, v12.9
// UNSUPPORTED: cuda-8.0, cuda-9.0, cuda-9.1, cuda-9.2, cuda-10.0, cuda-10.1, cuda-10.2, cuda-11.0, cuda-11.1, cuda-11.2, cuda-11.3, cuda-11.4, cuda-11.5, cuda-11.6, cuda-11.7, cuda-11.8

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::binary_search --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_binary_search
// thrust_binary_search: CUDA API:
// thrust_binary_search-NEXT:  std::vector<int> v, v2, v3, v4;
// thrust_binary_search-NEXT:  auto bp = [](int x, int y) -> bool { return x < y; };
// thrust_binary_search-NEXT:  /*1*/ thrust::binary_search(thrust::seq, v.begin(), v.end(), v2.begin(), v2.end(), v3.begin());
// thrust_binary_search-NEXT:  /*2*/ thrust::binary_search(v.begin(), v.end(), v2.begin(), v2.end(), v3.begin());
// thrust_binary_search-NEXT:  /*3*/ thrust::binary_search(thrust::seq, v.begin(), v.end(), v2.begin(), v2.end(), v3.begin(), bp);
// thrust_binary_search-NEXT:  /*4*/ thrust::binary_search(v.begin(), v.end(), v2.begin(), v2.end(), v3.begin(), bp);
// thrust_binary_search-NEXT:Is migrated to:
// thrust_binary_search-NEXT:  std::vector<int> v, v2, v3, v4;
// thrust_binary_search-NEXT:  auto bp = [](int x, int y) -> bool { return x < y; };
// thrust_binary_search-NEXT:  /*1*/ oneapi::dpl::binary_search(oneapi::dpl::execution::seq, v.begin(), v.end(), v2.begin(), v2.end(), v3.begin());
// thrust_binary_search-NEXT:  /*2*/ oneapi::dpl::binary_search(oneapi::dpl::execution::seq, v.begin(), v.end(), v2.begin(), v2.end(), v3.begin());
// thrust_binary_search-NEXT:  /*3*/ oneapi::dpl::binary_search(oneapi::dpl::execution::seq, v.begin(), v.end(), v2.begin(), v2.end(), v3.begin(), bp);
// thrust_binary_search-NEXT:  /*4*/ oneapi::dpl::binary_search(oneapi::dpl::execution::seq, v.begin(), v.end(), v2.begin(), v2.end(), v3.begin(), bp);
