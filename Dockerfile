FROM php:7.3-fpm-stretch

RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
        libzip-dev zip unzip \
        zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure pdo_mysql
RUN docker-php-ext-configure zip
RUN docker-php-ext-install \
     opcache \
     pdo \
     pdo_mysql \
      zip
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN apt-get clean \
    && addgroup foo \
    && adduser --gecos "" --disabled-password --home=/usr/share/nginx/html --shell=/bin/sh --ingroup foo foo


# Install composer
RUN curl https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

USER foo
WORKDIR /var/www
