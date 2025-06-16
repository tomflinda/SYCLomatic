
#include <thrust/tuple.h>

void thrust_proj() {
  double a, b;
  // clang-format off
  // Start
    thrust::tie(a, b) = thrust::make_tuple(1.0, 2.0);
  // End
  // clang-format on
}
