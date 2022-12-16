function test(monkey, item,  id) {
    id=((item % monkey["divisible"] == 0)? monkey["true"]: monkey["false"])
    monkeys[id]["items"] = monkeys[id]["items"] " " item
}

function scaledown(item) {
    return (item % 9699690)
}

function operation(monkey, item,  value) {
    value = ((monkey["value"] == "old")? item: monkey["value"])
    switch (monkey["operator"]) {
            case "+":
                item = item + value
                break;
            case "*":
                item = item * value
                break;
        }

    return item
}

BEGIN {
    id=-1
    #PREC=256
}

/^Monkey/ {
    id++
}

/^\s*Starting/ {
    gsub(/Starting items:/, "")
    gsub(/,/, "")
    monkeys[id]["items"]=$0
    split(monkeys[id]["items"], tmp, " ")
}

/^\s*Operation/ {
    monkeys[id]["operator"]=$5
    monkeys[id]["value"]=$6
}

/^\s*Test/ {
    monkeys[id]["divisible"]=$4
}

/^\s*If true/ {
    monkeys[id]["true"]=$6
}

/^\s*If false/ {
    monkeys[id]["false"]=$6
}

END {
    # rounds
    for (round=0; round<10000; round++) {
        for (id in monkeys) {
            split(monkeys[id]["items"], items, " ")
            for (item_idx in items) {
                monkeys[id]["inspect"]++
                
                item=operation(monkeys[id], items[item_idx])
                print "operation on " id, item
                test(monkeys[id], scaledown(item))
            }
            monkeys[id]["items"]=""
        }
    }

    # arrange inspections
    for (id in monkeys) {
        active[monkeys[id]["inspect"]]=1
        print id, ":", "(" monkeys[id]["inspect"]")", monkeys[id]["items"]
    }
        

    # find two highest and multiply
    i=0
    total=1
    for (count in active) {
        i++
        if (i>length(active)-2) {
            print total, count
            total*=count
        }
            
    }
    print "Answer: "  total, PREC
}

# 24398303913 low
# 25272014865 low 