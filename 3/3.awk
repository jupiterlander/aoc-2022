BEGIN {
    az="abcdefghijklmnopqrstuvwxyz"
    aZ=az toupper(az)
    #split(az toupper(az), aZ_arr, "")
    sum=0
    print aZ

    print match("AZ", "Z")
}
{
    delete tmp
    delete arr_1
    delete found

    comp_1=substr($0, 1, length($0)/2)
    comp_2=substr($0, length($0)/2 + 1)
    print comp_1, comp_2

    split(comp_1, tmp, ""); for (i in tmp) { arr_1[tmp[i]]}

    for (char in arr_1) print char

    for (char in arr_1) {
        if (!found[char] && match(comp_2, char)) {
            found[char]=1
            sum+=match(aZ, char)
            print char, match(aZ, char), match(comp_2, char)
        }
    }
}
END {

   print sum

}