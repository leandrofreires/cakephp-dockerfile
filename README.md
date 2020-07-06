## Why?

this docker image is to help you quickly set up a development environment without having to mess up your entire local environment.

## Description
this docker image is to help you quickly set up a development environment without having to mess up your entire local environment.
It contains everything you will need to start a cakephp project described in [Quickstart](https://book.cakephp.org/4/en/quickstart.html) currently it is always prioritizing the latest version of php but you can only portal to previous versions looking at the latest commits and meeting the requirements for compilation

## how to use?

By default it creates a volume for the directory /var/www/html
then just run to create the project

    docker run -it -v $PWD:/var/www/html leandrofreires/cakephp composer create-project --prefer-dist cakephp/app:~4.0 my_app_name

enter the directory and run the project locally
cd my_app_name

    docker run -it --net=host -v $PWD:/var/www/html leandrofreires/cakephp bin/cake server
