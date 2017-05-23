#!/bin/bash
KAFKA_HOME="/opt/product/kafka"
KAFKA_CONF="${KAFKA_HOME}/config/server.properties"
KAFKA_DATA="/opt/product/data/elk/kafkadata"
KAFKA_CONF_TXT="broker.id=${KAFKA_ID}\nhost.name=`hostname`\nzookeeper.connect=${ZK_CLUSTER}"
echo -e ${KAFKA_CONF_TXT} > ${KAFKA_CONF}
cat /opt/product/config/server.properties >> ${KAFKA_CONF}
export JAVA_HOME=/opt/product/tools/jdk1.8.0_121
export PATH=$JAVA_HOME/bin:$PATH
${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_CONF}
