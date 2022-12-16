function takestep(from,  step,  pos,  p) {

    for(step in steps) {
        

        pos=calc_postition(from, steps[step])

        #print step " from : ", from, " ",  "to: ", pos

        if (!valid(pos, from)){
            continue
        }

        if(!set_steps(pos, from)) {
            continue
        }

        if (inlocation(pos)) {
            split(pos, p)
            print "inlocation :" stepmap[p[1]][p[2]]
            return 1
        }

        takestep(pos)
    }
    return 1
}


function set_steps(pos, from, p, f) {
    split(from, f)
    split(pos, p)

    #print  stepmap[f[1]][f[2]],  stepmap[p[1]][p[2]]

    #  if (heightmap[p[2]][p[1]] == "a" ) {
    #     if (stepmap[p[1]][p[2]] > stepmap[f[1]][f[2]] + 1)
    #         stepmap[p[1]][p[2]]
    # }

    if (stepmap[p[1]][p[2]]) {
        if (stepmap[p[1]][p[2]] <= stepmap[f[1]][f[2]] + 1)
            return 0
    }

    stepmap[p[1]][p[2]] = stepmap[f[1]][f[2]] + 1
    return 1
}

function calc_postition(from, step,  fr,  st) {
    split(from, fr)
    split(step, st)
    return (fr[1] + st[1]) " " (fr[2] + st[2])
}

function valid(pos, from,  po,  fr) {
    split(pos, po)
    if (!(po[2] in heightmap && po[1] in heightmap[po[2]]))
        return 0

    split(from, fr)
     if ((index(levels, heightmap[po[2]][po[1]]) - index(levels, heightmap[fr[2]][fr[1]])) > 1)
        return 0

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
    levels="abcdefghijklmnopqrstuvwxyz"
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
    split(start, tmp)
    
    stepmap[tmp[2]][tmp[1]]=0

    pos_str=takestep(start)
    # print location, pos_str, found, length(paths)
    print "******************"
    split(location, tmp)
    print "* ", stepmap[tmp[1]][tmp[2]]
    print "******************"


    # for ( y=1; y<=NR; y++ ) {
    #     for (x=1; x<=length(row); x++) {
    #         str = str 
    #     }
    # }


    # print "total paths: ", length(paths)


    # split(paths[1018]["path"], tmp, ", ")
    # print "1018", length(tmp), tmp[length(tmp)]
    # print paths[1018]["path"]
    # delete tmp
    # split(paths[1006]["path"], tmp, ", ")
    # print "1006", length(tmp), tmp[length(tmp)]
    # delete tmp

    # for (path_idx in paths) {
    #     delete tmp
    #     split(paths[path_idx]["path"], tmp, ", ")
    #     # print " * ", path_idx, ": ", paths[path_idx]["path"]
        
    #     # print tmp[length(tmp)]
    #     if (tmp[length(tmp)] == location) {
    #         # print length(paths[path_idx])
    #         str=""
    #         for (step_idx in tmp) {
    #             split(tmp[step_idx], coord)
    #             str = str "->" heightmap[coord[2]][coord[1]]
    #         }
    #         print (length(tmp)-1) " : " str
    #         # for (step_idx in paths[path_idx]) 
    #         #     print "   ", paths[path_idx][step_idx]
    #     }

        
    # }

}

# 4199 too high
# 4195 too high
# 499 too high
# 498 too high