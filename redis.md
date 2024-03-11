
## Redis Master Slave

```yaml
version: '3.7'

services:
  redis-master:
    image: redis
    container_name: redis-master
    ports:
      - "6370:6379"
    command: redis-server --appendonly yes

  redis-slave1:
    image: redis
    container_name: redis-slave1
    ports:
      - "6371:6379"
    command: redis-server --appendonly yes --slaveof redis-master 6379

  redis-slave2:
    image: redis
    container_name: redis-slave2
    ports:
      - "6372:6379"
    command: redis-server --appendonly yes --slaveof redis-master 6379
```



