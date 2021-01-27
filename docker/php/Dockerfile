
FROM php:7.4-fpm-buster

## Copy the customized configs of php apache server
COPY docker/php/php.ini /usr/local/etc/php/conf.d/docker-php-config.ini


#Installation of C/C++ libraries && dependencies required by the docker-php-ext.
RUN apt-get update && apt-get install -y \
    gnupg \
    g++ \
    procps \
    openssl \
    git \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libicu-dev  \
    libonig-dev \
    libxslt1-dev \
    acl \
    && echo 'alias sf="php bin/console"' >> ~/.bashrc

RUN docker-php-ext-configure gd --with-jpeg --with-freetype 

RUN docker-php-ext-install \
    pdo pdo_mysql zip xsl gd intl opcache exif mbstring

# get composer wheels from the official link and installa it in the php bin locatin
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# specify the work directory
WORKDIR /var/www/symfony

##### THIS BLOCK is not necessary in this moment since we already create the project packages and dirs#######
# install symfony bundles && init the project.
# composer create-project symfony/website-skeleton my_project_name# Init a new symfony project with doctrine tool.

# RUN composer require doctrine/doctrine-bundle

# RUN php bin/console make:entity
# RUN php bin/console make:migration
# RUN php bin/console make:crud
#########################################################

## install packages by using the composer.json file
RUN composer install




