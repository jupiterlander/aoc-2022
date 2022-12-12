function test(monkey, item,  id) {
    id=((item % monkey["divisible"] == 0)? monkey["true"]: monkey["false"])
    monkeys[id]["items"] = monkeys[id]["items"] " " item
}

function operation(monkey, item,  value) {
    value = ((monkey["value"] == "old")? item: monkey["value"])
    switch (monkey["operator"]) {
            case "+":
                item =  (item + value)
                break;
            case "*":
                item = (item * value)
                break;
        }

    return item
}

BEGIN {
    id=-1
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

    for (round=0; round<20; round++) {
        for (id in monkeys) {
            split(monkeys[id]["items"], items, " ")
            for (item_idx in items) {
                monkeys[id]["inspect"]++
                # print "operation on " id, items[item_idx]
                item=operation(monkeys[id], items[item_idx])
                item=int(item/3)
                test(monkeys[id], item)
            }
            monkeys[id]["items"]=""
        }
    }

    for (id in monkeys) {
        active[monkeys[id]["inspect"]]=1
        print id, ":", "(" monkeys[id]["inspect"]")", monkeys[id]["items"]
    }
        

    i=0
    total=1
    for (count in active) {
        i++
        if (i>length(active)-2)
            total*=count
    }
    print "Answer: "  total
}