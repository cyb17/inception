# syntax=docker/dockerfile:1

FROM debian:11

ARG PHP=php7.4

RUN	apt update \
	&& apt install -y \
	wget \
	# FastCGI Process Manager pour exécuter PHP avec un serveur web
	${PHP}-fpm \
	# Interface en ligne de commande pour exécuter des scripts PHP	
	${PHP}-cli \
	# Extension pour interagir avec les bases de données MySQL		
	${PHP}-mysql \		
	# Permet les transferts de données via divers protocoles (HTTP, FTP, etc.)
	${PHP}-curl \
	# Bibliothèque pour la manipulation des images (création, modification)
	${PHP}-gd \
	# Fonctionnalités pour la gestion des langues et des formats internationaux
	${PHP}-intl \
	# Gestion des chaînes multibytes, utile pour les caractères non-ASCII
	${PHP}-mbstring \
	# Gestion des fichiers XML, nécessaire pour le traitement de données XML
	${PHP}-xml \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

RUN wget http://fr.wordpress.org/latest-fr_FR.tar.gz \
	&& tar -xzvf latest-fr_FR.tar.gz \
	&& rm latest-fr_FR.tar.gz \
	&& mv wordpress/* . \
	&& rmdir wordpress

# Configurer PHP-FPM pour WordPress
COPY conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

EXPOSE 9000

CMD ["php7.4-fpm", "--nodaemonize"]