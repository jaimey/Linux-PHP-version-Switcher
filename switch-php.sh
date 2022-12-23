#!/bin/bash
PHP_VERSION=$1
if [ "$PHP_VERSION" == "81" ]; then
    sudo update-alternatives --set php /usr/bin/php8.1
    sudo update-alternatives --set phar /usr/bin/phar8.1
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar8.1

    sudo a2dismod php7.4
    sudo a2enmod php8.1

    sudo service apache2 restart
elif [ "$PHP_VERSION" == "74" ]; then
    sudo update-alternatives --set php /usr/bin/php7.4
    sudo update-alternatives --set phar /usr/bin/phar7.4
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.4

    sudo a2dismod php8.1
    sudo a2enmod php7.4

    sudo service apache2 restart    
else
    echo "usage ./switch-php.sh [74, 81]"
fi