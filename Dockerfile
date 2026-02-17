
FROM php:8.1-apache

# Install required packages
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    libpq-dev \
    git \
    unzip \
    wget \
    cron \
    && rm -rf /var/lib/apt/lists/*

# Configure and install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    gd \
    mysqli \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    xml \
    mbstring \
    intl \
    zip \
    opcache

# Enable Apache modules
RUN a2enmod rewrite headers

# Install OJS
ENV OJS_VERSION=3.4.0-5
WORKDIR /var/www/html

# Download and extract OJS
RUN curl -L https://pkp.sfu.ca/ojs/download/ojs-${OJS_VERSION}.tar.gz | tar xz --strip-components=1

# Create private files directory (needs to be persistent on Render)
RUN mkdir -p /var/www/files && chown -R www-data:www-data /var/www
RUN mkdir -p /var/www/html/public && chmod -R 777 /var/www/html/public
RUN mkdir -p /var/www/html/cache && chmod -R 777 /var/www/html/cache

# Custom Apache Config (for Render port and rewriting)
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Custom PHP Config
COPY php.ini /usr/local/etc/php/conf.d/ojs.ini

# Entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80

CMD ["/usr/local/bin/docker-entrypoint.sh"]
