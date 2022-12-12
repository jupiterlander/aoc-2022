BEGIN {
    cycles=0
    x=1
    instruction["noop"]=1
    instruction["addx"]=2
    row=0
    col=0
}
{
    for (i=0;i<instruction[$1]; i++) {
        cycles++
        col=(cycles % 40)-1

        if (col==0) {
            row++
        }

        marker=((x>=col-1 && x<=col+1)? "#": ".")
        crt[row][col]=marker
    }

    if ($1 == "addx")
        x+=$2
}
END {
    print cycles, col, row
    print length(crt), "X", length(crt[1])
    print
    for (i=0; i<7; i++) {
        str=""
        for (j=0; j<40; j++) {
            str=str crt[i][j]
        }
        print str
    }
}
