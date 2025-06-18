#include <thrust/copy.h>
#include <thrust/count.h>
#include <thrust/device_ptr.h>
#include <thrust/device_vector.h>
#include <thrust/execution_policy.h>
#include <thrust/extrema.h>
#include <thrust/host_vector.h>
#include <thrust/find.h>

void exclusive_scan_test() {
  // clang-format off
  // Start
  const int N=3;
  int a[N]={0,1,2};
  thrust::host_vector<int> h_v(a,a+N);
  thrust::device_vector<int> d_v(a,a+N);
  struct add_functor
  {
    __host__ __device__
    void operator()(int & x)
    {
      x++;
    }
  };
  /*1*/ thrust::for_each_n(thrust::host, h_v.begin(), h_v.size(), add_functor());
  /*2*/ thrust::for_each_n(h_v.begin(), h_v.size(), add_functor());
  /*3*/ thrust::for_each_n(thrust::device, d_v.begin(), d_v.size(), add_functor());
  /*4*/ thrust::for_each_n(d_v.begin(), d_v.size(), add_functor());
  /*5*/ thrust::for_each_n(thrust::host, a, N, add_functor());
  /*6*/ thrust::for_each_n(a, N, add_functor());
  // End
  // clang-format on
}
