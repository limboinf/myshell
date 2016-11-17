#########################################################################
# File Name: rm_image.sh
# Author: beginman(fangpeng)
# mail: xinxinyu2011@163.com
# Created Time: 2016-11-17 16:19:03
#########################################################################
#!/bin/bash
# 快速删除镜像和容器
function drmi_none() {
	image=$1
	echo "rm image:"$image
	if [ $image == 'none' ];then
		image="^<none>"
	fi

	for var in $(docker images | grep $image | awk '{print $3}')
	do
		echo "docker image: "$var
		docker ps -a | awk '{print $1,$2}' | grep $image | awk '{print $1}' | xargs docker rm
		docker rmi $var
	done
	echo "删除成功!"
}

if [ $# != 1 ];then
	echo "please enter to delete image."
	exit 1
else
	drmi_none $1
fi

