function calc_pos(pos, step, x ,y, tmp) {
    split(pos, tmp)
    x=tmp[1]
    y=tmp[2]
    
    split(step, tmp)
    x+=tmp[1]
    y+=tmp[2]

    return x " " y
}


function follow(p1, p2) {
    return calc_pos(p2, calc_dir(p1, p2))
}


function calc_dir(p1, p2, p1_arr, p2_arr, x, y) {
    split(p1, p1_arr)
    split(p2, p2_arr)

    x=(p1_arr[1] - p2_arr[1]) / abs(p1_arr[1] - p2_arr[1] == 0? 1: p1_arr[1] - p2_arr[1])
    y=(p1_arr[2] - p2_arr[2]) / abs(p1_arr[2] - p2_arr[2] == 0? 1: p1_arr[2] - p2_arr[2])

    return x " " y
}


function touches(pos, next_pos, head, tail) {
    split(pos, head)
    split(next_pos, tail)

    return ((abs(head[1]-tail[1]) <= 1) && (abs(head[2]-tail[2]) <= 1))
}

function abs(val) {
    return (val<0? -val: val)
}


function print_matrix(x,y,i,j, rope_positions, tmp) {
    split("H123456789", marker, "");
    for (tmp in rope) {
        rope_positions[rope[tmp]]=tmp
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


function print_tail_matrix(x,y,i,j, tmp, marker) {
    marker="#"

    for(i=y;i>0;i--) {
        row=""
        for (j=1;j<=x;j++) {
            idx=j " " i
            
            if(idx in tail_visited) {
                row=row marker
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

        for (j=2; j<11; j++) {
            if (!touches(rope[j-1], rope[j])) {
                rope[j]=follow(rope[j-1], rope[j])
            } else {
                break
            }
        }

        tail_visited[rope[10]]=1
    }
}
END {
    # print_tail_matrix(40,40)
    print length(tail_visited)
}
