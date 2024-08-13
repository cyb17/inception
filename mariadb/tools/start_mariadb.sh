#!/bin/bash

SQL_DATABASE=data
SQL_USER=user
SQL_PASSWORD=pass
SQL_ROOT_PASSWORD=rootpass

echo "MariaDB installed with success"
echo "Configuring MariaDB..."

sed -i 's/# port = 3306/port = 3306/g' /etc/mysql/my.cnf
# cat /etc/mysql/my.cnf
# echo ' '
sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# cat /etc/mysql/mariadb.conf.d/50-server.cnf

echo "Creating a database and users..."

service mariadb start
sleep 10

mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

service mariadb restart