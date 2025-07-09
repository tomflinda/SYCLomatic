// Option: --use-experimental-features=graph
#include <cuda.h>
#include <cuda_runtime.h>

void test() {
  cudaGraph_t graph;
  cudaGraphNode_t node4[10];
  cudaGraphNode_t node5[10];
  // clang-format off
  // Start
  cudaGraphAddDependencies(graph, node4, node5, 10);
  // End
  // clang-format on
}

