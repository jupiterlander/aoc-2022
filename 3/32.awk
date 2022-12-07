BEGIN {
    az="abcdefghijklmnopqrstuvwxyz"
    aZ=az toupper(az)
    sum=0
}
{
    delete tmp
    delete arr
    delete found

    group[NR % 3]=$0

    if (NR % 3 == 0) {
        split($0, tmp, ""); for (i in tmp) arr[tmp[i]]

        for (char in arr) {
            if (match(group[1], char) && match(group[2], char)) {
                sum+=match(aZ, char)
                print char, match(aZ, char)
                break
            }
        }
    }
}
END {
   print sum
}