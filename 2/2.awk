function calc(oppo_shape, my_shape){
    oppo_score+=values[shape[oppo_shape]]
    my_score+=values[shape[my_shape]]

         switch (oppo_shape) {
            case "A":
                if ( my_shape == "X" ) {
                    oppo_score+=draw
                    my_score+=draw
                } else if ( my_shape == "Y" ) {
                    oppo_score+=lost
                    my_score+=win
                } else if ( my_shape == "Z" ) {
                    oppo_score+=win
                    my_score+=lost
                }
                break
            case "B":
                if ( my_shape == "X" ) {
                    oppo_score+=win
                    my_score+=lost
                } else if ( my_shape == "Y" ) {
                    oppo_score+=draw
                    my_score+=draw
                } else if ( my_shape == "Z" ) {
                    oppo_score+=lost
                    my_score+=win
                }
                break
            case "C":
                if ( my_shape == "X" ) {
                    oppo_score+=lost
                    my_score+=win
                } else if ( my_shape == "Y" ) {
                    oppo_score+=win
                    my_score+=lost
                } else if ( my_shape == "Z" ) {
                    oppo_score+=draw
                    my_score+=draw
                }
                break
        }
}


BEGIN { 
    oppo_score=0
    my_score=0

    X=A="Rock"
    Y=B="Paper"
    Z=C="Scissors"

    shape["A"]=shape["X"]=A
    shape["B"]=shape["Y"]=B
    shape["C"]=shape["Z"]=C


    values[A]=1 # rock
    values[B]=2 # paper
    values[C]=3 # scissors

    win=6
    draw=3
    lost=0
}
{
    calc($1, $2)

    print shape[$1], " vs ", shape[$2], "     ", oppo_score, " : ", my_score
}
END {
    print oppo_score, " : ", my_score
}



