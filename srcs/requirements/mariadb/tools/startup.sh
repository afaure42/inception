#!/bin/bash

if [ ! -d /var/lib/mysql/$SQL_DATABASE ]; then

service mysql start

mysql -e "UPDATE mysql.user SET Password=PASSWORD('$SQL_ROOT_PASSWORD') WHERE User='root';"
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
mysql -e "DROP DATABASE test;"
mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"
mysql -e "FLUSH PRIVILEGES;"


mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
echo "DATABASE CREATED"
mysql -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
echo "USER CREATED"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
echo "PERMS GRANTED"
mysql -u root -e "FLUSH PRIVILEGES;"
echo "FLUSH"
echo $SQL_ROOT_PASSWORD
service mysql status

mysqladmin -uroot shutdown
echo "STOPPING"

fi

echo "STARTING COMMAND"
exec "$@"
