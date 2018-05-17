//#include<iostream>
#include<vector>
#include<deque>
#include<map>
#include<cassert>
#include<cmath>
#include<cstdlib>

using namespace std;

namespace aylmer {

 class Board {
  std::vector<std::vector<int > > value;

  std::deque <int > path [2];
  std::vector<int > total[2],count[2];
  std::vector<std::pair<int,int > > empty,bins;

  static std::vector<double> flog;

  int dim[2],grand;

  void init(int n0, int n1) {
   dim[0]=n0; dim[1]=n1;

   for(int i=0;i<n0;i++) value[i].resize(n1);
   for(int i=0;i<2;i++) {total[i].resize(dim[i]); count[i].resize(dim[i]);}

   for(int i=0;i<n0;i++) count[0][i]=dim[1];
   for(int i=0;i<n1;i++) count[1][i]=dim[0];

   int k=0;
   for(int i=0;i<n0;i++)
   for(int j=0;j<n1;j++) {empty.push_back(std::pair<int,int>(i,j)); value[i][j]=--k;}
  }

  int irand(int n) {return ((int)(n*(rand()/(double)RAND_MAX)))%n;}

  int randempty(int d, int j) {
   int k=0,i=irand(count[d][j]);
   if (d) {while(i>=0) {if (value[d][k]<0) i--; k++;}
   } else {while(i>=0) {if (value[k][d]<0) i--; k++;}
   }

   return k;
  }

 public:
  Board(int* row, int nrow, int* col, int ncol, int* blank, int nblank):value(nrow),grand(0) {
   init(nrow,ncol);

   for(int i=0;i<nrow  ;i++) set_total(0,i,row[i]);
   for(int i=0;i<ncol  ;i++) set_total(1,i,col[i]);
   for(int i=0;i<nblank;i++) set_value(blank[i]-1,blank[i+nblank]-1,0);
  }

  Board(int n0, int n1):value(n0),grand(0) {init(n0,n1);}

  static double getflog(int n) {
   if (n>=flog.size()) {
    for(int i=flog.size();i<=n;i++) flog.push_back(flog.back()+log((double)i));
   }

   return flog[n];
  }

  size_t size () const {return empty.size();}
  size_t nbins() const {return bins .size();}

  void increment(int n) {
   int i=bins[n].first,j=bins[n].second;

   int v=value[i][j];

   if (v<0) v=0;

   if (!set_value(i,j,v+1)) {
    bins[n]=bins.back();
    bins.pop_back();
   }
  }

  double get_prob()       const {double r=0; for(int i=0;    i<dim[0];i++) for(int j=0;j<dim[1];j++) r-=getflog(value[i][j]); return r;}
  double get_prob(int* x) const {double r=0; for(int i=0,k=0;i<dim[0];i++) for(int j=0;j<dim[1];j++) r-=getflog(x[k++]);      return r;}

  bool operator<(const Board& b) const {
   for(int i=0;i<dim[0];i++)
   for(int j=0;j<dim[1];j++) {
    int p=value[i][j],q=b.value[i][j]; if (p==q) continue; else return p<q;
   }
   return false;
  }

