def O(f)def I(x,q)while $s[q][x]==" ";$s[q][x]="_";x-=1;end;end
def C(p,q,h,f,b=nil)a=q+h+1;(q..a).map{|y|h=f<2 ?p:p-y+q;$s[f>0 ?y:h][f>0 ?h:y]=y==q||y==a ? "+":%w(- | /)[f];if y>=$u&&b;I(h-1,y)end}end
def E(d,o,w,z)l=d[0];h=d[2];a=z-h-2;c=a-w-1;e=o+l+w+2;f=o+w;C(z-1,o,l,0);C(a,o,l,0);C(c,f+1,l,0);C(o,a,h,1,o>0);C(o+l+1,a,h,1);C(e,c,h,1);C(f+1,c,w,2,o>0);C(e,c,w,2);C(e,$u,w,2);l+f+4;end
w=f[0][1]
n=f.size
z=f.map{|d|d[2]}.max+3+w
$u=z-2-w
x=Array;$s=x.new(z){x.new(f.map{|d|d[0]}.sum+n*w+n*4){" "}};o=0
f.map{|d|o=E d,o,w,z}
puts $s.map{|y|y.join}end
