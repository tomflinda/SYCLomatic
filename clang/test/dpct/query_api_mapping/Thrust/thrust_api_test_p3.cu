
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

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::make_transform_output_iterator --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_make_transform_output_iterator
// thrust_make_transform_output_iterator:   auto output_iter = dpct::make_transform_output_iterator(vec.begin(), Square());

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::device_free --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_device_free
// thrust_device_free:    dpct::free_device(d_ptr);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::device_malloc --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_device_malloc
// thrust_device_malloc:    dpct::device_pointer<std::complex<double>> d_ptr = dpct::malloc_device<std::complex<double>>(1);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::free --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_free
// thrust_free:    dpct::free(device_sys, ptr);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::get --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_get
// thrust_get:     auto to = std::get<0>(ret);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::make_counting_iterator --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_make_counting_iterator
// thrust_make_counting_iterator:      auto range = dpct::make_counting_iterator(0);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::make_discard_iterator --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_make_discard_iterator
// thrust_make_discard_iterator:      oneapi::dpl::discard_iterator();

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::make_permutation_iterator --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_make_permutation_iterator
// thrust_make_permutation_iterator:     oneapi::dpl::make_permutation_iterator(h_input.begin(), h_input2.begin());

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::make_reverse_iterator --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_make_reverse_iterator
// thrust_make_reverse_iterator:      auto iter = oneapi::dpl::make_reverse_iterator(d_vec.begin());

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::make_transform_iterator --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_make_transform_iterator
// thrust_make_transform_iterator:      oneapi::dpl::make_transform_iterator(h_input.begin(), std::negate<int>());

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::make_tuple --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_make_tuple
// thrust_make_tuple:       auto ret = std::make_tuple(3, 4);

// RUN: dpct --cuda-include-path="%cuda-path/include" --query-api-mapping=thrust::make_zip_iterator --extra-arg="-std=c++14"| FileCheck %s -check-prefix=thrust_make_zip_iterator
// thrust_make_zip_iterator:       dpct::zip_iterator<iterator_tuple> ret = oneapi::dpl::make_zip_iterator(std::make_tuple(int_in.begin(), float_in.begin()));
