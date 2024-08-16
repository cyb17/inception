#!/bin/bash

# DB_NAME="wordpress"
# DB_USER="user"
# DB_PASSWORD="000"
# DB_USER_EMAIL="user@email.com"
# DB_HOST="localhost"
# WP_URL="yachen.42.fr"
# WP_DIR="/var/www/inception"
# WP_TITLE="MyWebsite"
# WP_ADMIN="yachen"
# WP_ADMIN_PASSWORD="111"
# WP_ADMIN_EMAIL="yachen@email.com"

# permet au script de s'arreter si une erreur se produite
set -e

# Télécharger et extraire WordPress
if [ -f "$WP_DIR/wp-config.php" ];
then
    echo "wordpress already installed"
else
    wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
    tar -xzf /tmp/wordpress.tar.gz -C /var/www
    rm /tmp/wordpress.tar.gz
fi

# Configurer les permissions
chown -R www-data:www-data $WP_DIR

# Préparer wp-config.php
cp $WP_DIR/wp-config-sample.php $WP_DIR/wp-config.php

sed -i "s/database_name_here/$DB_NAME/" $WP_DIR/wp-config.php
sed -i "s/username_here/$DB_USER/" $WP_DIR/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/" $WP_DIR/wp-config.php
sed -i "s/localhost/$DB_HOST/" $WP_DIR/wp-config.php

sleep 5

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /bin/wp-cli.phar

# Installer WordPress en ligne de commande
if ! php /bin/wp-cli.phar core is-installed --path="$WP_DIR" --allow-root;
then
    php /bin/wp-cli.phar core install \
        --path=$WP_DIR \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --allow-root
fi

if ! php /bin/wp-cli.phar user get "$DB_USER" --path="$WP_DIR" --allow-root > /dev/null 2>&1;
then
    php /bin/wp-cli.phar user create \
        $DB_USER \
        $DB_USER_EMAIL \
        --path=$WP_DIR \
        --user_pass=$DB_PASSWORD \
        --role=subscriber \
        --allow-root
fi

# Nettoyer
rm -f $WP_DIR/wp-cli.phar

exec $@