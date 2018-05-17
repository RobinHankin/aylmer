#ifndef INCLUDE_app_h
#define INCLUDE_app_h

#include"board.h"


extern "C"  void randpath      (int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank,         int   *ans, int* num   );
extern "C"  void  numboards    (int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank,         int   *ans             );
extern "C"  void  allboards    (int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank,         int   *ans, int* nval  );
extern "C"  void randboards    (int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank,         int   *ans, int* nval  );
extern "C"  void  allboardprobs(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank,         double*ans, int* nval  ); // rksh calls nval, 'B'
extern "C"  void randboardprobs(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank,         double*ans, int* nval  ); // rksh calls nval, 'B'
extern "C"  void          prob (int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, int* x, double*ans             ); // rksh calls nval, 'B'


// On entry, nval contains the number of attempts
// On exit , nval contains the length of the loop (0 means failure to find a loop)
void randpath(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, int* ans, int* num) {
 aylmer::Board board(row,*nrow,col,*ncol,blank,*nblank);

/*
 for(int i=0;i<*nrow;i++) {
 for(int j=0;j<*ncol;j++) if (!ans[i+*nrow*j]) cout << ".\t"; else cout << ans[i+*nrow*j] << "\t"; cout << "\n";
 }

 board.print(std::cout);
 */

 board.loop(ans,*num);

/*
 cout << "perturbed board:" << endl;

 for(int i=0;i<*nrow;i++) {
 for(int j=0;j<*ncol;j++) if (!ans[i+*nrow*j]) cout << ".\t"; else cout << ans[i+*nrow*j] << "\t"; cout << "\n";
 }
 */
}

void numboards(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, int* ans) {
 aylmer::     Board  board(row,*nrow,col,*ncol,blank,*nblank);
 aylmer::QuickBoards boards;

 boards.go(board,*ans);

 *ans=boards.size();
}

void allboards(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, int* ans, int* nval) {
 aylmer::     Board  board(row,*nrow,col,*ncol,blank,*nblank);
 aylmer::QuickBoards boards;

 int n=*nval;

 boards.go(board, *nval);

 int i=0;

 for(aylmer::Boards::Boards_i iv=boards.begin();n>0;n--,iv++)
 for(int ic=0;ic<*ncol;ic++) 
 for(int ir=0;ir<*nrow;ir++) ans[i++]=iv->first.get_value(ir,ic);
}

void randboards(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, int   * ans, int* nval  ) {
 aylmer::      Board  board(row,*nrow,col,*ncol,blank,*nblank);
 aylmer::RandomBoards boards;

 boards.go(board,*ans);

 int i=0,n=*nval;

 for(aylmer::Boards::Boards_i iv=boards.begin();n>0;n--,iv++)
 for(int ic=0;ic<*ncol;ic++) 
 for(int ir=0;ir<*nrow;ir++) ans[i++]=iv->first.get_value(ir,ic);
}

void allboardprobs(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, double* ans, int* nval) {
 aylmer::     Board  board(row,*nrow,col,*ncol,blank,*nblank);
 aylmer::QuickBoards boards;

 int n=*nval;

 boards.go(board,*nval);

 int i=0;

 for(aylmer::Boards::Boards_i iv=boards.begin();n>0;n--,iv++)
  ans[i++]=iv->first.get_prob();
}

void prob(int* row, int* nrow, int* col, int* ncol, int* blank, int* nblank, int* x, double* ans) {
 aylmer::Board board(row,*nrow,col,*ncol,blank,*nblank);

 *ans=board.get_prob(x);
}

#endif
