require 'rubygems'
require 'json'

def pr(s)s.each {|y|y.each{|x|putc x};putc"\n"}end
def draw(s, ht, lt, d, o, last)
  l=d[0];w=d[1];h=d[2];ym=ht-1-h-1;xm=o+l+2;yt=ym-w-1;xt=xm+w+1;
  (ym..ht-1).each do |y|
    (o..xm-1).each do |x|
      if y===ym||y===ht-1 then c1="+";c2="-"else c1="|";c2=" "end
      s[y][x]=x===o || x===xm-1 ? c1 : c2
    end
  end
  (yt..ym-1).each do |y|
    xs=o+w+1-y+yt;xf=xs+l+1;
    (xs..xf).each do |x|
      if y===yt then c1="+";c2="-"else c1="/";c2=" "end
      s[y][x]=x===xs||x===xf ? c1:c2
    end
  end
  (yt+1..yt+h).each do |y|s[y][xt-1]="|"end
  (yt+h+1..ht-1).each do |y|
    xs=xm+w-y+yt+h+1;xf=xs+y-yt-h;xl=[xf+1,lt].min;
    (xs..xl-1).each do |x|
      c1=y===yt+h+1 ? "+":"/";c2=last ? " ":"_";
      if !(y==ht-1&&x==xs)
        s[y][x]=x==xs ? c1:c2
      end
    end
  end
  return l+w+4+o
end
ds = JSON.parse(ARGV[0])
w = ds[0][1]
n = ds.length
Lt = ds.map{|d| d[0]}.sum + n*w + n*4 - 1
Ht = ds.map{|d| d[2]}.max + 2 + w + 1
screen = Array.new(Ht){Array.new(Lt){" "}}
offset = 0
ds.each_with_index{|d,i| offset = draw screen, Ht, Lt, d, offset, i === n - 1}
pr screen
