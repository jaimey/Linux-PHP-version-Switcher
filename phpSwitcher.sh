#!/bin/bash
PHP_VERSION=$1
if [ "$PHP_VERSION" == "php7.2" ] || [ "$PHP_VERSION" == "7" ]; then
    sudo update-alternatives --set php /usr/bin/php7.2
    sudo update-alternatives --set phar /usr/bin/phar7.2
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.2

    sudo a2dismod php5.6
    sudo a2enmod php7.2

    sudo service apache2 restart
elif [ "$PHP_VERSION" == "php5.6" ] || [ "$PHP_VERSION" == "5" ]; then
    sudo update-alternatives --set php /usr/bin/php5.6
    sudo update-alternatives --set phar /usr/bin/phar5.6
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar5.6

    sudo a2dismod php7.2
    sudo a2enmod php5.6

    sudo service apache2 restart
else
    echo "usage ./switch-php.sh [php5.6, php7.2, 5, 7]"
fi
