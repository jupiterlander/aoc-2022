function overlaps(low_1, high_1, low_2, high_2) {
    if (low_1 >= low_2 && low_1 <= high_2) {
        return 1
    }
    
    if (high_1 <= high_2 && high_1 >= low_2) {
        return 1
    }

    if (low_2 >= low_1 && low_2 <= high_1) {
        return 1
    }
    
    if (high_2 <= high_1 && high_2 >= low_1) {
        return 1
    }

    return 0
}


BEGIN {
    FS=","
    count=0
}
{
    split($1, arr_1, "-")
    split($2, arr_2, "-")
    # print arr_1[1], arr_1[2], arr_2[1], arr_2[2], overlaps(arr_1[1], arr_1[2], arr_2[1], arr_2[2])
    count+=overlaps(arr_1[1], arr_1[2], arr_2[1], arr_2[2])
}
END {
    print count
}