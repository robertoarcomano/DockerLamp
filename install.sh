#!/bin/bash
# Script to Create a Container for LAMP, using Docker

# 1. Download supervisor.conf
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/supervisor.conf

# 2. Download Dockerfile and create image
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/Dockerfile -q -O -|docker build -t bertolinux_lamp -

# 3. Create the container from the image
docker create -p 81:80 --name "bertolinux_lamp" bertolinux_lamp

# 4. Start the container
docker start bertolinux_lamp

# 5. Delete supervisor.conf
rm supervisor.conf
