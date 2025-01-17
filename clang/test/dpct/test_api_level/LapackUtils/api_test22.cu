// UNSUPPORTED: cuda-8.0, cuda-9.0, cuda-9.1, cuda-9.2, cuda-10.0
// UNSUPPORTED: v8.0, v9.0, v9.1, v9.2, v10.0
// RUN: dpct --format-range=none --use-custom-helper=api -out-root %T/LapackUtils/api_test22_out %s --cuda-include-path="%cuda-path/include" -- -x cuda --cuda-host-only
// RUN: grep "IsCalled" %T/LapackUtils/api_test22_out/MainSourceFiles.yaml | wc -l > %T/LapackUtils/api_test22_out/count.txt
// RUN: FileCheck --input-file %T/LapackUtils/api_test22_out/count.txt --match-full-lines %s
// RUN: rm -rf %T/LapackUtils/api_test22_out

// CHECK: 31
// TEST_FEATURE: LapackUtils_syhegvd

#include "cusolverDn.h"

int main() {
  cusolverDnHandle_t handle;
  cusolverEigType_t itype;
  cusolverEigMode_t jobz;
  cublasFillMode_t uplo;
  int n;
  float *A;
  int lda;
  float *B;
  int ldb;
  float *W;
  float *work;
  int lwork;
  int *info;
  syevjInfo_t params;

  cusolverDnSsygvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork,
                   info, params);
  return 0;
}
