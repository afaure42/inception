FROM	debian:buster

#install NGINX
RUN	apt update -y && apt upgrade -y \
	&& apt install nginx -y

#install OpenSSL to create self signed TSL/SSL certif

RUN	apt install OpenSSL -y \
	&& mkdir /etc/nginx/ssl \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/S=IleDeFrance/C=Paris/ON=42_School/OU=Student/CN=afaure.42.fr/EA=afaure@student.42.fr" 

#add our config file
COPY ./conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off";]
