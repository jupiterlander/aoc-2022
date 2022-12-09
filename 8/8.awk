BEGIN {
}
NR==1 {
    cols=length()
}
{
    split($0, arr, "")

    for(idx in arr) {
        trees[NR][idx] = arr[idx]
    }
}
END {
    count=0 
    for (i=2; i<NR; i++) {
        for (j=2; j<cols; j++) {
            visible=0
            for (k=1; k<=cols; k++) {
                 if (trees[i][k] >= trees[i][j]) {
                    if (k>j) {
                        break
                    } else if (k<j) {
                        k=j
                        continue
                    }
                }

                if (k==j || k==cols){
                    count++
                    visible=1
                    break
                }
            }

            if (!visible) {
                for (k=1; k<=NR; k++) {
                    if (trees[k][j] >= trees[i][j]) {
                        if (k>i) {
                            break
                        } else if (k<i) {
                            k=i
                            continue
                        }
                    }

                    if (k==i || k==NR){
                        count++
                    }

                }
            }
        }
    }


    print NR, " X ", cols
    print "visible: " NR+NR+cols+cols-4, " + ", count, " = " NR+NR+cols+cols-4+count 
}
