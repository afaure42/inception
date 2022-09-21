FROM	debian:buster

#install NGINX
RUN	apt update -y && apt upgrade -y \
	&& apt install nginx -y

#install OpenSSL to create self signed TSL/SSL certif

RUN	apt install openssl -y \
	&& mkdir /etc/nginx/ssl \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IleDeFrance/L=Paris/O=42_School/OU=Student/CN=afaure.42.fr" 

#add our config file
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
