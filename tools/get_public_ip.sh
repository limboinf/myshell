#!/bin/bash
#对于我们电脑上的ip，通常用`ifconfig`命令，但是该命令一般显示的内网IP,如果是linux服务器则显示有外网IP
#但是对于个人电脑，可以通过http://www.ip138.com/查自己的外网IP，也可以写个小脚本

wget http://members.3322.org/dyndns/getip;
cat getip;

