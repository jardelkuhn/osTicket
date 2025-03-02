# Use an official PHP-Apache base image
FROM php:8.2-apache

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages and enable necessary PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    mariadb-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Download and install osTicket
# RUN curl -L https://github.com/osTicket/osTicket/archive/refs/tags/v1.18.2.zip -o osticket.zip
# RUN unzip osticket.zip -d /var/www/html/
# RUN mv /var/www/html/osTicket-1.18.2/* /var/www/html/
# RUN rm -r /var/www/html/osTicket-1.18.2
# RUN rm osticket.zip

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
