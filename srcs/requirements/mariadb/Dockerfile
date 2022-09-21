FROM debian:buster

RUN apk update && \
	apk upgrade && \
	apk install mariadb-server-10.3 -y

COPY /conf/
COPY /tools /scripts

ENTRYPOINT ["/scripts/startup.sh"]  	
