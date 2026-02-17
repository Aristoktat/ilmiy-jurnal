FROM php:8.1-apache

ARG CACHE_BUST=20240217-v3

# 1. Tizim paketlarini o'rnatish
RUN apt-get update && apt-get install -y --no-install-recommends \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    libpq-dev \
    libicu-dev \
    git \
    unzip \
    wget \
    cron \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 2. PHP Ext: GD (Rasmlar uchun)
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# 3. PHP Ext: Baza (MySQL & Postgres)
RUN docker-php-ext-install mysqli pdo_mysql pdo_pgsql pgsql

# 4. PHP Ext: Boshqalar (Intl, Zip, XML...)
RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install xml mbstring zip opcache

# Apache modullarini yoqish
RUN a2enmod rewrite headers

# OJS o'rnatish
ENV OJS_VERSION=3.4.0-5
WORKDIR /var/www/html

RUN curl -L https://pkp.sfu.ca/ojs/download/ojs-${OJS_VERSION}.tar.gz | tar xz --strip-components=1

# Papkalar yaratish
RUN mkdir -p /var/www/files /var/www/html/public /var/www/html/cache \
    && chown -R www-data:www-data /var/www \
    && chmod -R 777 /var/www/html/public \
    && chmod -R 777 /var/www/html/cache \
    && chmod -R 777 /var/www/files

# Konfiguratsiyalar
COPY apache.conf /etc/apache2/sites-available/000-default.conf
COPY php.ini /usr/local/etc/php/conf.d/ojs.ini
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80

CMD ["/usr/local/bin/docker-entrypoint.sh"]
