#!/bin/bash

# des qu'il y a une erreur le script s'arrete
set -e

WORDPRESS_DIR="/var/www/inception/"
DB_NAME="wordpress"
DB_USER="wp_user"
DB_PASSWORD="000"
DB_HOST="localhost"
WP_URL="yachen.42.fr"
WP_TITLE="My Website"
WP_ADMIN="yachen"
WP_ADMIN_PASSWORD="111"
WP_ADMIN_EMAIL="yachen@email.com"

# Télécharger et extraire WordPress
wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
tar -xzf /tmp/wordpress.tar.gz -C /tmp
mv /tmp/wordpress/* $WORDPRESS_DIR

# Configurer les permissions
chown -R www-data:www-data $WORDPRESS_DIR

# Nettoyer les fichiers temporaires
rm /tmp/wordpress.tar.gz
rm -rf /tmp/wordpress

# Préparer wp-config.php
cp $WORDPRESS_DIR/wp-config-sample.php $WORDPRESS_DIR/wp-config.php

# Modifier wp-config.php pour inclure les informations de base de données
sed -i "s/database_name_here/$DB_NAME/" $WORDPRESS_DIR/wp-config.php
sed -i "s/username_here/$DB_USER/" $WORDPRESS_DIR/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/" $WORDPRESS_DIR/wp-config.php
sed -i "s/localhost/$DB_HOST/" $WORDPRESS_DIR/wp-config.php

# Installer WordPress en ligne de commande
php $WORDPRESS_DIR/wp-cli.phar core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

# Nettoyer
rm -f $WORDPRESS_DIR/wp-cli.phar

exec $@
