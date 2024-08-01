FROM debian:bullseye

RUN apt-get update -y
RUN apt upgrade -y
RUN apt-get install -y mariadb-server

COPY /conf/script.sh /script.sh

RUN chmod +x /script.sh

CMD ["bash", "/script.sh"]