  void set_total(int i, int j, int v)              {int& p=total[i][j]; grand+=v-p; p=v;}
  bool set_value(int i, int j, int v, bool c=true) {
   if (total[0][i]<v||total[1][j]<v) return false;

   int& p=value[i][j];

   if (p<0) {
    empty[-1-p]=empty.back();
    value[empty.back().first][empty.back().second]=p;
    empty.pop_back();
    count[0][i]--;
    count[1][j]--;
    p=v;
   } else {
    v-=p; p+=v;
   }

   total[0][i]-=v;
   total[1][j]-=v; grand-=2*v;

   // Following test guards against the Alice Hankin paradox.
   while(c) {c=false;
    int i[2];

    for(i[0]=0;i[0]<dim[0];i[0]++) {
     if (count[0][i[0]]==1) {    i[1]=0;                  while(value[i[0]][i[1]]>=0) i[1]++; if (set_value(i[0],i[1],total[0][i[0]],false)) c=true;}
     if (total[0][i[0]]==0) {for(i[1]=0;i[1]<dim[1];i[1]++) if (value[i[0]][i[1]]< 0)         if (set_value(i[0],i[1],0             ,false)) c=true;}
    }

    for(i[1]=0;i[1]<dim[1];i[1]++) {
     if (count[1][i[1]]==1) {    i[0]=0;                  while(value[i[0]][i[1]]>=0) i[0]++; if (set_value(i[0],i[1],total[1][i[1]],false)) c=true;}
     if (total[1][i[1]]==0) {for(i[0]=0;i[0]<dim[0];i[0]++) if (value[i[0]][i[1]]< 0)         if (set_value(i[0],i[1],0             ,false)) c=true;}
    }
   }

   return true;
  }

//bool operator()(int i, int j, int v) {return set_value(i,j,v,true);}
  bool set_value_ind(int i, int v) {return set_value(empty[i].first,empty[i].second,v,true);}

  int  get_value (int i, int j) const {return value[i][j];}

  int  get_total (int i)  const {int v[]={total[0][empty[i].first],total[1][empty[i].second]}; return v[0]<v[1]?v[0]:v[1];}
  int  get_count (int i)  const {int v[]={count[0][empty[i].first],count[1][empty[i].second]}; return v[0]<v[1]?v[0]:v[1];}
  int  get_index ()       const {
   int b=0; for(int i=1;i<size();i++) if (get_count(i)<get_count(b)||(get_count(i)==get_count(b)&&get_total(i)<get_total(b))) b=i; return b;
  }

  int  get_grand ()       const {return grand;}

  bool operator()(int v)   {
   if (!set_value_ind(get_index(),v)) return false;

   bool c=false;

   for(int i=0;i<dim[0]&&!c;i++) c=count[0][i];
   for(int i=0;i<dim[1]&&!c;i++) c=count[1][i];

   if (!c) {
    for(int i=0;i<dim[0];i++) if (total[0][i]) return false;
    for(int i=0;i<dim[1];i++) if (total[1][i]) return false;
   }

   return true;
  }

  int  operator()()  const {return get_total(get_index());}

  void set_bins() {
   bins.clear();
   for(int i=0;i<dim[0];i++)
   for(int j=0;j<dim[1];j++) if (value[i][j]<0) bins.push_back(std::pair<int,int>(i,j));
  }

  int randline(int i, int d) {
   int j; do j=irand(dim[!d]); while(value[d?j:i][d?i:j]>=0);

   return j;
/*
  int j=irand(count[d][i]);

  for(int k=0;k<dim[!d];k++) {
   if (value[d?k:i][d?i:k]<0) {
    if (j) j--; else return k;
   }
  }
  exit(1);
 */
 }

  void next(int d) {
   path[!d].push_back(randline(path[d].back(),d));
   path[ d].push_back(         path[d].back());
  }

