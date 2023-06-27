FROM debian:bullseye

ARG SITE_TITLE
ARG ADMIN_USER
ARG ADMIN_PASSWORD
ARG ADMIN_EMAIL

ARG USER1_LOGIN
ARG USER1_PASS
ARG USER1_MAIL

#PHP, MySQL and wget installation

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4\
	php-fpm\
	php-mysql\
	mariadb-client

#install Wordpress interface for autoconfig, give rights, place it in right repo
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress


#copy of directories in container
COPY	conf/auto_config.sh /tmp/auto_config.sh
RUN		chmod +x /tmp/auto_config.sh
COPY	./conf/php.conf	/etc/php/7.4/fpm/pool.d/www.conf
RUN		chmod +x /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT ["bash", "/tmp/auto_config.sh"]