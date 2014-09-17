#!/bin/bash
#scale设定小数精度
echo "scale=2; 8/3"|bc  #2.66

#obase转换二进制
n=100
echo "obase=2; $n"|bc   #1100100
n=1010
echo "obase=10;ibase=2; $n"|bc   #10

#平方及平方根
echo "sqrt(100)"|bc   #10
echo "10^2"|bc        #100

