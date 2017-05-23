# ELK-5.3.0

-----------准备工作-----------

elk官网地址：https://www.elastic.co

进入目录 /opt 

git clone https://github.com/siriaodao/elk.git 

下载jdk1.8.0_121.tar.gz 包并放到 /opt/elk/tools下

-----------编译-----------

bash build.sh

-----------运行容器-----------

config目录下配置按自己需求更改

docker-compose up -d  

PS:使用已有的镜像运行容器

docker-compose -f docker-compose-registry.yml up -d

-----------验证-----------

elasticsearch

集群健康检查： curl 'localhost:9200/_cat/health?v'

查看集群节点： curl 'localhost:9200/_cat/nodes?v'

查看索引： curl 'localhost:9200/_cat/indices?v'

kafka

zookeeper