  void loop(int* ans, int& n) {
   int num(n);

   std::vector<int > brd(dim[0]*dim[1]);

   if (!num) num=-1;

   for(int i=0;i<dim[0]*dim[1];i++) brd[i]=ans[i];

   bool again;
   for(again=true;again&&num;num--) {
    for(int i=0;i<dim[0]*dim[1];i++) ans[i]=0;

    path[0].clear();
    path[1].clear();

    int start[2];

    do {start[0]=irand(dim[0]);
        start[1]=irand(dim[1]);} while(value[start[0]][start[1]]>=0);

    path[0].push_back(start[0]);
    path[1].push_back(start[1]);

    do {
     next(0); next(1);
     if (value[path[0].back()][path[1].front()]<0) {
      path[0].push_back(path[0].back ());
      path[1].push_back(path[1].front());

      path[0].push_back(path[0].front());
      path[1].push_back(path[1].front());
      break;
     }
    } while((path[0].back()!=start[0])||(path[1].back()!=start[1]));

    for(int i=0;i<path[0].size()-1;i++) ans[path[0][i]+dim[0]*path[1][i]]+=2*(i&1)-1;

    again=false; for(int i=0;i<dim[0]*dim[1]       ;i++) {if (brd[i]+ans[i]<0) {again=true; break;}} if (again) continue;
    again=true ; for(int i=0;i<dim[0]*dim[1]&&again;i++)  if (       ans[i]  )  again=false;         if (again) continue;
   }

   if (again) for(int i=0;i<brd.size();i++) ans[i] =brd[i]; else
              for(int i=0;i<brd.size();i++) ans[i]+=brd[i];

   n=again?0:n-num;
  }

/*
  void print(std::ostream& s) const {
   s << "value...\n";
   for(int i=0;i<dim[0];i++) {
   for(int j=0;j<dim[1];j++) s << value[i][j] << "\t"; s << "\n";
   }

   s << "empty   :"; for(int i=0;i<size();i++) s << empty[i].first << "," << empty[i].second << " "; s << "\n";
   s << "total[0]:"; for(int i=0;i<dim[0];i++) s << total[0][i] << " "; s << "\n";
   s << "total[1]:"; for(int i=0;i<dim[1];i++) s << total[1][i] << " "; s << "\n";
   s << "count[0]:"; for(int i=0;i<dim[0];i++) s << count[0][i] << " "; s << "\n";
   s << "count[1]:"; for(int i=0;i<dim[1];i++) s << count[1][i] << " "; s << "\n";
   s << "grand   :" << grand << "\n";

   s << "total   :"; for(int i=0;i<        size();i++) cout << get_total(i) << " "; s << "\n";
   s << "count   :"; for(int i=0;i<        size();i++) cout << get_count(i) << " "; s << "\n";
   s << "bins    :"; for(int i=0;i<bins   .size();i++) cout << bins[i].first << "," << bins[i].second << " "; s << "\n";
   s << "path    :"; for(int i=0;i<path[0].size();i++) cout << path[0][i]    << "," << path[1][i]     << " "; s << "\n";
   s << "index   :" << get_index() << "\n";
  } */
}; // Board



 class Boards {
 public:
  typedef std::map<Board,int >                 Boards_t;
  typedef std::map<Board,int >::      iterator Boards_i;
  typedef std::map<Board,int >::const_iterator Boards_ci;
  typedef std::map<Board,int >::value_type     Boards_v;

 protected:
  Boards_t boards;

  Boards() {}

  void insert(const Board& b) {Boards_i i(boards.find(b)); if (i!=boards.end()) (i->second)++; else boards.insert(Boards_v(b,1));}

 public:
/*  void print(std::ostream& s) const {
   for(Boards_ci i=boards.begin();i!=boards.end();i++) {
    s << i->second << " : "; i->first.print(s); s << "\n";
   }
  }
*/
 
  size_t size() const {return boards.size();}

  Boards_i begin() {return boards.begin();}
  Boards_i end  () {return boards.end  ();}
 }; // Boards


 class QuickBoards: public Boards {
 public:
  QuickBoards() {}

  void go(const Board& b, int& n) {
   if (!b.size()) {
    n--; return insert(b);
   }

   int m(b());

   for(int v=0;v<=m;v++) {
    Board bd(b); if (bd(v)) go(bd,n); if (!n) return;
   }
  }
 }; // QuickBoards


 class RandomBoards: public Boards {
 public:
  RandomBoards() {}

  void go(const Board& b, int& n) {
   Board t(b); t.set_bins();

   while(n--) {
    Board c(t); 

    while(c.nbins()) {
     c.increment((int)(rand()/((double)RAND_MAX)*c.nbins()));
    }

    if (c.get_grand()) n++; else insert(c);
   }
  }
 }; // RandomBoards

} // aylmer
