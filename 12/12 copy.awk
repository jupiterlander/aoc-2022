function takestep(from, last_pos, node, step , val, tmp1, tmp2) {
    print counter++
    print "take step from : " from, "- ", last_pos
    prev = node

    for(step in steps) {
        node++
        pos=calc_postition(from, steps[step])


        print node , step, " try:" from " -> " pos " : " (valid(pos, from, last_pos)? "valid": "not") paths[prev]["path"]
        if (!valid(pos, from, last_pos, prev)){
            continue
        }

        paths[node]["prev"]=prev
        paths[node]["path"] = paths[prev]["path"] ", " pos

        if (inlocation(pos)) {
            print "inloc", node
            return from " " pos
        }
        #print pos, from
        # paths[count] = paths[count-1] "," takestep(pos, from)
        #paths[node] = takestep(pos, from, node)
        
        takestep(pos, from, node)
        
        # val = val ", " takestep(pos, from, node)

        #return takestep(pos, from, node)
        #print from, pos, last_pos
        #paths[count][length(paths[count])+1]=pos


        # paths[count] = paths[count] "," pos
        #print node, paths[node]
        
        #takestep(pos, from)
    #       if (found){
    #     return 1
    # }


    
    #print paths[count]
    # if(takestep(pos, from))
    #     return 1
    # }
    # return 0
    }
    print "dead end" from
    
    return from " " pos
}

function calc_postition(from, step) {
    split(from, fr)
    split(step, st)
    return (fr[1] + st[1]) " " (fr[2] + st[2])
}

function valid(pos, from, last, node,  po,  fr, la) {
    # print "pos: ", pos, "path: ", paths[node]
    if(pos == last)
        return 0
    
    split(pos, po)
    if (!(po[2] in heightmap && po[1] in heightmap[po[2]]))
        return 0

    split(from, fr)
     if ((index(levels, heightmap[po[2]][po[1]]) - index(levels, heightmap[fr[2]][fr[1]])) > 1)
        return 0
    
    
    if (index(paths[node]["path"], pos)) {
        print "pos: ", pos, "path: ", paths[node]["path"]
        return 0
    }
        

    return 1
}

function inlocation(pos) {
    return (pos == location)
}



function reverse(pos) {
    split(pos, tmp)
    return tmp[2] " " tmp[1]
}

BEGIN {
    levels="Sabcdefghijklmnopqrstuvwxyz"
    steps["U"]="0 1"
    steps["D"]="0 -1"
    steps["R"]="1 0"
    steps["L"]="-1 0"
}
{
    split($0, row, "")
    for (idx in row)
        heightmap[NR][idx]=row[idx]

}
END {
    x_max=length(row)
    y_max=length(heightmap)
    count=0
    found=0


    for (y in heightmap) {
        str=""
        for (x in heightmap[y]) {
            str = str heightmap[y][x]
            if (heightmap[y][x] == "E")
                location=(x " " y)
        }
    print str
    }

    

    do {
        print location
        pos_str=takestep("1 1", "0 0")
        print location, pos_str, found, length(paths)
        print "DDDDDDDDDDDDDDDDDD"
        break
        # split(pos_str, pos_arr, ",")
        # for (pos_idx in pos_arr) {
        #     split(pos_arr[pos_idx], coords)
        #     x=coords[1]
        #     y=coords[2]
        #     path_str=path_str heightmap[y][x]
        # }
        # print path_str
        # count++
    } while (pose_str != location)

    for (path_idx in paths) {
        split(paths[path_idx]["path"], tmp, ",")
        print " * ", path_idx, ",", length(tmp), ",", tmp[length(tmp)]
        # if (tmp[length(tmp)] == location) {
        #     print paths[path_idx]
        #     print length(paths[path_idx])
        # }
            
        # for (step_idx in paths[path_idx]) 
        # print "   ", paths[path_idx][step_idx]
    }

}