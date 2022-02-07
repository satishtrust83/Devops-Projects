#!/bin/bash
sudo su -
apt-get update
apt-get install -y apache2
cd /var/www/html
rm index.html
echo "<h1>This is terraform practice</h1>" > index.html
service apache2 start
chkconfig apache2 on #to handle when machine rebooted.
