// RUN: cd %T
// RUN: cat %S/compile_commands.json > %T/compile_commands.json
// RUN: cat %S/test.cu > %T/test.cu
// RUN: dpct -p %S -out-root %T/insert_around  --cuda-include-path="%cuda-path/include" 

#include <cuda_runtime.h>
namespace quda {
  // CHECK: return int8_t(a + b);
  __host__ __device__ inline double2 operator+(const double2 &x, const double2 &y)
  {
  }


}
int main() {
    return 0;
}
