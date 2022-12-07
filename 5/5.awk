function move(quantity, from, to) {
    for (i=1; i<=quantity; i++) {
        tmp=substr(piles[from], 1, 1)
        print "crate" tmp 
        piles[to] = tmp piles[to]
        piles[from] = substr(piles[from], 2)

        print "move"
        print piles[to]
        print piles[from]
    }
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
    print "****"
    print piles[1]
    print piles[2]
    print piles[3]
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