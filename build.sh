docker build -f Dockerfile.base -t elkbase:jdk-8 ./
docker build -f Dockerfile.elasticsearch -t elasticsearch:5.3.0 ./
docker build -f Dockerfile.logstash -t logstash:5.3.0 ./
docker build -f Dockerfile.kibana -t kibana:5.3.0 ./
docker build -f Dockerfile.filebeat -t filebeat:5.3.0 ./
