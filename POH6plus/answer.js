process.stdin.resume();
process.stdin.setEncoding('utf8');
m="\n";
c="";
o=process.stdout;
function P(h,f){
    r=s.split("").reverse().join("");
    if(s<=r){
        u=0;
        v=1;
        while((v=h.indexOf(r,v+1))>0)
            u++;
        if(u>0){
            if(s===r){
                if(u%2==1){
                    if (c===""||c>r)
                        c=r;
                    u--;
                }
                u/=2;
            }
            for(i=0;i<u;i++)
                o.write(f?s:r);
        }
    }
}

process.stdin.on('data',function(h){
    j=0;
    k=h.indexOf(m);
    n=h.substring(j,k)-0;
    j=k+1;
    k=h.indexOf(m,j);
    l=k-j;
    k=h.indexOf(m,k+1);
    q=k-j-l;
    y=h.substring(j,j+q);
    x=y;
    for(i=0;i<n;i++){
        k=j+i*q;
        t=h.substring(k,k+l);
        if(t<y) 
            y=t;
        if(t>x) 
            x=t;
    }
    s=y;
    for(;;){
        P(h,1);
        if(s===x) 
            break;
        r=s;
        s=x;
        for(i=0;i<n;i++){
            k=j+i*q;
            t=h.substring(k,k+l);
            if(t>r&&t<s) 
                s=t;
        }
    }
    o.write(c);
    s=x;
    for(;;){
        P(h,0);
        if(s===y)
            break;
        r=s;
        s=y;
        for(i=0;i<n;i++){
            k=j+i*q;
            t=h.substring(k,k+l);
            if(t>s&&t<r)
                s=t;
            
        }
    }
});
