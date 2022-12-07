function order(sum){
   if (sum > top) {
            third=second
            second=top
            top=sum
        } else if (sum > second ) {
            third=second
            second=sum
        } else if (sum > third) {
            third=sum
        }
}

BEGIN { 
    top=0
    second=0
    third=0
    sum=0
}
{
    print $0
    if ($0 == "") {
        order(sum)
        sum=0
    } else {
            sum+=$1
    }
}
END {
    order(sum)
    print top, second ,third
    print top + second + third
}