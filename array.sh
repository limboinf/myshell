#!/bin/bash 
declare -A values
values=([name]='beginman' [age]=23 [like]='coding')
echo ${values[*]}
echo "My name is ${values[name]}, i am ${values[age]} years old and like ${values[like]}"

#获取索引列表, 只能对于关联数组
echo ${!values[*]} 
echo ${!values[@]}

