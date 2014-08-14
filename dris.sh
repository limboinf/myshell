#!/bin/bash
#shell 版本99乘法口诀
for((i=1;i<10;i++))
   do
        for((j=1;j<=i;j++))
        do
        echo -n $j*$i=$(($i*$j)) " "
          if [ $j -eq $i ];then
            echo
          fi
        done
done