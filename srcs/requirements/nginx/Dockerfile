FROM debian:bullseye

RUN apt-get update \
    apt-get install -y nginx \
    apt-get install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj  "/C=MA/L=KH/O=1337/OU=student/CN=ilasrarf@42.ma"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]