#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

// Declare the function prototype (must match your definition)

#ifdef __cplusplus
extern "C" {
#endif
  void numboards(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, int* ans);
#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
extern "C" {
#endif
  void allboardprobs(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, double* ans, int* nval);
#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
extern "C" {
#endif
  void allboards(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, int* ans, int* nval);
#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
extern "C" {
#endif
  void randpath(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, int* ans, int* num);
#ifdef __cplusplus
}
#endif


static const R_CMethodDef CEntries[] = {
    {"numboards"    , (DL_FUNC) &numboards    , 7},
    {"allboardprobs", (DL_FUNC) &allboardprobs, 8},
    {"allboards"    , (DL_FUNC) &allboards    , 8},
    {"randpath"     , (DL_FUNC) &randpath     , 8},
    {NULL, NULL, 0}
};


void R_init_aylmer(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
