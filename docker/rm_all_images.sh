#########################################################################
# File Name: rm_all_images.sh
# Author: beginman(fangpeng)
# mail: xinxinyu2011@163.com
# Created Time: 2016-11-17 16:44:40
#########################################################################
#!/bin/bash
# 删除所有镜像

docker ps -a|awk '{print $1,$2}'|awk '{print $1}'|xargs docker rm
docker rmi `docker images -a -q`
