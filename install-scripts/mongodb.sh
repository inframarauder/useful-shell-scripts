#!/usr/bin/env bash

##shell script to install mongodb and configure it as a service:

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