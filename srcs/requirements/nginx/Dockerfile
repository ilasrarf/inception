FROM debian:bullseye

RUN apt update
RUN apt install -y nginx 
RUN apt install -y openssl
RUN mkdir -p /var/run/nginx
RUN mkdir -p /etc/nginx/ssl
RUN  chmod -R 777 /var/www/html

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj  "/C=MA/L=KH/O=1337/OU=student/CN=ilasrarf@42.ma"

COPY conf/nginx.conf etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]