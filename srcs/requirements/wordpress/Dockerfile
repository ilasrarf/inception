FROM debian:bullseye

RUN apt update
RUN apt install curl -y
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN apt install -y php7.4-fpm php7.4-mysqli 

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY /tools/script.sh /script.sh
RUN mkdir /run/php/ \
&& chown -R www-data: /run/php 

RUN chmod +x /script.sh

CMD ["bash", "script.sh"]

