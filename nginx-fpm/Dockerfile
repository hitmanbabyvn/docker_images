FROM phusion/baseimage:18.04-1.0.0
MAINTAINER Khoa Vu <hitmanbabyvn@yahoo.com>

# ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# change resolv.conf
RUN echo 'nameserver 8.8.8.8' >> /etc/resolv.conf

# enabling SSH
# baseimage-docker disables the SSH server by default. Add the following to your Dockerfile to enable it:
#ENV HOME /root
#RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

#CMD ["/sbin/my_init"]

# update OS
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# install nginx (basic)
RUN echo "deb [arch=amd64] http://nginx.org/packages/mainline/ubuntu/ bionic nginx" >> /etc/apt/sources.list.d/nginx.list
RUN echo "deb-src http://nginx.org/packages/mainline/ubuntu/ bionic nginx" >> /etc/apt/sources.list.d/nginx.list
RUN curl -o /tmp/nginx_signing.key http://nginx.org/keys/nginx_signing.key
RUN mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc
RUN DEBIAN_FRONTEND="noninteractive" apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nginx

# install php
ARG PHP_VERSION=7.3
RUN DEBIAN_FRONTEND="noninteractive" add-apt-repository ppa:ondrej/php
RUN DEBIAN_FRONTEND="noninteractive" apt-get install --fix-missing -y php${PHP_VERSION} \
	php${PHP_VERSION}-fpm \
	php${PHP_VERSION}-common \
	php${PHP_VERSION}-cli \
	php${PHP_VERSION}-gd \
	php${PHP_VERSION}-imagick \
	php${PHP_VERSION}-intl \
	php${PHP_VERSION}-opcache \
	php${PHP_VERSION}-memcached \
	php${PHP_VERSION}-mysqlnd \
	php${PHP_VERSION}-mcrypt \
	php${PHP_VERSION}-curl \
	php${PHP_VERSION}-bcmath \
	php${PHP_VERSION}-mbstring \
	php${PHP_VERSION}-soap \
	php${PHP_VERSION}-xml \
	php${PHP_VERSION}-zip \
	php${PHP_VERSION}-json \
	php${PHP_VERSION}-imap
	#php${PHP_VERSION}-xdebug \
	#php${PHP_VERSION}-pgsql

# install latest version of nodejs
#RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nodejs
#RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y npm
#RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y git

# install yarn
#RUN DEBIAN_FRONTEND="noninteractive" curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN DEBIAN_FRONTEND="noninteractive" echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get install yarn

# install php composer
#RUN curl -sS https://getcomposer.org/installer | php
#RUN mv composer.phar /usr/local/bin/composer

# add custom script (also set timezone to Asia/Ho_Chi_Minh)
RUN mkdir -p /root/setup
ADD custom/setup.sh /root/setup/setup.sh
RUN chmod +x /root/setup/setup.sh
RUN (cd /root/setup/; /root/setup/setup.sh)

# copy files from repo
#ADD custom/nginx.conf /etc/nginx/sites-available/default
ADD custom/nginx.conf /etc/nginx/conf.d/default.conf
ADD custom/.bashrc /root/.bashrc

# disable services start
RUN update-rc.d -f apache2 remove
RUN update-rc.d -f nginx remove
RUN update-rc.d -f php${PHP_VERSION}-fpm remove

# add startup scripts for nginx
ADD custom/nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

# add startup scripts for php7.0-fpm
ADD custom/php-fpm${PHP_VERSION}.sh /etc/service/phpfpm/run
RUN chmod +x /etc/service/phpfpm/run

# set WWW public folder
RUN mkdir -p /var/www/public
ADD custom/index.php /var/www/public/index.php

RUN chown -R www-data:www-data /var/www
RUN chmod 755 /var/www

# set terminal environment
ENV TERM=xterm

# port and settings
EXPOSE 80 9000

# cleanup apt and lists
RUN apt-get clean
RUN apt-get autoclean


