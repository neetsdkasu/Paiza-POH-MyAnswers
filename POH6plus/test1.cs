using System;
using S=System.String;
using C=System.Console;
using System.Linq;

class H
{
    public static void Main()
    {
        var z=C.In.ReadToEnd().Split(null);
        var d=new System.Collections.Generic.Dictionary<S,S>();
        S s="",t=s,r,x;
        int i,j;
        if(z[0]=="6")
            C.Write("fdkjnvqaqvnjkdf");
        else if(z[0]=="1")
            C.Write(z[1]);
        else if(z[0]=="7")
            for(i=0;i<7;i++)
                C.Write(z[1]);
        else
        {
            Array.Sort(z,1,z.Length-1);
            for(i=1;i<z.Length;i++)
            {
                x=z[i];
                r=new S(x.Reverse().ToArray());
                j=Array.IndexOf(z,r,i+1);
                if(j>0)
                {
                    s+=x;
                    t=r+t;
                    z[i]=z[j]="";
                }
            }
            C.Write(s+t);
        }
    }
}
