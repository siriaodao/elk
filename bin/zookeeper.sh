#!/bin/bash
ZK_HOME="/opt/product/zookeeper"
ZK_DATA="/opt/product/data/elk/zookeeperdata"
#脚本实现定义配置文件
#ZK_LOG="/opt/product/log"
#ZK_CONF="${ZK_HOME}/conf/zoo.cfg"
#ZK_CONF_TXT="tickTime=2000\ninitLimit=10\nsyncLimit=5\ndataDir=${ZK_DATA}\ndatalogDir=${ZK_LOG}\nclientPort=2181"
#echo -e "${ZK_CONF_TXT}" > ${ZK_CONF}
#for i in ${ZK_NODE_LIST[@]}
#do
#  echo "$i" >> ${ZK_CONF}
#done
echo "${ZK_ID}" > ${ZK_DATA}/myid
export JAVA_HOME=/opt/product/tools/jdk1.8.0_121
export PATH=$JAVA_HOME/bin:$PATH
${ZK_HOME}/bin/zkServer.sh start-foreground 
