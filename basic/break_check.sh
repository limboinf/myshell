#!/bin/bash
#break n 代表跳出n层循环，如果n比当前循环层数大则跳出全部循环
for I in A B C D
do
    echo -n "$I:"
    for J in `seq 10`
    do
        if [ $J -eq 5 ]; then
            break
            #break 2
        fi
        echo -n "$J"
    done
echo
done
echo
