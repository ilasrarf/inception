#! bin/sh
echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf


mysqld_safe &

sleep 10


mariadb -u root -p"$ROOT_PASSWORD_DB" <<SQL
CREATE DATABASE IF NOT EXISTS \`$DATABASE_NAME\`;
CREATE USER IF NOT EXISTS '$DATABASES_USER'@'%' IDENTIFIED BY '$DATABASE_PASS';
CREATE USER IF NOT EXISTS 'patrooon'@'%' IDENTIFIED BY '$ROOT_PASSWORD_DB';
GRANT ALL PRIVILEGES ON \`$DATABASE_NAME\`.* TO '$DATABASES_USER'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'patrooon'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SQL

mysqladmin -u root -p"$ROOT_PASSWORD_DB" shutdown

exec mysqld_safe