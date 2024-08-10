#!/bin/bash

# DB_HOSTNAME=mariadb
# DATABASE_NAME=1337_incep
# DATABASES_USER=ilasrarf
# DATABASE_PASS=ilias_123
# MYSQL_ROOT_PASSWORD=root_123
# WORDPRESS_URL=ilasrarf.42.fr
# WORDPRESS_TITLE=inception
# WORDPRESS_ADMIN=root
# WORDPRESS_ADMIN_EMAIL=root@42user.fr
# WORDPRESS_ADMIN_PASSWORD=123456il_root
# ROOT_PASSWORD_DB=123il_ro_42
# WORDPRESS_USER_EMAIL=ilasrarf@42user.fr
# WORDPRESS_USER_PASSWORD=asrarfii1234  
# USER_PASSWORD_DB=asd_ilias_123
# USER_NAME_DB=ilias
# WORDPRESS_USER=asrarfi


echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe &

sleep 10

mariadb -u root <<SQL
CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;
CREATE USER IF NOT EXISTS '${WORDPRESS_ADMIN}'@'%' IDENTIFIED BY '${WORDPRESS_ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${WORDPRESS_ADMIN}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SQL

mariadb-admin -u root shutdown

exec mysqld_safe