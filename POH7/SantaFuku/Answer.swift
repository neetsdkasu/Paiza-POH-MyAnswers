// Try POH
// author: Leonardone @ NEETSDKASU

var readInts={readLine()!.utf8.split{$0==32}.map{Int(String($0))!}}

var xyzn=readInts(),xs=[0,xyzn[0]],ys=[0,xyzn[1]]
for _ in 1...xyzn[3]{
    let da=readInts()
    if da[0]==0{xs+=[da[1]]}else{ys+=[da[1]]}
}
xs.sortInPlace()
ys.sortInPlace()
func mn(a:[Int])->Int{
    var m = a[a.count-1]
    for i in 1..<a.count{m=min(m,a[i]-a[i-1])}
    return m
}
print(xyzn[2]*mn(xs)*mn(ys))
