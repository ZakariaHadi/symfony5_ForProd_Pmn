
FROM php:7.4-fpm-buster

## Copy the customized configs of php apache server
COPY docker/php/php.ini /usr/local/etc/php/conf.d/docker-php-config.ini


#Installation of C/C++ libraries && dependencies required by the docker-php-ext.
RUN apt-get update && apt-get install -y \
    gnupg \
    g++ \
    procps
RUN docker-php-ext-configure gd --with-jpeg --with-freetype 

RUN docker-php-ext-install \
    pdo pdo_mysql zip xsl gd intl opcache exif mbstring

# get composer wheels from the official link and installa it in the php bin locatin
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# create the app user
# purpose: => By default, Docker runs container processes as root inside of a container. 
#             This is not a good practice for us since bad people "attackers" can gain root access to the Docker host 
#             if they manage to break out of the container. If you're root in the container, you'll be root on the aws host.
RUN addgroup -S app && adduser -S app -G app

# create the appropriate directories
ENV APP_HOME=/var/www/symfony
RUN mkdir $APP_HOME

# specify the workdirectory
WORKDIR $APP_HOME


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

COPY ./docker/php/entrypoint.sh $APP_HOME
 

 
# chown all the files to the app user
RUN chown -R app:app $APP_HOME

# change to the app user
USER app

ENTRYPOINT ["sh","./entrypoint.prod.sh"]



