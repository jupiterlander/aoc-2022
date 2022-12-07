BEGIN{
    sum=0
    level["/"]=1
    current_dir="/"
    last_dir="/"
    current_level=0
    filesystem["/"]="/"
    path=""

}
/\$ cd/ {
    current_level+=($3 == ".."? -1: 1)

    if ($3 == "..") {
        split(path, dirs, "/")
        
        for (i=1; i<length(dirs); i++) {
            path = path dirs[i]
        }
        last_dir=current_dir
        current_dir=$3
    } else {
        path=path $3
        current_level--
    }

   
    
    print "changed dir: ", $3, current_level, "path: ", path
}
/dir/ {
    filesystem[$2][dir]=$1 
    print current_dir, current_level, $2, $1
}
/^[0-9]/{
    filesystem[current_level][$2]=$1
    print current_dir, current_level, $2, $1
}

END{
    print "************"
  
        for (lvl in filesystem){
            print lvl
            for (file in filesystem[lvl]) {
                 print filesystem[lvl][file], file
            }
        }
       

}