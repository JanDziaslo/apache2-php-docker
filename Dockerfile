FROM php:8.4-apache

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN a2enmod rewrite proxy proxy_http
RUN sed -i 's/Listen 80/Listen 8081/' /etc/apache2/ports.conf
RUN sed -i 's/:80/:8081/' /etc/apache2/sites-available/000-default.conf

COPY wytryszki.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/wytryszki

RUN chown -R www-data:www-data /var/www/wytryszki
