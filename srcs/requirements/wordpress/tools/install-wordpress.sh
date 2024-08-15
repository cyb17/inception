#!/bin/bash

# des qu'il y a une erreur le script s'arrete
set -e

# DB_NAME="wordpress"
# DB_USER="user"
# DB_PASSWORD="000"
# DB_HOST="localhost"
# WP_URL="yachen.42.fr"
# WP_DIR="/var/www/inception"
# WP_TITLE="My Website"
# WP_ADMIN="yachen"
# WP_ADMIN_PASSWORD="111"
# WP_ADMIN_EMAIL="yachen@email.com"

# Télécharger et extraire WordPress
wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
tar -xzf /tmp/wordpress.tar.gz -C /tmp
mv /tmp/wordpress/* $WP_DIR/

# Configurer les permissions
chown -R www-data:www-data $WP_DIR

# Nettoyer les fichiers temporaires
rm /tmp/wordpress.tar.gz
rm -rf /tmp/wordpress

# Préparer wp-config.php
cp $WP_DIR/wp-config-sample.php $WP_DIR/wp-config.php

# Modifier wp-config.php pour inclure les informations de base de données
sed -i "s/database_name_here/$DB_NAME/" $WP_DIR/wp-config.php
sed -i "s/username_here/$DB_USER/" $WP_DIR/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/" $WP_DIR/wp-config.php
sed -i "s/localhost/$DB_HOST/" $WP_DIR/wp-config.php

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /bin/wp-cli.phar

# Installer WordPress en ligne de commande
php /bin/wp-cli.phar core install \
    --path=$WP_DIR \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --allow-root

# Nettoyer
rm -f $WP_DIR/wp-cli.phar

exec $@
