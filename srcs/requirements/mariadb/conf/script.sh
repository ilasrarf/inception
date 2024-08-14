# #!/bin/bash

# echo "bind-address = mariadb" >> /etc/mysql/mariadb.conf.d/50-server.cnf

# mysqld_safe &

# sleep 10

# mariadb -u root -p"$ROOT_PASSWORD_DB" <<SQL
# CREATE DATABASE IF NOT EXISTS \`$DATABASE_NAME\`;
# CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '$ROOT_PASSWORD_DB';
# CREATE USER IF NOT EXISTS '$DATABASES_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
# GRANT ALL PRIVILEGES ON \`$DATABASE_NAME\`.* TO '$DATABASES_USER'@'%';
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# SQL

# mariadb-admin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# exec mysqld_safe

#!/bin/bash

# Modify the configuration to listen on all interfaces
echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf

# Start MariaDB in the background
mysqld_safe &

# Wait for MariaDB to start
sleep 10

# Create the database and users
mariadb -u root -p"$ROOT_PASSWORD_DB" <<SQL
CREATE DATABASE IF NOT EXISTS \`$DATABASE_NAME\`;
CREATE USER IF NOT EXISTS '$DATABASES_USER'@'%' IDENTIFIED BY '$DATABASE_PASS';
CREATE USER IF NOT EXISTS 'patrooon'@'%' IDENTIFIED BY '$ROOT_PASSWORD_DB';
GRANT ALL PRIVILEGES ON \`$DATABASE_NAME\`.* TO '$DATABASES_USER'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'patrooon'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SQL

# Create the database and users
# mariadb -u root -p"123il_ro_42" <<SQL
# CREATE DATABASE IF NOT EXISTS \`1337_incep\`;
# CREATE USER IF NOT EXISTS 'ilasrarf'@'%' IDENTIFIED BY '$DATABASE_PASS';
# CREATE USER IF NOT EXISTS 'patrooon'@'%' IDENTIFIED BY '123il_ro_42';
# GRANT ALL PRIVILEGES ON \`1337_incep\`.* TO '$DATABASES_USER'@'%';
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# SQL

# Shut down MariaDB to apply changes
mysqladmin -u root -p"$ROOT_PASSWORD_DB" shutdown

# Restart MariaDB
exec mysqld_safe