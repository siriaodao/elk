#!/bin/bash
export JAVA_HOME=/opt/product/tools/jdk1.8.0_121
export PATH=$JAVA_HOME/bin:$PATH
cd /opt/product/kibana/
rm -rf data
ln -s  /opt/product/data/elk/kibanadata /opt/product/kibana/data
/opt/product/kibana/bin/kibana
