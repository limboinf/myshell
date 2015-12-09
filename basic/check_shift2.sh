#!/bin/bash
#shift 命令对脚本的参数做偏移操作，每执行一次shift则向后偏移一位
#如：./check_shift2.sh 1 2 3 4
until [ -z "$1" ]
do
    echo "$@ "
    shift
done
