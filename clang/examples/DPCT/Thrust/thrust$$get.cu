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

void thrust_get() {
    auto ret = thrust::make_tuple(3, 4);
  // clang-format off
  // Start
    auto to = thrust::get<0>(ret);
  // End
  // clang-format on
}
