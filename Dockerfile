FROM php:7-cli-alpine

ENV USER=carddav2fb
ENV WORKDIR=/carddav2fb

RUN \
    apk update && apk upgrade && \
    apk add libjpeg-turbo libpng openssl && \
    apk add --virtual build libjpeg-turbo-dev libpng-dev openssl-dev && \
    docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd ftp && \
    apk del build

RUN \
    mkdir -p ${WORKDIR} && cd ${WORKDIR} && \
    curl -L https://github.com/andig/carddav2fb/archive/master.tar.gz | tar xz --strip=1 && \
    curl -o composer.phar https://getcomposer.org/composer.phar && \
    php composer.phar --no-dev -an install && \
    adduser -DH -h ${WORKDIR} ${USER} ${USER}

ADD config.php ${WORKDIR}/config.php

USER ${USER}
WORKDIR ${WORKDIR}

ENTRYPOINT ["/usr/bin/env", "php", "carddav2fb.php"]
