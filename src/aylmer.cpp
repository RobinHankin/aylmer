#include"aylmer.h"

//#include<iostream>
#include<vector>


using namespace std;


#define NR 9
#define NC 6
#define NB 18

/*
#define NR 36
#define NC 9
#define NB 252
 */

/*
#define NR 5
#define NC 5
#define NB 15
 */

int main() {
 int nr=NR,nc=NC,nb=NB;

 int row[NR];
 int col[NC];

 int blank[2][NB];

 blank[0][ 0]=1; blank[1][ 0]=3;
 blank[0][ 1]=1; blank[1][ 1]=5;
 blank[0][ 2]=2; blank[1][ 2]=2;
 blank[0][ 3]=2; blank[1][ 3]=5;
 blank[0][ 4]=3; blank[1][ 4]=1;
 blank[0][ 5]=3; blank[1][ 5]=5;
 blank[0][ 6]=4; blank[1][ 6]=3;
 blank[0][ 7]=4; blank[1][ 7]=6;
 blank[0][ 8]=5; blank[1][ 8]=2;
 blank[0][ 9]=5; blank[1][ 9]=6;
 blank[0][10]=6; blank[1][10]=1;
 blank[0][11]=6; blank[1][11]=6;
 blank[0][12]=7; blank[1][12]=3;
 blank[0][13]=7; blank[1][13]=4;
 blank[0][14]=8; blank[1][14]=2;
 blank[0][15]=8; blank[1][15]=4;
 blank[0][16]=9; blank[1][16]=1;
 blank[0][17]=9; blank[1][17]=4;

/*
 blank[0][ 0]=1; blank[1][ 0]=3;
 blank[0][ 1]=1; blank[1][ 1]=4;
 blank[0][ 2]=1; blank[1][ 2]=5;
 blank[0][ 3]=2; blank[1][ 3]=1;
 blank[0][ 4]=2; blank[1][ 4]=4;
 blank[0][ 5]=2; blank[1][ 5]=5;
 blank[0][ 6]=3; blank[1][ 6]=1;
 blank[0][ 7]=3; blank[1][ 7]=2;
 blank[0][ 8]=3; blank[1][ 8]=5;
 blank[0][ 9]=4; blank[1][ 9]=1;
 blank[0][10]=4; blank[1][10]=2;
 blank[0][11]=4; blank[1][11]=3;
 blank[0][12]=5; blank[1][12]=2;
 blank[0][13]=5; blank[1][13]=3;
 blank[0][14]=5; blank[1][14]=4;
 */

/*
 for(int i=0;i<NB;i++) cin >> blank[0][i] >> blank[1][i];
 */

 for(int i=0;i<NR;i++) row[i]=1;
 for(int i=0;i<NC;i++) col[i]=1;

/*
 blank[0][ 0]=1; blank[1][ 0]=1;
 blank[0][ 1]=2; blank[1][ 1]=2;
 blank[0][ 2]=3; blank[1][ 2]=3;
 */

// int ans[NR*NC];
 int ans[]={5,3,0,10,4,0,5,5,0,3,0,4,3,0,4,1,0,9,0,5,9,0,5,3,0,1,7,
            4,8,2, 3,6,1,0,0,0,0,0,0,4,3,3,1,1,2,3,2,1,0,0,0,2,1,0};

 for(int i=0;i<54;i++) ans[i]/=3;

 srand(2);

 for(int n=0;n<50;n++) {
  int num=10;
//  for(int i=0;i<NR*NC;i++) ans[i]=1;
  randpath(row,&nr,col,&nc,(int*)blank,&nb,ans,&num);
  ///  std::cout << n << ":" << num << "\n";
 }

/*
 int num=5,status;

 numboards(row,&nr,col,&nc,(int*)blank,&nb,&num);

 cout << "count:" << num << "\n";

 assert(num<=NV);

 int arr[NR*NC*NV];

 allboards(row,&nr,col,&nc,(int*)blank,&nb,arr,&num);

 int i=0;
 for(int iv=0;iv<num;iv++) {
 for(int ir=0;ir<NR;ir++) {
 for(int ic=0;ic<NC;ic++) cout << arr[i++] << "\t";
                          cout << "\n";}
                          cout << "\n";}
 */

/*
 aylmer::Board board(4,3);

 board.set_total(0,0,3);
 board.set_total(0,1,2);
 board.set_total(0,2,1);
 board.set_total(0,3,1);

 board.set_total(1,0,4);
 board.set_total(1,1,2);
 board.set_total(1,2,1);

 board.set_value(0,2,0);
 board.set_value(1,1,0);
 board.set_value(2,0,0);
 */

/*
 aylmer::Board board(2,2);

 board.set_total(0,0,3);
 board.set_total(0,1,4);

 board.set_total(1,0,1);
 board.set_total(1,1,6);

 board.print(cout);

 aylmer::QuickBoards boards;

 int num=0;

 boards.go(board,num);

 boards.print(cout);

 cout << "flog tests...\n";
 for(int i=0;i<10;i++)
  cout << aylmer::Board::getflog(i) << "\t" << exp(aylmer::Board::getflog(i)) << "\n";
 */

 return 0;
}
