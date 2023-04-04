#!/bin/bash

sudo su

yum update -y

yum install -y httpd.x86_64

systemctl start httpd.service

echo " " > /var/www/html/index.html

curl -s http://169.254.169.254/latest/meta-data/public-ipv4 > /var/www/html/index.html