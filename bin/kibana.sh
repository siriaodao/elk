#!/bin/bash
export JAVA_HOME=/opt/product/tools/jdk1.8.0_121
export PATH=$JAVA_HOME/bin:$PATH
rm -rf /opt/product/kibana/data
ln -snf  /opt/product/data/elk/kibanadata /opt/product/kibana/data
/opt/product/kibana/bin/kibana
