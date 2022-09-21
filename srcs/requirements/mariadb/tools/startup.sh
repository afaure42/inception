#!/bin/bash

service mysql start;
mysql -e "CREATE DATABSE IF NOT EXISTS \'${SQL_DATABASE}\';"
mysql -e "CREATE USER IF NOT EXISTS \'${SQL_USER}\'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDNETIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
