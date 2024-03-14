#!/bin/bash
sudo yum install httpd -y
sudo yum install epel-release -y
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php74
sudo yum install php -y
sudo systemctl restart httpd
sudo systemctl enable httpd
sudo yum install wget -y
wget https://wordpress.org/latest.tar.gz
sudo tar -xf latest.tar.gz -C /var/www/html/
sudo mv /var/www/html/wordpress/* /var/www/html/
sudo cp /var/www/html/wp-config-sample.php  /var/www/html/wp-config.php
sudo sed 's/database_name_here/db-wordpress/g' /var/www/html/wp-config.php -i
sudo sed 's/username_here/wordpress@team2sql-class2azure/g' /var/www/html/wp-config.php -i
sudo sed 's/password_here/W0rdpr3ss@p4ss/g' /var/www/html/wp-config.php -i
sudo sed 's/localhost/team2sql-class2azure.mysql.database.azure.com/g' /var/www/html/wp-config.php -i
DBNAME="db-wordpress"
sudo yum install php-mysql mysql -y
sudo systemctl restart httpd
getenforce
sudo sed 's/SELINUX=permissive/SELINUX=enforcing/g' /etc/sysconfig/selinux -i
setenforce 0
sudo chown -R apache:apache /var/www/html/
sudo systemctl restart httpd