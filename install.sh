#!/bin/bash
# Script to Create a Container for LAMP, using Docker

# 1. Download supervisor.conf /tmp/Dockerfile
mkdir /tmp/bertolinux_lamp
cd /tmp/bertolinux_lamp
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/supervisord.conf
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/Dockerfile
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/index.php
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/db.sql

# 2. Download Dockerfile and create image
docker build -t bertolinux_lamp .

# 3. Create the container from the image
docker create -p 81:80 --name "bertolinux_lamp" bertolinux_lamp

# 4. Start the container
docker start bertolinux_lamp

# 5. Delete supervisor.conf /tmp/Dockerfile
cd 
rm -rf /tmp/bertolinux_lamp
