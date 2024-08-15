FROM debian:bullseye

EXPOSE 3306

# installer mariadb server et clean les packages une fois installation terminee
RUN apt update -y && apt upgrade -y \
	&& apt-get install mariadb-server -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/setup.sh /bin/

RUN chmod +x /bin/setup.sh

# mysqld_safe est un script qui demarre mariadb de maniere securisee 
CMD ["setup.sh", "mysqld_safe"]