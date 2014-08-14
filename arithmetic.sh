#!/bin/bash
#可利用let, (())), []执行基本的算术操作,expr,bc执行高级的算术运算
#------------------let------------------
#使用let 变量无需在添加$前缀
a=4;
b=5;
let result=a+b
echo $result
let a++
echo $a
let a--
echo $a
let a+=100
echo $a
#
#
r=$[a+b]
r1=$[$a+100]
#echo $r1
r2=$((a+b))
#echo $r2
r3=`expr 4 + 100`  # 格式要留有空格
echo $r3
r4=$(expr $a + 1)
echo $r4
echo "100*0.256"| bc

