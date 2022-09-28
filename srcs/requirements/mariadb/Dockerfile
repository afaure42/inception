FROM debian:buster

RUN apt update -y && \
	apt upgrade -y && \
	apt install mariadb-server-10.3 -y

COPY /conf/mariadb.cnf /etc/mysql/mariadb.cnf

RUN chown -R mysql:mysql /var/lib/mysql/* && \
	chmod 755 -R /var/lib/mysql/*

COPY /tools /scripts

ENTRYPOINT ["/scripts/startup.sh"]  	

CMD ["mysqld_safe"]
