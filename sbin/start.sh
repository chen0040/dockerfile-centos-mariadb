#!/bin/bash

/home/xschen/stop.sh

if [ ! -f /home/xschen/database-locked ]; then
    chown -R mysql /var/lib/mysql

    mysql_install_db --user mysql > /dev/null

    sleep 5s

    mysqld_safe --user mysql &

    sleep 5s

    mysql -v < /home/xschen/mysql-init.sql

    sleep 5s

    ps -wef | grep mysql | grep -v grep | awk '{print $2}' | xargs kill -9

    echo $(date) > /home/xschen/database-locked
fi

mysqld_safe --user mysql
