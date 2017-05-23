mkdir -p /opt/elk/data/elk/{elasticsearchdata,filebeatdata,kibanadata,logstashdata/in_filebeat,logstashdata/to_elasticsearch,zookeeperdata,kafkadata}
docker build -f Dockerfile.base -t elkbase:jdk-8 ./
docker build -f Dockerfile.filebeat -t filebeat:5.3.0 ./
docker build -f Dockerfile.logstash -t logstash:5.3.0 ./
docker build -f Dockerfile.zkCluster -t zookeeper:3.4.9 ./
docker build -f Dockerfile.kafkaCluster -t kafka:2.11 ./
docker build -f Dockerfile.esCluster -t elasticsearch:5.3.0 ./
docker build -f Dockerfile.kibana -t kibana:5.3.0 ./
