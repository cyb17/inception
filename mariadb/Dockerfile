FROM debian:bullseye

EXPOSE 3306

RUN apt update -y && apt upgrade -y \
	&& apt-get install mariadb-server -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/start_mariadb.sh .

RUN chmod +x start_mariadb.sh

CMD ["./start_mariadb.sh"]