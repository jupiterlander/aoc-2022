function duplicates(marker,  j) {
    found=0

    for (char in tmp)
        delete tmp[char]
    
    for (j=1; j<=markerlen; j++) {
        char=substr(marker,j,1)

        if (tmp[char]) {
            found=1
            break
        }

        tmp[char]=char
    }
    return found
} 


BEGIN {
    marker=""
    markerlen=14
}
{
    for (i=1; i<=length()-markerlen+1; i++) {
        marker=substr($0,i, markerlen)
        if (!duplicates(marker)) {
            next
        }
    }

}
END {
    print substr($0,i, markerlen)
    print i+markerlen-1, marker
}