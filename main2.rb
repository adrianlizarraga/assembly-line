require 'json'
def I(p,q)x=p;while G[q][x]==" ";G[q][x]="_";x-=1;end;end
def C(p,q,h,f,b=nil)a=q+h+1;(q..a).each{|y|G[f==1 ?y:p][f==1 ? p:y]=y==q||y==a ? "+":f==1 ? "|":"-";if y>=U&&b;I(p-1,y)end}end
def D(p,q,b=nil)a=q+W+1;(q..a).each{|y|G[y][p-y+q]=y==q||y==a ? "+":"/";if y>=U&&b;I(p-y+q-1,y)end}end
def E(d,o)l=d[0];h=d[2];a=H-h-2;b=o+l+1;c=a-W-1;e=b+W+1;f=o+W;r=l+f+4;C(H-1,o,l,0);C(a,o,l,0);C(c,f+1,l,0);C(o,a,h,1,o>0);C(b,a,h,1);C(e,c,h,1);D(f+1,c,o>0);D(e,c);D(e,U);r;end
f=JSON.parse(ARGV[0])
W=f[0][1]
n=f.size
H=f.map{|d|d[2]}.max+3+W
U=H-2-W
G=Array.new(H){Array.new(f.map{|d|d[0]}.sum+n*W+n*4-1){" "}};o=0
f.each{|d|o=E d,o}
puts G.map{|y|y.join("")}
