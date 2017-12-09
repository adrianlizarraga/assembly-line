require 'json'
def q(s)s.each{|y|y.each{|x|putc x};putc"\n"}end
def x(s,d,o,z)l=d[0];w=d[1];h=d[2];f=E-1-h-1;e=o+l+2;j=f-w-1;q=e+w+1;(f..E-1).each do|y|(o..e-1).each do|x|if y==f||y==E-1 then g="+";i="-"else g="|";i=" "end
s[y][x]=x==o||x==e-1 ? g:i end end
(j..f-1).each do|y|k=o+w+1-y+j;m=k+l+1;(k..m).each do|x|if y==j then g="+";i="-"else g="/";i=" "end
s[y][x]=x==k||x==m ? g:i end end
(j+1..j+h).each do |y|s[y][q-1]="|"end
(j+h+1..E-1).each do |y|k=e+w-y+j+h+1;m=k+y-j-h;r=[m+1,L].min;(k..r-1).each do |x|g=y==j+h+1 ? "+":"/";i=z ? " ":"_";if !(y==E-1&&x==k)
s[y][x]=x==k ? g:i end end end
l+w+4+o end
ds=JSON.parse(ARGV[0]);w=ds[0][1];n=ds.length;L=ds.map{|d|d[0]}.sum+n*w+n*4-1;E=ds.map{|d|d[2]}.max+2+w+1;s=Array.new(E){Array.new(L){" "}};o=0;ds.each_with_index{|d,i|o=x s,d,o,i==n-1};q s
