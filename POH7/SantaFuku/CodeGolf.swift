var r={readLine()!.utf8.split{$0==32}.map{Int(String($0))!}},a=r(),b=[0,a[0]],c=[0,a[1]],m={(x:[Int])->Int in(1..<x.count).map{x[$0]-x[$0-1]}.minElement()!};while --a[3]>=0{var d=r();if d[0]>0{c+=[d[1]]}else{b+=[d[1]]}};print(a[2]*m(b.sort())*m(c.sort()))
