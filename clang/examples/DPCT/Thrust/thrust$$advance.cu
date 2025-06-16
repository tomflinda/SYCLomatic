#include <thrust/advance.h>
#include <thrust/device_vector.h>
#include <thrust/sequence.h>

void thrust_advance() {
  const int N = 5;
  thrust::device_vector<int> vec(N);
  thrust::device_vector<int>::iterator iter = vec.begin();
  // clang-format off
  // Start
    thrust::advance(iter, 2);
  // End
  // clang-format on
}
