# syntax=docker/dockerfile:1

FROM debian:11

ARG PHP=php8.3

RUN	apt update \
	&& apt install -y \
	wget \
	${PHP}-fpm \		# FastCGI Process Manager pour exécuter PHP avec un serveur web
	${PHP}-cli \		# Interface en ligne de commande pour exécuter des scripts PHP
	${PHP}-mysql \		# Extension pour interagir avec les bases de données MySQL
	${PHP}-curl \		# Permet les transferts de données via divers protocoles (HTTP, FTP, etc.)
	${PHP}-gd \			# Bibliothèque pour la manipulation des images (création, modification)
	${PHP}-intl \		# Fonctionnalités pour la gestion des langues et des formats internationaux
	${PHP}-mbstring \	# Gestion des chaînes multibytes, utile pour les caractères non-ASCII
	${PHP}-xml \		# Gestion des fichiers XML, nécessaire pour le traitement de données XML
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

RUN && wget http://fr.wordpress.org/latest-fr_FR.tar.gz \
	&& tar -xzvf latest-fr_FR.tar.gz \
	&& rm latest-fr_FR.tar.gz \
	&& mv wordpress/* . \
	&& rmdir wordpress

# Configurer PHP-FPM pour WordPress
COPY conf/php-fpm.conf /etc/php/8.3/fpm/php-fpm.conf

EXPOSE 9000

CMD ["php-fpm8.3", "--nodaemonize"]