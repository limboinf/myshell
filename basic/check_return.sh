#!/bin/bash
#return n 指定值退出，如果没有n则返回状态是函数体中执行的最后一个命令的退出状态
function func(){
    return 1
}

#调用函数
func
#查看之前函数的返回值
echo $?
