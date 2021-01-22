#!/usr/bin/env bash

##shell script to install and configure codedeploy agent on AWS EC2 instance (Ubuntu) :

sudo apt-get update
sudo apt-get install -y ruby 
cd /home/ubuntu
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto > /tmp/logfile
sudo service codedeploy-agent start
