#!/bin/bash

# sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

# wp core download --allow-root --PATH='/var/www/wordpress'

# wp config create --dbname=$DATABASE_NAME \
#                  --dbuser=$DATABASES_USER \
#                  --dbpass=$DATABASE_PASS \
#                  --dbhost=mariadb

# wp core install --allow-root \
# 	            --url=$WORDPRESS_URL \
# 	            --title=$WORDPRESS_TITLE \
# 	            --admin_user=$WORDPRESS_ADMIN \
# 	            --admin_password=$WORDPRESS_ADMIN_PASSWORD \
# 	            --admin_email=$WORDPRESS_ADMIN_EMAIL \
# 	            --path=$WP_PATH \

# wp user create --allow-root $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
#                 --user_pass=$WORDPRESS_USER_PASSWORD \

DB_HOSTNAME=mariadb
DATABASE_NAME=1337_incep
DATABASES_USER=ilasrarf
DATABASE_PASS=ilias_123
MYSQL_ROOT_PASSWORD=root_123
WORDPRESS_URL=ilasrarf.42.fr
WORDPRESS_TITLE=inception
WORDPRESS_ADMIN=root
WORDPRESS_ADMIN_EMAIL=root@42user.fr
WORDPRESS_ADMIN_PASSWORD=123456il_root
ROOT_PASSWORD_DB=123il_ro_42
WORDPRESS_USER_EMAIL=ilasrarf@42user.fr
WORDPRESS_USER_PASSWORD=asrarfii1234  
USER_PASSWORD_DB=asd_ilias_123
USER_NAME_DB=ilias
WORDPRESS_USER=asrarfi

sleep 5

# Fix the PHP-FPM listen directive
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Download WordPress core
wp core download --allow-root --path='/var/www/wordpress'

# Create the wp-config.php file
wp config create --allow-root --dbname=$DATABASE_NAME \
                 --dbuser=$DATABASES_USER \
                 --dbpass=$DATABASE_PASS \
                 --dbhost=mariadb \
                 --path='/var/www/wordpress'

# Install WordPress
# wp core install --allow-root \
#                 --url=$WORDPRESS_URL \
#                 --title=$WORDPRESS_TITLE \
#                 --admin_user=$WORDPRESS_ADMIN \
#                 --admin_password=$WORDPRESS_ADMIN_PASSWORD \
#                 --admin_email=$WORDPRESS_ADMIN_EMAIL \
#                 --path='/var/www/wordpress'

# # Create a new WordPress user
# wp user create --allow-root $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
#                 --user_pass=$WORDPRESS_USER_PASSWORD \
#                 --path='/var/www/wordpress'


exec php-fpm7.4 -F