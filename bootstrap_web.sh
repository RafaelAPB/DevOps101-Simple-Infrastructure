#Thanks for Brad Traversy for the script, https://github.com/bradtraversy
apt-get update
apt-get install -y git
apt-get install -y apache2

a2enmod rewrite

#Add Onrej PPA Repo
apt-add-repository ppa:ondrej/php
apt-get update

# Install PHP
apt-get install -y php7.2

# PHP Apache Mod
apt-get install -y libapache2-mod-php7.2

# Restart Apache
service apache2 restart

# PHP Mods
#apt-get install -y php7.2-common
#apt-get install -y php7.2-mcrypt
#apt-get install -y php7.2-zip

# Set MySQL Pass
#debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
#debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQL
#apt-get install -y mysql-server

# PHP-MYSQL lib
#apt-get install -y php7.2-mysql

# Restart Apache
#sudo service apache2 restart
