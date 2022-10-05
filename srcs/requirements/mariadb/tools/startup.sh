#!/bin/bash

if [ ! -d /var/lib/mysql/$SQL_DATABASE ]; then

service mysql start

# Secure installation
mysql <<-EOF
ALTER USER \`root\`@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
GRANT ALL PRIVILEGES ON *.* TO \`root\`@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
echo "Secure installation done"

#database creation
mysql -u root -p$SQL_ROOT_PASSWORD <<-EOF
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
FLUSH PRIVILEGES;
EOF
echo "Wordpress database and user created"

mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown
echo "STOPPING TEMP SERV"

fi

echo "STARTING COMMAND"
exec "$@"
