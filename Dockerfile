# Dockerfile
FROM php:7.4-apache

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        zip \
        unzip

RUN docker-php-ext-install pdo_mysql zip

COPY . .

RUN chown -R www-data:www-data /var/www/html/storage
RUN a2enmod rewrite
