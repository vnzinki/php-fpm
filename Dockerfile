FROM php:8-fpm-buster

RUN apt update -y && apt install -y libfcgi-bin &&\
    docker-php-ext-install mysqli pdo_mysql pdo_mysql opcache &&\
    mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" &&\
    curl https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck --output /usr/local/bin/php-fpm-healthcheck &&\
    chmod +x /usr/local/bin/php-fpm-healthcheck
