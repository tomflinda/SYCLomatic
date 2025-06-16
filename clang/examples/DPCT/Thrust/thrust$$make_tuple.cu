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

void thrust_make_tuple() {
  // clang-format off
  // Start
    auto ret = thrust::make_tuple(3, 4);
  // End
  // clang-format on
}
