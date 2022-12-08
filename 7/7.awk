BEGIN{
    path=""
    PROCINFO["sorted_in"]="@ind_str_asc"
}
/\$ cd/ {
    if ($3 == "..") {
        split(path, dirs, "/")
        path=""
        for (i=2; i<length(dirs)-1; i++) {
            path = path "/" dirs[i]
        }

        sep = (path == "/")? "": "/"
        path = path sep
    } else if ($3 == "/"){
        path=$3
    } else {
        path=path $3 "/"
    }
}
/^dir/ {
    filesystem[path $2 "/"]=0
}
/^[0-9]/{
    filesystem[path $2]=$1
}

END{
        sum=0
        for (path in filesystem){
              if (!match(path, /\/$/)) {
                    file = split(path, dirs, "/")
                    dirs[1]="/"

                    dir=""
                    for (i=1; i<file; i++) {
                        sep = (i>1)? "/": ""
                        dir = dir dirs[i] sep

                        filesystem[dir]+=filesystem[path]
                    }
                }
        }

        PROCINFO["sorted_in"]="@val_num_asc"
        required_space = (70000000 - filesystem["/"] - 30000000) * -1

        for (path in filesystem) {
            if (match(path, /\/$/)) {
                if (filesystem[path]<=100000) {
                    sum+=filesystem[path]
                }
            }
            if (!smallest && filesystem[path] >= required_space) {
                smallest=filesystem[path]
            }
        }

        print "part 1"
        print "sum #1  :", sum
        print "*********"
        print "part 2"
        print "total   :", 70000000
        print "required:", 30000000
        print "used    :", filesystem["/"]
        print "required:" , required_space
        print "smallest:", smallest
}
