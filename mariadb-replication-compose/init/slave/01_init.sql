CHANGE MASTER TO
    MASTER_HOST='mariadb-master',
    MASTER_PORT=3306,
    MASTER_USER='repl',
    MASTER_PASSWORD='repl';

START SLAVE;