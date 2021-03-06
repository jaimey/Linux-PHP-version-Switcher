#!/bin/bash
PHP_VERSION=$1
if [ "$PHP_VERSION" == "php5.6" ] || [ "$PHP_VERSION" == "5" ]; then
    sudo update-alternatives --set php /usr/bin/php5.6
    sudo update-alternatives --set phar /usr/bin/phar5.6
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar5.6

    sudo a2dismod php7.2
    sudo a2dismod php7.3
    sudo a2dismod php7.4
    sudo a2enmod php5.6

    sudo service apache2 restart
elif [ "$PHP_VERSION" == "php7.2" ] || [ "$PHP_VERSION" == "72" ]; then
    sudo update-alternatives --set php /usr/bin/php7.2
    sudo update-alternatives --set phar /usr/bin/phar7.2
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.2

    sudo a2dismod php5.6
    sudo a2dismod php7.3
    sudo a2dismod php7.4
    sudo a2enmod php7.2

    sudo service apache2 restart
elif [ "$PHP_VERSION" == "php7.3" ] || [ "$PHP_VERSION" == "73" ]; then
    sudo update-alternatives --set php /usr/bin/php7.3
    sudo update-alternatives --set phar /usr/bin/phar7.3
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.3

    sudo a2dismod php5.6
    sudo a2dismod php7.2
    sudo a2dismod php7.4
    sudo a2enmod php7.3

    sudo service apache2 restart
elif [ "$PHP_VERSION" == "php7.4" ] || [ "$PHP_VERSION" == "74" ]; then
    sudo update-alternatives --set php /usr/bin/php7.4
    sudo update-alternatives --set phar /usr/bin/phar7.4
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.4

    sudo a2dismod php5.6
    sudo a2dismod php7.2
    sudo a2dismod php7.3
    sudo a2enmod php7.4

    sudo service apache2 restart    
else
    echo "usage ./switch-php.sh [php5.6, 5, php7.2, 72, 73, 74]"
fi