def O(f)
def I(p,q)x=p;while $s[q][x]==" ";$s[q][x]="_";x-=1;end;end
def C(p,q,h,f,g,b=nil)a=q+h+1;(q..a).each{|y|h=g==1 ?p:p-y+q;$s[f==1 ?y:h][f==1 ?h:y]=y==q||y==a ? "+":f==1 ?g==1 ? "|":"/":"-";if y>=$u&&b;I(h-1,y)end}end
def E(d,o,w,z)l=d[0];h=d[2];a=z-h-2;b=o+l+1;c=a-w-1;e=b+w+1;f=o+w;r=l+f+4;C(z-1,o,l,0,1);C(a,o,l,0,1);C(c,f+1,l,0,1);C(o,a,h,1,1,o>0);C(b,a,h,1,1);C(e,c,h,1,1);C(f+1,c,w,1,0,o>0);C(e,c,w,1,0);C(e,$u,w,1,0);r;end
w=f[0][1]
n=f.size
z=f.map{|d|d[2]}.max+3+w
$u=z-2-w
x=Array;$s=x.new(z){x.new(f.map{|d|d[0]}.sum+n*w+n*4-1){" "}};o=0
f.each{|d|o=E d,o,w,z}
puts $s.map{|y|y.join()}end
