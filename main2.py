import json
import click

def printScreen(screen, Ht, Lt):
    for y in range(Ht):
        for x in range(Lt):
            print(screen[y][x], end="")
        print()
def drawBox2(screen, Ht, Lt, d, offset, last):
    l=d[0]
    w=d[1]
    h=d[2]

    # Front face
    ym = Ht-h-2
    xm = offset+l+2
    yt = ym-w-1
    xt = xm+w+1
    on = l+w+4+offset

    for y in range(yt, Ht):
        for x in range(offset, on):
            if y >= ym and x < xm:
                if y == ym:
                    c = '+' if x == offset or x == xm - 1 else '-'
                elif y == Ht - 1:
                    c = '+' if x == offset or x == xm - 1 else '-'
                else:
                    c = '|' if x == offset or x == xm - 1 else ' '
                screen[y][x] = c
            if y >= yt and y < ym and x < xt:
                xs = offset + w + 1 - (y - yt)
                xf = xs + l + 1
                if y == yt:
                    if x >= xs:
                        c = '+' if x == xs or x == xf else '-'
                    else:
                        c = ' '
                else:
                    c = '/' if x == xs or x == xf else ' '
                screen[y][x] = c
            if y >= yt+1 and y < yt+1+h and x == xt-1:
                c = '|'
                screen[y][x] = c
            if y >= yt+h+1 and y < Ht:
                xs = xm+w-y+yt+h+1
                xf = xs+y-yt-h
                xlimit = min(xf+1, Lt)
                if x >= xs and x < xlimit:
                    if y == yt+h+1:
                        c = '+' if x == xs else ('_' if not last else ' ')
                    else:
                        if y == Ht-1 and x==xs:
                            continue
                        c = '/' if x == xs else ('_' if not last else ' ')
                    screen[y][x] = c

    return on
@click.command()
@click.option('--dims')
def main(dims):
    ds = json.loads(dims)
    w = ds[0][1]
    n = len(ds)
    Lt = sum([d[0] for d in ds]) + n*w + n*4 - 1
    Ht = max([d[2] for d in ds]) + 2 + w + 1

    screen = [[' ' for x in range(Lt)] for y in range(Ht)]
    offset = 0
    for i,d in enumerate(ds):
        offset = drawBox2(screen, Ht, Lt, d, offset, i == n-1)
    printScreen(screen, Ht, Lt)

if __name__ == '__main__':
    main()
