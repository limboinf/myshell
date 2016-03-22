#!/usr/bin/env bash
#rq自定义服务， Usage: rq_handle start|stop|info|empty|status
#rq原始命令， rq, rq command, rq command --help
#注意：项目中rq的所有操作都在redis 1库中
#ref:http://python-rq.org/docs/monitoring/

REDIS_DB=1
REDIS_PASS='2015yunlianxiQAZWSX'
REDIS_PORT='6379'
REDIS_HOST='localhost'
REDIS_URL='redis://:'${REDIS_PASS}'@'${REDIS_HOST}':'${REDIS_PORT}'/'${REDIS_DB}
RQ_PROJECT_PATH=${HOME}/project/ylx/jobs
RQ_SETTING='rq_settings'

function info()
{
    # equal rq info
    rq info -u ${REDIS_URL} -R
}

function start()
{
    # run rq worker
    # http://python-rq.org/docs/workers/
    cd ${RQ_PROJECT_PATH}
    process=`ps aux | grep "rq worker" | grep -v grep`;
    echo $process
    if [ ! -n "$process" ]; then
        echo "正在启动rq服务......."
        nohup rq worker -c ${RQ_SETTING} alarm > rq_out.file 2>&1 &
        echo -e "\033[32m 启动成功! \033[0m"

    else
        echo "rq服务已经启动"
        echo "------------------------------------"
        info;
    fi

}

function stop()
{
    process=`ps -ef | grep "rq worker" | grep -v grep`
    processID=`ps -ef | grep "rq worker" | grep -v grep|cut -c 6-15`;
    if [ "$process" != "" ]; then
        echo "进程ID："${processID}"是否要杀掉该进程？y/n"
        read ANS_RQ
        if [ "${ANS_RQ}" == "y" ]; then
            kill -9 ${processID}
            echo "服务停止"
        fi
    else
        echo "已经停止了.."
    fi
}

function status()
{
    process=`ps -ef | grep "rq worker" | grep -v grep`
    processID=`ps -ef | grep "rq worker" | grep -v grep|cut -c 6-15`;
    if [ "$process" != "" ]; then
        echo -e "\033[32m Running: 进程ID：\033[0m"${processID}
    else
        echo -e "\033[35m Stoped! \033[0m"
    fi
}

function empty()
{
    rq empty -u ${REDIS_URL}
}

case $1 in
    info)   info;;
    start)  start;;
    empty)  empty;;
    stop)   stop;;
    status) status;;
    ''|' ')
        echo 'Usage: rq_handle start|stop|info|empty|status';;
esac
