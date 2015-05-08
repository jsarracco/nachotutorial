#!/bin/bash -e

sudo apt-get update -y
sudo apt-get install -y \
	curl \
	apache2 \
	php5 \
	php5-cli \
	php-pear \
	php5-curl \
	phpunit \
	php5-intl \
	php5-memcache \
	php5-dev \
	php5-gd \
	php5-mcrypt \
	php5-dev \
	git-core \
	git

rm -f /vagrant/logs/web/*.log
rm -f /vagrant/logs/web/urls.txt

# silex
#if [ ! -f /etc/apache2/sites-available/silex-app ]
#then
#    sudo ln -s /vagrant/script/template/silex-app.conf /etc/apache2/sites-available/silex-app
#fi
#sudo a2enmod rewrite
#sudo a2dissite 000-default
#sudo a2ensite silex-app
#sudo service apache2 restart

cd /vagrant
curl -s http://getcomposer.org/installer | php5
mv composer.phar /usr/local/bin/composer
/usr/local/bin/composer self-update
/usr/local/bin/composer install
/usr/local/bin/composer update

ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '10.0.2' | grep -v '10.11.12.4' | cut -d: -f2 | awk '{ print "http://"$1"/"}' > /vagrant/logs/web/urls.txt
echo "You can access your application on "
cat /vagrant/logs/web/urls.txt
