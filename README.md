## Why?

this small docker image based on alpine is to help you quickly set up a development environment without having to mess up your entire local environment.

## Description
this docker image is to help you quickly set up a development environment without having to mess up your entire local environment.
It contains everything you will need to start a cakephp project described in [Quickstart](https://book.cakephp.org/4/en/quickstart.html) currently it is always prioritizing the latest version of php but you can only portal to previous versions looking at the latest commits and meeting the requirements for compilation

## Especs
### php version
    PHP 7.3.23 (cli) (built: Oct  1 2020 14:34:47) ( NTS )
    Copyright (c) 1997-2018 The PHP Group
    Zend Engine v3.3.23, Copyright (c) 1998-2018 Zend Technologies
### modules php
    brotli       
    bz2
    Core
    ctype        
    curl
    date
    dom
    filter       
    gd
    hash
    igbinary
    imagick
    imap
    intl
    json
    libxml
    mbstring
    mcrypt
    memcache
    mysqli
    mysqlnd
    openssl
    pcre
    PDO
    pdo_mysql
    pdo_pgsql
    pdo_sqlite
    Phar
    posix
    readline
    redis
    Reflection
    session
    SimpleXML
    SPL
    sqlite3
    standard
    tokenizer
    xml
    xmlreader
    xmlwriter
    zip
    zlib

## how to use?

By default home directory is /app then just run to create the project

    docker run -it -v $PWD:/app leandrofreires/cakephp:dev composer create-project --prefer-dist cakephp/app my_app_name

enter the directory and run the project locally
cd my_app_name

    docker run -it --net=host -v $PWD:/app leandrofreires/cakephp:dev bin/cake server