
## Config Master/Slave with Docker

### Master config
```
[mysqld]
log-bin=mysql-bin
server-id=1
expire_logs_days=3
```

### Slave config
```
[mysqld]
server-id=2
#replicate-do-db=demo_repl
log-slave_updates=1
```

### Run Master container
```
docker container run -d -p 13306:3306   \
-e MYSQL_ROOT_PASSWORD=111111   \
-v /Users/jihwankim/dev/docker/mariadb-master-slave/data/master:/var/lib/mysql   \
-v /Users/jihwankim/dev/docker/mariadb-master-slave/conf/master:/etc/mysql/conf.d   \
--name mariadb-master mariadb
```

### Run Slave container
```
docker container run -d -p 23306:3306   \
-e MYSQL_ROOT_PASSWORD=111111   \
-v /Users/jihwankim/dev/docker/mariadb-master-slave/data/slave:/var/lib/mysql      \
-v /Users/jihwankim/dev/docker/mariadb-master-slave/conf/slave:/etc/mysql/conf.d      \
--link mariadb-master   \
--name mariadb-slave mariadb
```

### CREATE USER on Master
```
mysql -u root -p111111 --port 13306 --host 127.0.0.1
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%' IDENTIFIED BY '111111';
```

### On Master
```
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
UNLOCK TABLES;
```


### Start Slave
```
mysql -u root -p111111 --port 23306 --host 127.0.0.1
CHANGE MASTER TO MASTER_HOST='mariadb-master', MASTER_USER='repl', MASTER_PASSWORD='111111', MASTER_LOG_FILE='mysql-bin.000005', MASTER_LOG_POS=342;
START SLAVE;
SHOW SLAVE STATUS;
```

