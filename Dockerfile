FROM php:8.5.3-fpm-trixie

ARG wwwdatauid=1000
RUN usermod -u $wwwdatauid www-data

# for componser cache
RUN chown $wwwdatauid:$wwwdatauid /var/www

# Install composer in image
COPY --from=composer:2.9.5 /usr/bin/composer /usr/local/bin/composer

# libpq-dev - Required for pdo_pgsql extenstion
# git - Required for composer
# zip - Required for composer
# libzip-dev - Required for zip extenstion
# libicu-dev - Required for intl extenstion
# imagemagick - ImageMagick for generated images
# libmagickwand-dev - ImageMagick for generated images
# AVIF/HEIF support for ImageMagick
RUN apt-get update && apt-get install -y -q --no-install-recommends \
    libpq-dev \
    git \
    zip \
    libzip-dev \
    libicu-dev \
    imagemagick \
    libmagickwand-dev \
    libheif-dev \
    libavif-dev \
    libheif-plugin-aomenc \
    libheif-plugin-aomdec \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install imagick

# intl - Required for IntlDateFormatter
RUN docker-php-ext-configure \
    intl

# pdo pdo_pgsql - PostgreSQL driver
# zip - Required for composer
# intl - Required for IntlDateFormatter
# bcmath - Required for bc math functions, used in some packages like laravel/framework
RUN docker-php-ext-install \
    pdo \
    pdo_pgsql \
    zip \
    intl \
    bcmath \
    pcntl

RUN docker-php-ext-enable imagick
