function calc_pos(pos, step, x ,y, tmp) {
    split(pos, tmp)
    x=tmp[1]
    y=tmp[2]
    
    split(step, tmp)
    x+=tmp[1]
    y+=tmp[2]

    #print x " " y, tmp[1], tmp[2]
    return x " " y
}

function diagonal_position(head, tail) {
    split(head_pos, head)
    split(tail_pos, tail)

    return (head[1]==tail[1] || head[2]==tail[2])
}

function touches(head, tail) {
    split(head_pos, head)
    split(tail_pos, tail)
    
    #print "touches: ", ((abs(head[1]-tail[1]) <= 1) && (abs(head[2]-tail[2]) <= 1)) 

    return ((abs(head[1]-tail[1]) <= 1) && (abs(head[2]-tail[2]) <= 1))
}

function abs(val) {
    return (val<0? -val: val)
}

function print_matrix(i,j) {
    for(i=8;i>0;i--) {
        row=""
        for (j=1;j<=8;j++) {
            idx=j " " i
            
            if(idx in tail_visited) {
                row=row "*"
            } else {
                row= row "."
            }
        }
        #print row
    }
}

BEGIN {
    head_pos="1 1"
    tail_pos=head_pos
    tail_visited[tail_pos]=1
    directions["R"]="1 0"
    directions["L"]="-1 0"
    directions["U"]="0 1"
    directions["D"]="0 -1"
    #print "head   tail"
}
{
    for(i=0; i<$2; i++) {
        last_head_pos=head_pos
        head_pos=calc_pos(head_pos, directions[$1])

        tail_pos=touches()? tail_pos: last_head_pos 
        tail_visited[tail_pos]=1

        #print head_pos, tail_pos
        #print_matrix()
    }
}
END {
    print length(tail_visited)
}

