BEGIN {
    cycles=0
    x=1
    instruction["noop"]=1
    instruction["addx"]=2
    signal_strength=0
    total_signal_strength=0
}
{
    for (i=0;i<instruction[$1]; i++) {
        cycles++

        if ((cycles == 20) || (cycles + 20) % 40 == 0) {
            signal_strength=(x * cycles)
            total_signal_strength+=signal_strength
            print "*", cycles, $0, x, signal_strength
        }
        else {
            print cycles, " ", $0, x
        }
        
    }
    
    if ($1 == "addx")
        x+=$2
}
END {
    print NR
    print cycles
    print total_signal_strength
}
