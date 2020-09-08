#FROM php:7.2-cli
FROM php:7.3-apache
RUN apt-get update && apt-get install -y libmcrypt-dev libmcrypt4 libpng-dev libc-client-dev libkrb5-dev cron supervisor zip libxml2-dev libzip-dev rsync

RUN docker-php-source extract \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap mysqli gd xmlrpc opcache soap intl xml pdo_mysql zip \
    && docker-php-source delete

RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

