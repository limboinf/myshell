#!/bin/bash
# curl 命令分析请求的耗时情况
# curl-format.txt 定义内置变量，变量说明如下：
#
#   time_namelookup：DNS 域名解析的时候，就是把 https://zhihu.com 转换成 ip 地址的过程
#   time_connect：TCP 连接建立的时间，就是三次握手的时间
#   time_appconnect：SSL/SSH 等上层协议建立连接的时间，比如 connect/handshake 的时间
#   time_redirect：从开始到最后一个请求事务的时间
#   time_pretransfer：从请求开始到响应开始传输的时间
#   time_starttransfer：从请求开始到第一个字节将要传输的时间
#   size_download:  下载字节
#   time_total：这次请求花费的全部时间

CURL_FORMAT="$(dirname $0)/curl-format.txt" 
[ ! -z $1 ] && curl -w "@$CURL_FORMAT" -o /dev/null -s -L "$1" || echo "Usage $basename $0 <url>"

