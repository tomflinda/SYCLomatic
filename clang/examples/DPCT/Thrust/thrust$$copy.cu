#include <iostream>
#include <iterator>
#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <thrust/copy.h>
#include <thrust/execution_policy.h>

void copy_test() {
  // clang-format off
  // Start
  const char data[] = "aaabbbbbcddeeeeeeeeeff";
  const size_t N = (sizeof(data) / sizeof(char)) - 1;
  char dst_data[N];
  const char data_d[] = "aaabbbbbcddeeeeeeeeeff";
  thrust::device_vector<char> input(data_d, data_d + N);
  thrust::host_vector<char> host_input(data, data + N);
  /*1*/ thrust::copy(data, data + N, dst_data);
  /*2*/thrust::copy(host_input.begin(), host_input.end(), std::ostream_iterator<char>(std::cout, ""));
  /*3*/thrust::copy(input.begin(), input.end(), std::ostream_iterator<char>(std::cout, ""));
  /*4*/thrust::copy(thrust::host, host_input.begin(), host_input.end(), std::ostream_iterator<char>(std::cout, ""));
  /*5*/thrust::copy(thrust::host, data, data + N, dst_data);
  /*6*/thrust::copy(thrust::device, input.begin(), input.end(), std::ostream_iterator<char>(std::cout, ""));
  // End
  // clang-format on
}
