#!/bin/bash

DB_NAME=mydata
DB_USER=user
DB_PASSWORD=000
DB_ROOT_PASSWORD=111

service mariadb start

# -v : afficher les informations supplementaires 
mariadb -v -u root << EOF
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