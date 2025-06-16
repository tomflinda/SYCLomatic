
// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::abs --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_abs
// thrust_abs:  std::abs(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::log10 --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_log10
// thrust_log10:  std::log10(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::sqrt --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_sqrt
// thrust_sqrt:  std::sqrt(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::sinh --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_sinh
// thrust_sinh:  std::sinh(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::cosh --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_cosh
// thrust_cosh:  std::cosh(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::tanh --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_tanh
// thrust_tanh:  std::tanh(std::complex<float>(0.0));


// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::asinh --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_asinh
// thrust_asinh:  std::asinh(std::complex<float>(0.0));


// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::acosh --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_acosh
// thrust_acosh:  std::acosh(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::atanh --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_atanh
// thrust_atanh:  std::atanh(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::polar --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_polar
// thrust_polar:  std::polar(1.0, 1.0);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::exp --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_exp
// thrust_exp:  std::exp(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::log --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_log
// thrust_log:  std::log(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::norm --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_norm
// thrust_norm:  std::norm(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::conj --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_conj
// thrust_conj:  std::conj(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::proj --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_proj
// thrust_proj:  std::proj(1);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::atan --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_atan
// thrust_atan:  std::atan(std::complex<float>(0.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::advance --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_advance
// thrust_advance:   std::advance(iter, 2);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::arg --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_arg
// thrust_arg:    std::arg(std::complex<double>(1.0));

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::distance --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_distance
// thrust_distance:    int d = oneapi::dpl::distance(iter1, iter2);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::tie --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_tie
// thrust_tie:    std::tie(a, b) = std::make_tuple(1.0, 2.0);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::not1 --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_not1
// thrust_not1:   oneapi::dpl::not1(pred);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::not2 --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_not2
// thrust_not2:   std::not2(std::greater_equal<int>());




