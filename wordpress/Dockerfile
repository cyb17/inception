FROM debian:bullseye

EXPOSE 9000

# wget est un utilitaire pour telecharger des fichier depuis le web
RUN apt update && apt install --no-install-recommends --no-install-suggests -y \
 	ca-certificates \
 	php7.4-fpm \
 	php7.4-mysql \
 	wget \
 	tar \
	&& rm -rf /var/lib/apt/lists/*

RUN service php7.4-fpm stop

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /var/www \
	&& mkdir -p /var/www/inception

COPY ./tools/install-wordpress.sh /bin/install-wordpress.sh

RUN chmod +x /bin/install-wordpress.sh

CMD ["install-wordpress.sh", "php-fpm7.4", "-F"]

