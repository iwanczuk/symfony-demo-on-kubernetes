ARG PHP_VERSION=8.2.12
ARG DEMO_VERSION=2.3.0
ARG COMPOSER_VERSION=2.6.5

FROM composer:$COMPOSER_VERSION as composer

FROM php:$PHP_VERSION-apache

ARG DEMO_VERSION

RUN set -eux; \
    \
    apt-get update; \
    \
    apt-get install -y --no-install-recommends \
        unzip; \
    \
    rm -rf /var/lib/apt/lists/*;

RUN set -eux; \
    \
    docker-php-ext-install -j$(nproc) \
        opcache;

RUN a2enmod rewrite

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN COMPOSER_ALLOW_SUPERUSER=1 composer --working-dir=/var/www create-project symfony/symfony-demo:$DEMO_VERSION demo

WORKDIR /var/www/demo

RUN chown -R www-data:www-data /var/www/demo/var

RUN rmdir /var/www/html && ln -s /var/www/demo/public /var/www/html
