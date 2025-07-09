// Option: --use-experimental-features=graph
#include <cuda.h>
#include <cuda_runtime.h>

void test() {
  cudaGraph_t graph;
  cudaGraph_t *graph2;
  // clang-format off
  // Start
  cudaGraphDestroy(graph);
  cudaGraphDestroy(*graph2);
  // End
  // clang-format on
}

