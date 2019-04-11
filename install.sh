#!/bin/bash
# Script to Create a Container for LAMP, using Docker

# 1. Download supervisor.conf /tmp/Dockerfile
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/supervisord.conf -q -O /tmp/supervisord.conf
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/Dockerfile -q -O /tmp/Dockerfile

# 2. Download Dockerfile and create image
cd /tmp
docker build -t bertolinux_lamp .

# 3. Create the container from the image
docker create -p 81:80 --name "bertolinux_lamp" bertolinux_lamp

# 4. Start the container
docker start bertolinux_lamp

# 5. Delete supervisor.conf /tmp/Dockerfile
rm /tmp/supervisord.conf /tmp/Dockerfile
