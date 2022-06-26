FROM php:8.0-fpm

LABEL maintainer="Nguyen Quyen <nguyenquyen18011996@gmail.com>"

# ext
RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends supervisor git libzip-dev zip && rm -rf /var/lib/apt/lists/* && \
    pecl install imagick && \
    docker-php-ext-enable imagick && \
    docker-php-ext-install pdo pdo_mysql zip
# composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN composer self-update 2.2.7

# supervisord
COPY php/supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 9000

COPY php/start /command/start

ENTRYPOINT ["/command/start"]