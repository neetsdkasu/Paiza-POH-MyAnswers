import std.stdio,std.string;void main(){int n,i,j;string f,c,e,r,z;string[]w;readf("%d\n",&n);w.length=n;for(i=0;i<n;i++)w[i]=chomp(readln());w.sort;for(i=0;i<n;i++)if(""!=(z=w[i])){r="";foreach(char h;z)r=h~r;for(j=i+1;j<n;j++)if(w[j]==r){f~=z;e=r~e;w[j]="";j=n;}if(j==n&&z==r&&(c==""||r<c))c=r;}writeln(f~c~e);}
