#!/usr/bin/env bash

##-------------------------------------------------------
# UPDATE CONFIG FILES
##-------------------------------------------------------

# set timezone machine to Asia/Ho_Chi_Minh
#cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

# set UTF-8 environment
echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
echo 'LANG=en_US.UTF-8' >> /etc/environment
echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment

# enable xdebug
#echo 'xdebug.remote_enable=1' >> /etc/php/*/mods-available/xdebug.ini
#echo 'xdebug.remote_connect_back=1' >> /etc/php/*/mods-available/xdebug.ini
#echo 'xdebug.show_error_trace=1' >> /etc/php/*/mods-available/xdebug.ini
#echo 'xdebug.remote_port=9000' >> /etc/php/*/mods-available/xdebug.ini
#echo 'xdebug.scream=0' >> /etc/php/*/mods-available/xdebug.ini
#echo 'xdebug.show_local_vars=1' >> /etc/php/*/mods-available/xdebug.ini
#echo 'xdebug.idekey=PHPSTORM' >> /etc/php/*/mods-available/xdebug.ini

# set PHP timezone to Asia/Ho_Chi_Minh -> use .user.ini
sed -i "s/;date.timezone =.*/date.timezone = Asia\/Ho_Chi_Minh/g" /etc/php/*/fpm/php.ini
sed -i "s/;date.timezone =.*/date.timezone = Asia\/Ho_Chi_Minh/g" /etc/php/*/cli/php.ini
sed -i "s/upload_max_filesize =.*/upload_max_filesize = 128M/g" /etc/php/*/fpm/php.ini
sed -i "s/upload_max_filesize =.*/upload_max_filesize = 128M/g" /etc/php/*/cli/php.ini
sed -i "s/post_max_size =.*/post_max_size = 128M/g" /etc/php/*/fpm/php.ini
sed -i "s/post_max_size =.*/post_max_size = 128M/g" /etc/php/*/cli/php.ini
sed -i "s/max_execution_time =.*/max_execution_time = 600/g" /etc/php/*/fpm/php.ini
sed -i "s/max_execution_time =.*/max_execution_time = 600/g" /etc/php/*/cli/php.ini
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/*/fpm/php.ini

# or use .user.ini

# setup php7.0-fpm to not run as daemon (allow my_init to control)
sed -i "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/*/fpm/php-fpm.conf
sed -i "s/listen =.*/listen = \/var\/run\/php\/php-fpm.sock/g" /etc/php/*/fpm/pool.d/www.conf
sed -i "s/;listen.mode =.*/listen.mode = 0666/g" /etc/php/*/fpm/pool.d/www.conf

# create run directories
mkdir -p /var/run/php
chown -R www-data:www-data /var/run/php
