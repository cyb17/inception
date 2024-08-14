FROM debian:bullseye

EXPOSE 443

RUN apt update && apt install nginx openssl -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/nginx_start.sh .

RUN chmod +x nginx_start.sh

CMD ["./nginx_start.sh"]