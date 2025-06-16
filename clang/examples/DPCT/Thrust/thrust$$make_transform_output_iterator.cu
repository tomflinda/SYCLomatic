#include <thrust/advance.h>
#include <thrust/device_vector.h>
#include <thrust/iterator/transform_output_iterator.h>
#include <thrust/sequence.h>
#include <thrust/transform.h>

// Unary function object for transforming input values
struct Square {
  __host__ __device__ int operator()(int x) const { return x * x; }
};

void thrust_make_transform_output_iterator() {
  const int N = 5;
  thrust::device_vector<int> vec(N);
  // clang-format off
  // Start
  auto output_iter = thrust::make_transform_output_iterator(vec.begin(), Square());
    // End
  // clang-format on
}
