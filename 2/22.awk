function calc(oppo_shape, my_shape){
    oppo_score+=values[oppo_shape]
    my_score+=values[my_shape]

         switch (oppo_shape) {
            case "Rock":
                if ( my_shape == "Rock" ) {
                    oppo_score+=draw
                    my_score+=draw
                } else if ( my_shape == "Paper" ) {
                    oppo_score+=lost
                    my_score+=win
                } else if ( my_shape == "Scissors" ) {
                    oppo_score+=win
                    my_score+=lost
                }
                break
            case "Paper":
                if ( my_shape == "Rock" ) {
                    oppo_score+=win
                    my_score+=lost
                } else if ( my_shape == "Paper" ) {
                    oppo_score+=draw
                    my_score+=draw
                } else if ( my_shape == "Scissors" ) {
                    oppo_score+=lost
                    my_score+=win
                }
                break
            case "Scissors":
                if ( my_shape == "Rock" ) {
                    oppo_score+=lost
                    my_score+=win
                } else if ( my_shape == "Paper" ) {
                    oppo_score+=win
                    my_score+=lost
                } else if ( my_shape == "Scissors" ) {
                    oppo_score+=draw
                    my_score+=draw
                }
                break
        }
}

function strategy(strat, oppo_shape) {
    if ( strat == "X" ) {
        return lose_strategy[shape[oppo_shape]]
    } else if ( strat == "Y" ) {
        return shape[oppo_shape]
    } else if ( strat == "Z" ) {
        return win_strategy[shape[oppo_shape]]
    } 
}


BEGIN { 
    oppo_score=0
    my_score=0

    # A="Rock"
    # B="Paper"
    # C="Scissors"

    shape["A"]=A="Rock"
    shape["B"]=B="Paper"
    shape["C"]=C="Scissors"


    values[A]=1 # rock
    values[B]=2 # paper
    values[C]=3 # scissors

    win_strategy["Rock"]="Paper"
    win_strategy["Paper"]="Scissors"
    win_strategy["Scissors"]="Rock"

    lose_strategy["Rock"]="Scissors"
    lose_strategy["Paper"]="Rock"
    lose_strategy["Scissors"]="Paper"

    win=6
    draw=3
    lost=0
}
{
    strategy_shape=strategy($2, $1)
    calc(shape[$1], strategy_shape)

    print shape[$1], " vs ", strategy_shape, "     ", oppo_score, " : ", my_score
}
END {
    print oppo_score, " : ", my_score
}



