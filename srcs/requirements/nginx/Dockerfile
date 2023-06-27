FROM debian:bullseye

#install apt nginx and openssl
RUN apt-get update && apt-get upgrade -y
RUN	apt-get install -y nginx openssl

#nginx SSL key -certificate type -password -key RSA to sign contract -duration
#-where to store key certificate -prefill certificate
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:4096 -days 365 \
		-out /etc/ssl/certs/inception.crt \
		-keyout /etc/ssl/private/inception.key \
		-subj "/C=FR/ST=ARA/L=Lyon/O=42/OU=42/CN=vsedat.42.fr/UID=vsedat"

COPY conf/nginx.conf /etc/nginx/nginx.conf

#give rights
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

#Start nginx in first plan
CMD ["nginx", "-g", "daemon off;"]
