function calc_pos(pos, step, x ,y, tmp) {
    split(pos, tmp)
    x=tmp[1]
    y=tmp[2]
    
    split(step, tmp)
    x+=tmp[1]
    y+=tmp[2]

    #print "-   " x " " y, tmp[1], tmp[2]
    return x " " y
}


function follow(p1, p2, front, next_knot, tmp, x_step, y_step) {
    split(p1, front)
    split(p2, next_knot)

    if ((front[1] == next_knot[1]) || (front[2] == next_knot[2])) {
        return calc_pos(p2, directions[$1])
    } else {
        x_step=((front[1]-next_knot[1] > 0)? 1: -1)
        y_step=((front[2]-next_knot[2] > 0)? 1: -1)
        tmp=x_step " " y_step
        return calc_pos(p2, tmp)
    }

}



function touches(pos, next_pos, head, tail) {
    split(pos, head)
    split(next_pos, tail)
    
    #print "touches: ", ((abs(head[1]-tail[1]) <= 1) && (abs(head[2]-tail[2]) <= 1)) 

    return ((abs(head[1]-tail[1]) <= 1) && (abs(head[2]-tail[2]) <= 1))
}

function abs(val) {
    return (val<0? -val: val)
}

function print_matrix(x,y,i,j, rope_positions, tmp) {
    split("H12345678T", marker, "");
    for (tmp in rope) {
        rope_positions[rope[tmp]]=tmp
        #print tmp
    }
      

    for(i=y;i>0;i--) {
        row=""
        for (j=1;j<=x;j++) {
            idx=j " " i
            
            if(idx in rope_positions) {
                row=row marker[rope_positions[idx]]
            } else {
                row= row "."
            }
        }
        print row
    }
}

BEGIN {
    start_pos="20 20"
    tail_visited[start_pos]=1
    
    directions["R"]="1 0"
    directions["L"]="-1 0"
    directions["U"]="0 1"
    directions["D"]="0 -1"
    
    # setup rope array
    for (i=1;i<11; i++)
        rope[i]=start_pos
}
{
    for(i=0; i<$2; i++) {
        rope[1]=calc_pos(rope[1], directions[$1])

        # if (!touches(rope[2], rope[1]) {
        #     for (j=2; j<10; j++)
        #         rope[j]=calc_pos(rope[j], directions[$1])
        # } 
        
        for (j=2; j<10; j++) {
            #print "rope ", j-1, ":", rope[j-1], ", ", j, " : ", rope[j]
            if (!touches(rope[j-1], rope[j])) {
                rope[j]=follow(rope[j-1], rope[j])
                #rope[j]=calc_pos(rope[j], directions[$1])
                #print "moved knot ", j, tmp, rope[j] 
            } else {
                break
            }

           
        }

        tail_visited[rope[10]]=1
        #tail_pos=touches()? tail_pos: last_head_pos 
        #tail_visited[tail_pos]=1

        #print rope[1], rope[10]
        #print_matrix()
        print $0
        print_matrix(40,40)
    }
    print "\n*******************************"
    
    print "\n*******************************"
}
END {
    print length(tail_visited)
}

# function diagonal_position(head, tail) {
#     split(head_pos, head)
#     split(tail_pos, tail)

#     return (head[1]==tail[1] || head[2]==tail[2])
# }