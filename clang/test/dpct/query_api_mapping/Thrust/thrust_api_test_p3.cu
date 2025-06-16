
// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::abs --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_abs
// thrust_abs:  std::abs(std::complex<float>(0.0));


// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::log10 --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_log10
// thrust_log10:  std::log10(std::complex<float>(0.0));
