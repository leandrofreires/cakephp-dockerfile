FROM php:7-fpm
# Install modules
RUN apt-get update && apt-get install -y \
        g++ \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        libpq-dev \
        sqlite3 \
        unzip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install gd \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install zip \
    && apt-get purge --auto-remove -y g++ \
    && rm -rf /var/lib/apt/lists/*
#install composer global
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"
#create user and set permissions
RUN usermod -u 1000 www-data
RUN chown -R www-data:www-data /var/www/
#define user
USER www-data
