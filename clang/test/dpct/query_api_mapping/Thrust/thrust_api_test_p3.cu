
// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::abs --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_abs
// thrust_abs:  std::abs(std::complex<float>(0.0));


