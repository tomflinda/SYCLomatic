#include <cuda_runtime.h>
#include <thrust/complex.h>
#include <thrust/device_free.h>
#include <thrust/device_malloc.h>
#include <thrust/device_ptr.h>
#include <thrust/device_vector.h>

// Unary function object for transforming input values
struct Square {
  __host__ __device__ int operator()(int x) const { return x * x; }
};

void thrust_device_free() {
  thrust::device_ptr<thrust::complex<double>> d_ptr =
      thrust::device_malloc<thrust::complex<double>>(1);
  // clang-format off
  // Start
  thrust::device_free(d_ptr);
  // End
  // clang-format on
}
