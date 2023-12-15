FROM php:8.2-fpm
ARG TIMEZONE=America/Havana

LABEL maintainer="Yosviel Dominguez <yosvield@gmail.com>"

RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list
RUN apt-get update && apt-get install -y \
    openssl \
    zip \
    unzip \
    libxrender1 \
    exiftool \
    libxext-dev \
    libzip-dev \
    fontconfig \
    fonts-texgyre \
    libpq-dev \
    nano \
    zlib1g-dev \
    libicu-dev \
    locales \
    libpng-dev \
    g++ \
    symfony-cli

RUN printf 'es_ES.UTF-8 UTF-8\n' >> /etc/locale.gen \
    && locale-gen

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone \
&& printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
&& "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install gd \
    && docker-php-ext-enable gd

# install and config opcache
#RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache \
    && echo "opcache.enable=1" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.enable_cli=1" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.jit_buffer_size=500000000" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.jit=1235" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.validate_timestamps=0" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.memory_consumption=256" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.max_accelerated_files=20000" >> /usr/local/etc/php/conf.d/opcache.ini \

# install and config xdebug
#RUN pecl install xdebug \
#&& docker-php-ext-enable xdebug \
#&& echo ";xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#&& echo ";xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#&& echo ";xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#&& echo ";xdebug.remote_mode=req" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#&& echo ";xdebug.client_host=172.17.0.1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#&& echo ";xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#&& echo ";xdebug.max_nesting_level=1000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# config php
RUN echo "memory_limit=-1" >> /usr/local/etc/php/conf.d/php.ini \
&& echo "upload_max_filesize=6M" >> /usr/local/etc/php/conf.d/php.ini \
&& echo "max_execution_time=500" >> /usr/local/etc/php/conf.d/php.ini \
&& echo "short_open_tag=off" >> /usr/local/etc/php/conf.d/php.ini \
&& echo "expose_php=off" >> /usr/local/etc/php/conf.d/php.ini \
&& echo "realpath_cache_size=4096k" >> /usr/local/etc/php/conf.d/php.ini \
&& echo "realpath_cache_ttl=600" >> /usr/local/etc/php/conf.d/php.ini

#config pool www
RUN echo "[global]" >> /usr/local/etc/php-fpm.d/symfony.ini \
&& echo "emergency_restart_threshold = 10" >> /usr/local/etc/php-fpm.d/symfony.ini \
&& echo "emergency_restart_interval = 1m" >> /usr/local/etc/php-fpm.d/symfony.ini \
&& echo "process_control_timeout = 10s" >> /usr/local/etc/php-fpm.d/symfony.ini \
&& echo "[www]" >> /usr/local/etc/php-fpm.d/symfony.ini \
&& echo "pm.max_children = 20" >> /usr/local/etc/php-fpm.d/symfony.ini

#RUN echo 'alias sf3="php bin/console"' >> ~/.bashrc

RUN php -v

WORKDIR /
