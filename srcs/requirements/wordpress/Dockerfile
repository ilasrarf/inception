# FROM debian:bullseye

# RUN apt update
# RUN apt install curl -y
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN apt install -y php7.4-fpm php7.4-mysqli mariadb-client

# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# COPY /tools/script.sh /script.sh
# # RUN mkdir /run/php/ \
# # && chown -R www-data: /run/php

# RUN chmod +x /script.sh

# CMD ["bash", "script.sh"]

FROM debian:bullseye

RUN apt update && apt install -y wget php7.4 php7.4-fpm php7.4-mysql mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

# RUN wget https://wordpress.org/latest.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf *.tar.gz && rm *.tar.gz

COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

WORKDIR /run/php/wordpress

CMD [ "bash", "/script.sh" ]