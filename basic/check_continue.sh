#!/bin/bash

for I in A B C D
do
    echo "$I:"
    for J in `seq 10`
    do
        if [ $J -eq 5 ]; then
            continue        #结束本次并进入下次执行，这里不会打印5
            #continue 2     #跳出循环
        fi
        echo -n "$J"
    done
    echo
done
echo
