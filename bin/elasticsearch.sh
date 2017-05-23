#!/bin/bash
echo "* soft nofile 65536" >> /etc/security/limits.conf 
echo "* hard nofile 131072" >> /etc/security/limits.conf
echo "* soft nproc 2048" >> /etc/security/limits.conf
echo "* hard nproc 4096" >> /etc/security/limits.conf
echo "vm.max_map_count=655360" >> /etc/sysctl.conf 
sysctl -p
ES_DATA_DIR="/opt/product/data/elk/elasticsearchdata"
ES_CONF="/opt/product/elasticsearch/config/elasticsearch.yml"
ES_CONF_TXT_CLUSTER="cluster.name: ${ES_CLUSTER_NAME}\nnode.name: ${ES_NODE_NAME}\ndiscovery.type: single-node\nnode.master: true\ndiscovery.zen.ping.unicast.hosts: [${ES_NODE_LIST}]"
ES_CONF_TXT_SINGLE="network.host: 0.0.0.0\nhttp.port: 9200\npath.data: ${ES_DATA_DIR}\nhttp.cors.enabled: true\nhttp.cors.allow-origin: \"*\"\nnode.data: true"
if [ -n "${ES_CLUSTER_NAME}" ];then
  echo -e "${ES_CONF_TXT_CLUSTER}" > ${ES_CONF}
  echo -e "${ES_CONF_TXT_SINGLE}" >> ${ES_CONF}
else
  echo -e "${ES_CONF_TXT_SINGLE}" > ${ES_CONF}
fi
chown -R elk:elk /opt/product
su - elk <<!
export JAVA_HOME=/opt/product/tools/jdk1.8.0_121
export PATH=$JAVA_HOME/bin:$PATH
/opt/product/elasticsearch/bin/elasticsearch
