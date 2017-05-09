#!/bin/bash
export JAVA_HOME=/opt/product/tools/jdk1.8.0_121
export PATH=$JAVA_HOME/bin:$PATH
JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF8  -Duser.timezone=GMT+08"
rm -rf /opt/product/logstash/data
ln -s  /opt/product/data/elk/logstashdata /opt/product/logstash/data
/opt/product/logstash/bin/logstash -f /opt/product/logstash/config/logstash.conf
