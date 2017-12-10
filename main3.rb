require 'json'
def I(p,q)x=p;while G[q][x]==" ";G[q][x]="_";x-=1;end;end
def B(p,q,l)a=p+l+1;(p..a).each{|x|G[q][x]=x==p||x==a ? "+":"-"}end
def C(p,q,h,b=nil)a=q+h+1;(q..a).each{|y|G[y][p]=y==q||y==a ? "+":"|";if y>=U&&b;I(p-1,y)end}end
def D(p,q,b=nil)a=q+W+1;(q..a).each{|y|G[y][p-y+q]=y==q||y==a ? "+":"/";if y>=U&&b;I(p-y+q-1,y)end}end
def E(d,o)l=d[0];h=d[2];a=H-h-2;b=o+l+1;c=a-W-1;e=b+W+1;f=o+W;r=l+f+4;B(o,H-1,l);B(o,a,l);B(f+1,c,l);C(o,a,h,o>0);C(b,a,h);C(e,c,h);D(f+1,c,o>0);D(e,c);D(e,U);r;end
F=JSON.parse(ARGV[0])
W=F[0][1]
n=F.size
H=F.map{|d|d[2]}.max+3+W
U=H-2-W
G=Array.new(H){Array.new(F.map{|d|d[0]}.sum+n*W+n*4-1){" "}};o=0
F.each{|d|o=E d,o}
G.each{|y|y.each{|x|putc x};putc"\n"}
