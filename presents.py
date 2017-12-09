from sys import argv as v
from json import loads as l
o=[]
for r in l(v[2]):
    o+=[i for i in l(v[1]) if i>=r[0] and i<=r[1]]
print(o)
