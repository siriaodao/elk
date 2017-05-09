#!/bin/bash
export JAVA_HOME=/opt/product/tools/jdk1.8.0_121
export PATH=$JAVA_HOME/bin:$PATH
cd /opt/product/filebeat
rm -rf data 
ln -s /opt/product/data/elk/filebeatdata /opt/product/filebeat/data
/opt/product/filebeat/filebeat -e -c filebeat.yml
