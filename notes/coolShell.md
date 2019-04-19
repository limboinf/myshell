从kafka-server-start.sh可以学到，如果参数小于多少则输出Usage

```bash
if [ $# -lt 1 ];
then
  echo "USAGE: $0 server.properties"
  exit 1
fi
```

base dir

```bash
base_dir=$(dirname $0)
```

检查环境变量是否存在或有值

```bash
if [ "x$KAFKA_LOG4J_OPTS" = "x" ]; then
    export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:$base_dir/../config/log4j.properties"
fi
```

参数switch 操作

```shell
#!/bin/bash

if [ $# -lt 1 ];
then
  echo "Usage: $0 [-daemon] server.yml"
  exit 1
fi

if [ "x$MY_ENV_NAME" = "x" ];then
  echo "该环境变量不存在"
fi

# 参数case操作
COMMAND=$1
case $COMMAND in
  -daemon)
    echo "daemon"
    shift
    ;;
  *)
    ;;
esac
```

批量启动

常用集群操作，如批量启动kafka各个节点，可以这样做：

```shell
#!/bin/bash

# 启动kafka集群

brokers="server-1 server-2 server-3"
KAFKA_HOME=" /usr/local/software/kafka/kafka_2.11-0.10.1.1"

echo "INFO: 启动kafka集群:$brokers"

for broker in $brokers
do
  echo "INFO:Start kafka on ${broker} ..."
  # ssh $broker -C "source /etc/profile; sh ${KAFKA_HOME}/bin/kafka-server-start.sh -daemon ${KAFKA_HOME}/config/server.properties"
  if [ $? -eq 0 ]; then
    echo "INFO: [$broker] 启动成功!"
  else
    echo "ERROR: [$broker] 启动失败!"
  fi
done
```

关闭服务

如关闭kafka服务

```shell
# 获取kafka进程ID,注意过滤掉grep
PIDS=$(ps ax | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}')
# 判断进程ID是否存在
if [ -z "$PIDS" ]; then
  echo "No kafka server to stop"
  exit 1
else
  # -s  指定发送信号，TERM 终止信号, 可以直接kill -15 也一样
  # KILL 表示强制终止，kill -s KILL 等于 kill -9 这个我们比较熟悉
  kill -s TERM $PIDS
fi
```

