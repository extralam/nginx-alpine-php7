FROM nginx:1.13.5-alpine

MAINTAINER info@solutionforest.net

# Install php
RUN apk update && \
    apk upgrade && \
    apk add --update libressl libressl-dev libssl1.0 supervisor \
    php7 \
    php7-fpm \
    php7-pdo_mysql \
    php7-ctype \
    php7-pdo \
    php7-zlib \
    php7-phar \
    php7-openssl \
    #php7-cli \
    php7-common \
    php7-dev \
    php7-opcache \
    php7-mbstring \
    php7-gd \
    php7-intl \
    php7-memcached \
    #php7-mysql \
    php7-redis \
    php7-curl \
    php7-json \
    php7-xsl \
    php7-xml \
    php7-mongodb \
    php7-imagick \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ && \
    mkdir /var/log/supervisor && \
    rm -rf /var/cache/apk/*

# add user www-data
#RUN adduser -S www-data
RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

# Nginx configuration
RUN rm /etc/nginx/conf.d/*
#RUN unlink /etc/nginx/sites-enabled/default
COPY docker/config/nginx.conf /etc/nginx/nginx.conf
COPY docker/config/nginx-vhost.conf /etc/nginx/sites-enabled/app.conf

# PHP configuration
RUN rm /etc/php7/php-fpm.d/www.conf
COPY docker/config/php-env-vars.conf /etc/php7/php-env-vars.conf
COPY docker/config/php-fpm.conf /etc/php7/php-fpm.conf
COPY docker/config/php.ini /etc/php7/php.ini

# Configure supervisord
COPY docker/config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# init scrip
COPY docker/init_script.sh /init_script.sh
RUN chmod +x /init_script.sh

# Copy app code
RUN mkdir -p /home/app
WORKDIR /home/app
COPY . /home/app
RUN rm -Rf /home/app/.git

CMD ["/bin/sh", "/init_script.sh"]