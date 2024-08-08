# syntax=docker/dockerfile:1

FROM debian:11

RUN	apt update \
	&& apt install -y nginx openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# creer ces repertoires dans le systeme fichier du conteneur si ils n'existent pas deja
RUN	mkdir -p /etc/ssl/certs /etc/ssl/private \
	# generer un certificat type auto-signe(x509), une clee RSA de 2048 bits
	&& openssl req -x509 -newkey rsa:4096 \
	-keyout /etc/ssl/private/key.pem \
	-out /etc/ssl/certs/cert.pem \
	# d'une duree de validite de 365j et utilise l'algo sha256 pour le signer
	-sha256 -days 365 \
	# indique la clee ne doit pas etre protege par un mot de passe
	-nodes \
	# specifie infos requisent par certificat ici, sans necessite d'entree interactive
	-subj "/C=FR/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

COPY	conf/nginx.conf /etc/nginx/nginx.conf

WORKDIR	/var/www/html

COPY	tools/index.html .

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]