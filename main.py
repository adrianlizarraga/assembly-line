import json
import click

def pr(screen, Ht, Lt):
    for y in range(Ht):
        for x in range(Lt):
            print(screen[y][x], end="")
        print()

def drawBox(screen, Ht, Lt, d, offset, last):
    l=d[0]
    w=d[1]
    h=d[2]
    ym = Ht-1-h-1
    xm = offset+l+2
    for y in range(ym, Ht):
        for x in range(offset, xm):
            if y == ym:
                c = '+' if x == offset or x == xm - 1 else '-'
            elif y == Ht - 1:
                c = '+' if x == offset or x == xm - 1 else '-'
            else:
                c = '|' if x == offset or x == xm - 1 else ' '

            screen[y][x] = c
    yt = ym - w - 1
    xt = xm + w + 1
    u = yt+h+1
    for y in range(yt, ym):
        xs = offset + w + 1 - (y - yt)
        xf = xs + l + 1
        for x in range(xs, xf+1):
            if y == yt:
                c = '+' if x == xs or x == xf else '-'
            else:
                c = '/' if x == xs or x == xf else ' '
            screen[y][x] = c
        for x in range(offset, xs):
            if y>=u and offset>0:
                screen[y][x]='_'
    for y in range(yt+1, yt+1+h):
        screen[y][xt-1] = '|'
    for y in range(yt+h+1, Ht):
        xs = xm - 1 + w + 1 - (y - (yt + h + 1))
        xf = xs + 1 + (y - (yt + h + 1))
        xlimit = min(xf+1, Lt)
        for x in range(xs, xlimit):
            if y == yt+h+1:
                c = '+' if x == xs else ('_' if not last else ' ')
            else:
                if y == Ht-1 and x==xs:
                    continue
                c = '/' if x == xs else ('_' if not last else ' ')
            screen[y][x] = c
    return l + w + 4 + offset
@click.command()
@click.option('--dims')
def main(dims):
    ds = json.loads(dims)
    w = ds[0][1]
    n = len(ds)
    Lt = sum([d[0] for d in ds]) + n*w + n*4 - 1
    Ht = max([d[2] for d in ds]) + 2 + w + 1

    print(w)
    print(n)
    print(Lt)
    print(Ht)
    screen = [[' ' for x in range(Lt)] for y in range(Ht)]
    offset = 0
    for i,d in enumerate(ds):
        offset = drawBox(screen, Ht, Lt, d, offset, i == n-1)
    pr(screen, Ht, Lt)

if __name__ == '__main__':
    main()
