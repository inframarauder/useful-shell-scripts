#!/usr/bin/env bash

echo "
-----------------------
UPDATING PACKAGES
-----------------------
"
sudo apt-get update

echo "
------------------------------
  INSTALLING Node.js & NPM
------------------------------
"
#install node.js 14.x and npm
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

node -v
npm -v

echo "
----------------------
 INSTALLING MongoDB
----------------------
"
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

echo "
-----------------------
STARTING MongoDB
-----------------------
"
sudo systemctl start mongod
sudo systemctl enable mongod

echo "
----------------------
 INSTALLING  PM2
----------------------
"

# install pm2 with npm
sudo npm install -g pm2

# set pm2 to start automatically on system startup
sudo pm2 startup systemd


echo "
----------------------
  NGINX
----------------------
"

# install nginx
sudo apt-get install -y nginx


echo "
----------------------
  UFW (FIREWALL)
----------------------
"

# allow ssh connections through firewall
sudo ufw allow OpenSSH

# allow http & https through firewall
sudo ufw allow 'Nginx Full'

# enable firewall
sudo ufw --force enable