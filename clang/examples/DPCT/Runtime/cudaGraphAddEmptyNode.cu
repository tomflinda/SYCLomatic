// Option: --use-experimental-features=graph
#include <cuda.h>
#include <cuda_runtime.h>

void test() {
  cudaGraph_t graph;
  cudaGraphNode_t node4[10];
  cudaGraphNode_t node;
  // clang-format off
  // Start
  cudaGraphAddEmptyNode(&node, graph, node4, 10);
  // End
  // clang-format on
}

