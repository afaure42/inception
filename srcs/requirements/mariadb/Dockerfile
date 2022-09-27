FROM debian:buster

RUN apt update -y && \
	apt upgrade -y && \
	apt install mariadb-server-10.3 -y

COPY /conf/mariadb.cnf /etc/mysql/mariadb.cnf
COPY /tools /scripts

RUN echo $SQL_USER

RUN chmod -R 755 /scripts && \
	chown -R mysql:mysql /var/lib/mysql/* && \
	chmod 755 -R /var/lib/mysql/*

ENTRYPOINT ["/scripts/startup.sh"]  	
