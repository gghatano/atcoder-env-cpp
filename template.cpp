#include<bits/stdc++.h>
#include<atcoder/all>
using namespace atcoder;
using namespace std;

typedef long long ll;
typedef pair<int,int> pii;

// mint
using mint = static_modint<1000000007>;
// using mint = static_modint<998244353>;

vector<mint> frac(int N){
  // Nまでの階乗の値
  vector<mint> v(N+1,1);

  for(int i = 2; i <= N; i++){
    v[i] = v[i-1] * i;
  }
  return v;
}

mint comb(int a, int b, vector<mint> frac){
  // 組み合わせの値
  mint ret = 0;
  if(a < b) return ret;
  if(a < 0 || b < 0) return ret;
  if(a >= frac.size()) return ret;

  ret = frac[a];
  ret *= frac[b].inv();
  ret *= frac[a-b].inv();
  return ret;
}


// INF
ll INF = numeric_limits<ll>::max() / 2;

int main(){
  // set precision (10 digit)
  cout << setprecision(10);
}
