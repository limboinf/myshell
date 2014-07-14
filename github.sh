#!/bin/bash 
printf "自动推送Github开始……"
git pull origin master;
git add -A;
git ci -m "自动生成";
git push origin master;
printf "推送成功！"


