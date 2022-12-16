function takestep(node,  from,  prev, step, pos) {
    
    from = getlast(node)
    prev = paths[node]["path"]
    #print "take step from : " from, "- " ,node

    for(step in steps) {
        #print step " in node: " node

        pos=calc_postition(from, steps[step])

        if (!valid(prev, pos, from)){
            continue
        }

        node = nextnode()

        #paths[node]["prev"]=prev
        #paths[node]["path"] = paths[prev]["path"] ", " pos
        paths[node]["path"] = prev ", " pos

        #print node, "("prev")", " : " paths[node]["path"], " - ", paths[prev]["path"]
        #print node, " : ", paths[node]["path"], " - ", prev

        if (inlocation(pos)) {
            print "inloc", node
            return 1
            continue
        }


        #print node , step, " try:" from " -> " pos " : " (valid(pos, from, last_pos)? "valid": "not") paths[prev]["path"]
       

       

       
        takestep(node)
    }
    #print "dead end", step,", ", node,", ", from,", ", pos, ", ",paths[node]["path"], ": ", prev
    #paths[node++]["path"] = start
    #print "dead end"
    delete paths[node]
    return 1
}

function nextnode() {
    counter++

    if (counter % 104729 == 00 ) 
        print counter
    return counter
}

function calc_postition(from, step) {
    split(from, fr)
    split(step, st)
    return (fr[1] + st[1]) " " (fr[2] + st[2])
}

function getlast(node, tmp) {
    split(paths[node]["path"], tmp, ",")
    return tmp[length(tmp)]
}

function valid(prev, pos, last,  po,  fr,  la) {
    # print "pos: ", pos, "path: ", paths[node]
    
    if(pos == last)
        return 0
    
    split(pos, po)
    if (!(po[2] in heightmap && po[1] in heightmap[po[2]]))
        return 0

    split(last, fr)
     if ((index(levels, heightmap[po[2]][po[1]]) - index(levels, heightmap[fr[2]][fr[1]])) > 1)
        return 0
    
    #print "valid: ", prev," - ", pos, " - ", index(prev, pos)
    if (index(prev, pos)) {
        #print "pos: ", pos, "path: ", paths[node]["path"]
        return 0
    }
        

    return 1
}

function inlocation(pos) {
    #print "loc: ", location, pos
    return (pos == location)
}



function reverse(pos) {
    split(pos, tmp)
    return tmp[2] " " tmp[1]
}

BEGIN {
    levels="Sabcdefghijklmnopqrstuvwxyz"
    steps["D"]="0 1"
    steps["U"]="0 -1"
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
    counter=0


    for (y in heightmap) {
        str=""
        for (x in heightmap[y]) {
            str = str heightmap[y][x]
            if (heightmap[y][x] == "E") { 
                location=(x " " y)
                heightmap[y][x] = "z"
            }

             if (heightmap[y][x] == "S") { 
                start=(x " " y)
                heightmap[y][x] = "a"
            }

        }
        print str
    }


    print start, location
    paths[0]["path"] = start

    pos_str=takestep(0)
    # print location, pos_str, found, length(paths)
    print "******************"

    print "total paths: ", length(paths)


    # split(paths[1018]["path"], tmp, ", ")
    # print "1018", length(tmp), tmp[length(tmp)]
    # print paths[1018]["path"]
    # delete tmp
    # split(paths[1006]["path"], tmp, ", ")
    # print "1006", length(tmp), tmp[length(tmp)]
    # delete tmp

    for (path_idx in paths) {
        delete tmp
        split(paths[path_idx]["path"], tmp, ", ")
        # print " * ", path_idx, ": ", paths[path_idx]["path"]
        
        # print tmp[length(tmp)]
        if (tmp[length(tmp)] == location) {
            # print length(paths[path_idx])
            str=""
            for (step_idx in tmp) {
                split(tmp[step_idx], coord)
                str = str "->" heightmap[coord[2]][coord[1]]
            }
            print (length(tmp)-1) " : " str
            # for (step_idx in paths[path_idx]) 
            #     print "   ", paths[path_idx][step_idx]
        }

        
    }

}

# 4199 too high
# 4195 too high