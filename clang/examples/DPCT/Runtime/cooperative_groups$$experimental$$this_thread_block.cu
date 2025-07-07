
#define _CG_ABI_EXPERIMENTAL

#include <cuda.h>
#include "cooperative_groups.h"

void test() {
  cooperative_groups::experimental::block_tile_memory<1, 1> mem;

  // Start
  cooperative_groups::thread_block tb =
      cooperative_groups::experimental::this_thread_block();
  // End

  
}
