#!/bin/bash

DATABASE_NAME_DB=${DATABASE_NAME_DB:-mydatabase}
ROOT_PASSWORD_DB=${ROOT_PASSWORD_DB:-rootpassword}
ADMIN_USER=${ADMIN_USER:-admin}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-adminpassword}

echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe &

sleep 10

mariadb -u root <<SQL
CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME_DB}\`;
CREATE USER IF NOT EXISTS '${ADMIN_USER}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${ADMIN_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SQL

mariadb-admin -u root shutdown

mysqld_safe