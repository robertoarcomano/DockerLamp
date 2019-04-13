#!/bin/bash
# Script to Create a Container for LAMP, using Docker

# 1. Download git repository
git clone https://github.com/robertoarcomano/DockerLamp.git /tmp/DockerLamp
cd /tmp/DockerLamp

# 2. Download Dockerfile and create image
docker build -t bertolinux_lamp .

# 3. Create the container from the image
docker create -p 81:80 --name "bertolinux_lamp" bertolinux_lamp

# 4. Start the container
docker start bertolinux_lamp

# 5. Delete supervisor.conf /tmp/Dockerfile
cd 
rm -rf /tmp/DockerLamp
