#!/usr/bin/env bash
#安装Apache mariadb php
yum -y install httpd mariadb-server mariadb php php-mysql gd php-gd
#启动Apache
systemctl start httpd
systemctl enable httpd

#启动数据库
systemctl start mariadb
systemctl enable mariadb

#准备数据库
mysql -e 'create datebase wordpress'

#下载并上线wordpress
wget https://cn.wordpress.org/wordpress-4.9.4-zh_CN.tar.gz
tar -xvf wordpress-4.9.4-zh_CN.tar.gz
cp -r wordpress/* /var/www/html
chown -R apache.apache /var/www/html

#配置数据库连接
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i 's/databases_name_here/wordpress/' /var/www/html/wp-config.php
sed -i 's/username_here/root/' /var/www/html/wp-config.php
sed -i 's/password_here//' /var/www/html/wp-config.php
