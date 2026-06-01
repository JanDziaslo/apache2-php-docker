FROM php:8.4-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql pdo_sqlite && docker-php-ext-enable mysqli pdo_mysql
RUN docker-php-ext-install sqlite3 && docker-php-ext-enable sqlite3
RUN a2enmod rewrite proxy proxy_http
RUN sed -i 's/Listen 80/Listen 8081/' /etc/apache2/ports.conf
RUN sed -i 's/:80/:8081/' /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/wytryszki

RUN chown -R www-data:www-data /var/www/wytryszki
