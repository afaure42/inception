#!/bin/bash

sleep 10

if [ ! -e "/var/www/wordpress/wp-config.php" ]; then
	wp config create \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 \
	--path="/var/www/wordpress" \
	--allow-root

	wp core install --allow-root \
					--url="https://afaure.42.fr" \
					--title="afaure.42.fr" \
					--admin_user=$WP_ADMIN \
					--admin_email=$WP_ADMIN_MAIL \
					--admin_password=$WP_ADMIN_PASSWORD \
					--path="/var/www/wordpress"

	wp user create	$WP_USER \
					$WP_USER_MAIL \
					--user_pass=$WP_USER_PASS \
					--allow-root \
					--path="/var/www/wordpress"
	fi

if [ ! -e /run/php ]; then
	mkdir -p /run/php
fi

echo "STARTING PHP-FPM"
exec "$@"
