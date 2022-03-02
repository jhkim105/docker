Zookeeper
========================

## Setup and Run
docker-compose.yml
```yaml
version: '3.1'
services:
  zookeeper:
    container_name: local-zookeeper
    image: zookeeper
    ports:
      - "2181:2181"
  zk-web:
    container_name: local-zk-web
    image: goodguide/zk-web
    ports:
      - "8080:8080"
    environment:
      - ZKWEB_PORT=8080 #Web port
      - ZKWEB_CREDENTIALS=admin:111111
```

Install
```shell
docker-compose up -d
```

Start/Stop
```shell
docker-compose stop
docker-compose start
```



## Refs
https://hub.docker.com/_/zookeeper