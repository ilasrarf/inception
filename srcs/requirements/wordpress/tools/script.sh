#!/bin/bash

sleep 5

# Fix the PHP-FPM listen directive
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Download WordPress core
wp core download --allow-root --path='/var/www/wordpress'

# Create the wp-config.php file
wp config create --allow-root --dbname=$DATABASE_NAME \
                 --dbuser=$DATABASES_USER \
                 --dbpass=$DATABASE_PASS \
                 --dbhost=$DB_HOSTNAME \
                 --path=$WP_PATH

# Install WordPress
wp core install --allow-root \
                --url=$WORDPRESS_URL \
                --title=$WORDPRESS_TITLE \
                --admin_user=$WORDPRESS_ADMIN \
                --admin_password=$WORDPRESS_ADMIN_PASSWORD \
                --admin_email=$WORDPRESS_ADMIN_EMAIL \
                --path=$WP_PATH

# Create a new WordPress user
wp user create --allow-root $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
                --user_pass=$WORDPRESS_USER_PASSWORD \
                --path=$WP_PATH


exec php-fpm7.4 -F