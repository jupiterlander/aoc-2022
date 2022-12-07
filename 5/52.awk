function move(quantity, from, to) {
        crate=substr(piles[from], 1, quantity)

        piles[to] = crate piles[to]
        piles[from] = substr(piles[from], quantity + 1)
}

BEGIN {

}
/\[/{
    for (i=0; i<9; i++) {
        crate=substr($0, (i * 4) + 2, 1)
        if (crate != " ") {
            piles[i+1]=piles[i+1] crate
        }
    }
}
/move/{
    move($2, $4, $6)
}
END {
    print "result:"
    for (pile in piles) {
        print piles[pile]
    }

    for (pile in piles) {
        result=result substr(piles[pile], 1, 1)
    }

    print "*************"
    print result
}