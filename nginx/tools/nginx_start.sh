#!/bin/bash

GREEN='\033[0;32m'
DEF='\033[0m'

echo "${GREEN}Nginx and openssl installed with success"
echo "${GREEN}Creating auto signed SSL keys...${DEF}"

mkdir -p /etc/ssl/certs /etc/ssl/private \
	&& openssl req -x509 -newkey rsa:4096 \
	-keyout /etc/ssl/private/key.pem \
	-out /etc/ssl/certs/cert.pem \
	-sha256 -days 365 \
	-nodes \
	-subj "/C=FR/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

echo "${GREEN}SSL keys created with success"
echo "${GREEN}Execute nginx...${DEF}"

exec nginx -g 'daemon off;'