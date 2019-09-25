FROM phpdockerio/php56-fpm:latest

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install php5-mysql php5-pgsql php5-sqlite php5-gd php5-geoip php5-imap php5-xmlrpc \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install git
RUN apt-get update \
    && apt-get -y install git \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*


# Condig PHP
RUN echo 'upload_max_filesize = 200M' >> /etc/php5/fpm/conf.d/99-overrides.ini \
    && echo 'post_max_size = 208M' >> /etc/php5/fpm/conf.d/99-overrides.ini \
    && echo 'memory_limit = -1' >> /etc/php5/fpm/conf.d/99-overrides.ini \
    && echo 'max_input_vars = 3000' >> /etc/php5/fpm/conf.d/99-overrides.ini
