FROM alpine
RUN  apk update \
     && apk add --no-cache\
     php8 php8-brotli php8-gd php8-curl php8-imap php8-intl php8-json php8-zip php8-xml php8-pdo php8-pdo_sqlite php8-pdo_mysql php8-pdo_pgsql php8-bz2 php8-ctype \
     php8-mbstring php8-dom  php8-posix php8-mysqli  php8-sqlite3 php8-xdebug php8-phar php8-simplexml php8-xmlwriter php8-xmlreader php8-tokenizer \
     php8-pecl-mcrypt php8-pecl-redis php8-pecl-memcache php8-pecl-imagick \
     &&  rm -f /var/cache/apk/* \
     &&  ln -s /usr/bin/php8 /usr/bin/php \
     && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
     && php composer-setup.php --install-dir=bin --filename=composer \
     && rm composer-setup.php \
     && addgroup -S app -g 1000 \
     && adduser -S app -G app -h /app -u 1000
WORKDIR /app
USER app
EXPOSE 8765
CMD ["php","-v"]