require 'json'
def B(p,q,l)a=p+l+1;(p..a).each{|x|G[q][x]=x==p||x==a ? "+":"-"}end
def C(p,q,h)a=q+h+1;(q..a).each{|y|G[y][p]=y==q||y==a ? "+":"|"}end
def D(p,q)a=q+W+1;(q..a).each{|y|G[y][p-y+q]=y==q||y==a ? "+":"/"}end
def E(d,o,z)l=d[0];h=d[2];a=H-h-2;b=o+l+1;c=a-W-1;e=b+W+1;u=c+h+1;f=o+W;r=l+f+4;B(o,H-1,l);B(o,a,l);B(f+1,c,l);C(o,a,h);C(b,a,h);C(e,c,h);D(f+1,c);D(e,c);D(e,u);if !z then(u..u+W+1).each{|y|(e-y+u+1..r-1).each{|x|G[y][x]="_"}}end;if o>0 then(c..c+W+1).select{|y|y>=u}.each{|y|(o..f-y+c).each{|x|G[y][x]="_"}}end;r;end
F=JSON.parse(ARGV[0])
W=F[0][1]
n=F.size
L=F.map{|d|d[0]}.sum+n*W+n*4-1
H=F.map{|d|d[2]}.max+3+W
G=Array.new(H){Array.new(L){" "}};o=0
F.each_with_index{|d,i|o=E d,o,i==n-1}
G.each{|y|y.each{|x|putc x};putc"\n"}
