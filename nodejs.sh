#!/usr/bin/env bash

##shell script to install node.s,npm and pm2

echo "INSTALLING Node.js,NPM,PM2"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g pm2
sudo pm2 startup systemd

