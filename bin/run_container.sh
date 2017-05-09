#!/bin/bash


docker run -d --name filebeat --restart=always -v /var/log:/var/log -v /opt/elk/config/filebeat:/opt/product/config -v /opt/elk/data:/opt/product/data  filebeat:5.3.0

docker run -d --name elasticsearch --privileged --restart=always -v  /opt/elk/config/elasticsearch:/opt/product/config -v /opt/elk/data/:/opt/product/data/ -p 9200:9200 -p 9300:9300 elasticsearch:5.3.0

docker run  -d --name logstash --restart=always -v /opt/elk/config/logstash:/opt/product/config -v /opt/elk/data:/opt/product/data -p 5044:5044 -p 4560:4560 -p 18080:8080 logstash:5.3.0

docker run -d --name kibana --restart=always -v  /opt/elk/config/kibana:/opt/product/config -v /opt/elk/data:/opt/product/data -p 5601:5601  kibana:5.3.0
