class Main{public static void main(String[]a)throws Exception{ProcessBuilder p=new ProcessBuilder("ruby","-e","gets;w=ARGF.read.split.sort;c=s=\"\";w.map{|x|w.index(y=x.reverse)&&x<y&&s+=x;x==y&&c=x};$><<s+c*w.count(c)+s.reverse");p.redirectInput(ProcessBuilder.Redirect.INHERIT);p.redirectOutput(p.redirectInput());p.start().waitFor();}}