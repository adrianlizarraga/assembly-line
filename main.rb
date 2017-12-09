require 'json'
def q(s)s.each{|y|y.each{|x|putc x};putc"\n"}end
def x(s,d,o,z)l=d[0];w=d[1];h=d[2];ym=E-1-h-1;e=o+l+2;yt=ym-w-1;xt=e+w+1;(ym..E-1).each do|y|(o..e-1).each do|x|if y==ym||y==E-1 then c1="+";c2="-"else c1="|";c2=" "end
s[y][x]=x==o||x==e-1 ? c1:c2 end end
(yt..ym-1).each do|y|xs=o+w+1-y+yt;xf=xs+l+1;(xs..xf).each do|x|if y==yt then c1="+";c2="-"else c1="/";c2=" "end
s[y][x]=x==xs||x==xf ? c1:c2 end end
(yt+1..yt+h).each do |y|s[y][xt-1]="|"end
(yt+h+1..E-1).each do |y|xs=e+w-y+yt+h+1;xf=xs+y-yt-h;xl=[xf+1,L].min;(xs..xl-1).each do |x|c1=y==yt+h+1 ? "+":"/";c2=z ? " ":"_";if !(y==E-1&&x==xs)
s[y][x]=x==xs ? c1:c2 end end end
l+w+4+o end
ds=JSON.parse(ARGV[0]);w=ds[0][1];n=ds.length;L=ds.map{|d|d[0]}.sum+n*w+n*4-1;E=ds.map{|d|d[2]}.max+2+w+1;s=Array.new(E){Array.new(L){" "}};o=0;ds.each_with_index{|d,i|o=x s,d,o,i==n-1};q s
