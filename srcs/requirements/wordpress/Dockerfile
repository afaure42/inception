FROM debian:buster

RUN apt -y update && \
	apt -y upgrade && \
	apt -y install	wget \
					php \
					php-common \
					php7.3-fpm \
					php-mysql \
					mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress
COPY ./conf/wordpress_pool.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp


COPY /tools /scripts
RUN chmod +x -R /scripts 

ENTRYPOINT ["/scripts/config.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
