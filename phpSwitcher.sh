#!/bin/bash
PHP_VERSION=$1
if [ "$PHP_VERSION" == "php7.1" ] || [ "$PHP_VERSION" == "7" ]; then
    sudo update-alternatives --set php /usr/bin/php7.1
    sudo update-alternatives --set phar /usr/bin/phar7.1
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.1

    sudo a2dismod php5.6
    sudo a2enmod php7.1

    sudo service apache2 restart
    sudo service mysql restart
    sudo service memcached restart
    sudo service ssh restart
elif [ "$PHP_VERSION" == "php5.6" ] || [ "$PHP_VERSION" == "5" ]; then
    sudo update-alternatives --set php /usr/bin/php5.6
    sudo update-alternatives --set phar /usr/bin/phar5.6
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar5.6

    sudo a2dismod php7.1
    sudo a2enmod php5.6

    sudo service apache2 restart
    sudo service mysql restart
    sudo service memcached restart
    sudo service ssh restart
else
    echo "usage ./switch-php.sh [php5.6, php7.1, 5, 7]"
fi