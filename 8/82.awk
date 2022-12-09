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
    top_scenic_score=0
    for (i=2; i<NR; i++) {
        for (j=2; j<cols; j++) {
            scenic_score=1
            for(k=j-1; k>0; k--) {
                if (trees[i][k] >= trees[i][j] || k==1) {
                    scenic_score*=(j-k)
                    break
                }

            }

             for(k=j+1; k<=cols; k++) {
                if (trees[i][k] >= trees[i][j] || k==cols) {
                    scenic_score*=(k-j)
                    break
                }
            }

             for(k=i-1; k>=1; k--) {
                if (trees[k][j] >= trees[i][j] || k==1) {
                    scenic_score*=(i-k)
                    break
                }
            }

             for(k=i+1; k<=NR; k++) {
                if (trees[k][j] >= trees[i][j] || k==NR) {
                    scenic_score*=(k-i)
                    break
                }
            }

            top_scenic_score=scenic_score>top_scenic_score? scenic_score: top_scenic_score
        }
    }

    print NR, " X ", cols
    print "top_scenic_score: ", top_scenic_score 
}
