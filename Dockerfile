FROM alpine
RUN  apk update \
     && apk add --no-cache\
     php7 php7-brotli php7-gd php7-curl php7-imap php7-intl php7-json php7-zip php7-xml php7-pdo php7-pdo_sqlite php7-pdo_mysql php7-pdo_pgsql php7-bz2 php7-ctype \
     php7-mbstring php7-dom  php7-posix php7-mysqli  php7-sqlite3 php7-xdebug php7-phar php7-simplexml php7-xmlwriter php7-xmlreader php7-tokenizer \
     php7-pecl-mcrypt php7-pecl-redis php7-pecl-memcache php7-pecl-imagick \
     && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
     && php composer-setup.php --install-dir=bin --filename=composer \
     && rm composer-setup.php \
     && addgroup -S app -g 1000 \
     && adduser -S app -G app -h /app -u 1000
WORKDIR /app
USER app
EXPOSE 8765
CMD ["php","-v"]