FROM php:7.1-fpm

RUN apt-get update
RUN apt-get update && apt-get install -y mysql-client \
    && docker-php-ext-install pdo_mysql

WORKDIR /var/www

RUN docker-php-ext-install pdo
# Install GD
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

RUN docker-php-ext-install mysqli


