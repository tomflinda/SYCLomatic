#include <thrust/copy.h>
#include <thrust/device_ptr.h>
#include <thrust/device_vector.h>
#include <thrust/execution_policy.h>
#include <thrust/extrema.h>
#include <thrust/gather.h>
#include <thrust/host_vector.h>
#include <thrust/inner_product.h>
#include <thrust/random.h>
#include <thrust/reduce.h>
#include <thrust/scatter.h>
#include <thrust/tuple.h>


void stable_sort_by_key() {
  // clang-format off
  // Start
  int data[10];
  cudaStream_t stream;
  thrust::device_ptr<int> begin = thrust::device_pointer_cast(&data[0]);
  thrust::device_ptr<int> end = begin + 10;
  /*1*/ bool h_result = thrust::transform_reduce(begin, end, thrust::plus<bool>(), 0, thrust::plus<bool>());
  /*2*/ bool h_result_1 = thrust::transform_reduce(thrust::seq, begin, end, thrust::plus<bool>(), 0, thrust::plus<bool>());
  /*3*/ bool h_result_2 = thrust::transform_reduce(thrust::cuda::par.on(stream), begin, end, thrust::plus<bool>(), 0, thrust::plus<bool>());
  // End
  // clang-format on
}
