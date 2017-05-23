#!/bin/bash
KAFKA_CONF="/opt/product/kafka/config/server.properties"
KAFKA_DATA="/opt/product/data/elk/kafkadata"
KAFKA_CONF_TXT="broker.id=${KAFKA_ID}\nhost.name=${hostname}\nport=9092\nlog.dirs=${KAFKA_DATA}\nsocket.send.buffer.bytes=102400\nsocket.receive.buffer.bytes=102400\nlog.retention.hours=168\nmessage.max.byte=5242880\ndefault.replication.factor=2\nreplica.fetch.max.bytes=5242880\nlog.retention.check.interval.ms=300000\nlog.cleaner.enable=false\nzookeeper.connect=${ZK_CLUSTER}"
echo -e ${KAFKA_CONF_TXT} > ${KAFKA_CONF}
export JAVA_HOME=/opt/product/tools/jdk1.8.0_121
export PATH=$JAVA_HOME/bin:$PATH
${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_CONF}
