#include <thrust/adjacent_difference.h>
#include <thrust/device_vector.h>
#include <thrust/functional.h>
#include <thrust/host_vector.h>
#include <thrust/logical.h>
// for cuda 12.0
#include <thrust/execution_policy.h>
#include <thrust/remove.h>

struct greater_than_zero {
  __host__ __device__ bool operator()(int x) const { return x > 0; }
  typedef int argument_type;
};

void thrust_not1() {
  greater_than_zero pred;
  // clang-format off
  // Start
      thrust::not1(pred);
  // End
  // clang-format on
}
