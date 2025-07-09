// Option: --use-experimental-features=bindless_images
#include <cuda.h>
#include <cuda_runtime.h>

void test() {
  cudaSurfaceObject_t surf;
  cudaResourceDesc resDesc;
  // clang-format off
  // Start
  cudaCreateSurfaceObject(&surf, &resDesc);
  // End
  // clang-format on
}

