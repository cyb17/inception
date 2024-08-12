# syntax=docker/dockerfile:1

FROM debian:bullseye

RUN	apt update \
	&& apt install -y nginx openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# creer ces repertoires dans le systeme fichier du conteneur si ils n'existent pas deja
# generer un certificat type auto-signe(x509), une clee RSA de 2048 bits
# d'une duree de validite de 365j et utilise l'algo sha256 pour le signer
# indique la clee ne doit pas etre protege par un mot de passe
# specifie infos requisent par certificat ici, sans necessite d'entree interactive
RUN	mkdir -p /etc/ssl/certs /etc/ssl/private \
	&& openssl req -x509 -newkey rsa:4096 \
	-keyout /etc/ssl/private/key.pem \
	-out /etc/ssl/certs/cert.pem \
	-sha256 -days 365 \
	-nodes \
	-subj "/C=FR/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html;

RUN chown -R www-data:www-data /var/www/html;

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]