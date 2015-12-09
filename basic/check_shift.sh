#!/bin/bash
#位置参数，第一个参数$1,...一直到$N
#脚本本身$0
#所有参数$@,或$*
#参数个数$#

echo "script name:$0"
echo "param 1: $1"
echo "param 2: $2"
echo "param 3: $3"
echo "param all: $@"  # or $*
echo "param all count: $#"




