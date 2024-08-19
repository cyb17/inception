#!/bin/bash

# ajouter les informations du credentials dans l'environnement courant
source SECRETS
DB_PASSWORD=$(cat $DB_PASSWORD)
DB_ROOT_PASSWORD=$(cat $DB_ROOT_PASSWORD)

service mariadb start
 
mariadb -u root << EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO 'root'@'%' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD');
EOF

sleep 5
service mariadb stop

# executer la commande suivante su Dockerfile
exec $@