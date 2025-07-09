#include <cuda_runtime.h>

void test(int i) {
  // Start
  cudaDeviceProp *pd;
  cudaGetDeviceProperties_v2(pd, i /*int*/);
  // End
}
