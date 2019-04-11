#!/bin/bash
# Script to Create a Container for LAMP, using Docker

# 1. Download Dockerfile
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/Dockerfile

# 2. Create the image using Dockerfile
docker build -t bertolinux_lamp .

# 3. Create the container from the image
docker create --name "bertolinux_lamp" bertolinux_lamp

# 4. Start the container
docker start bertolinux_lamp

# 5. Connect to the container
docker exec -it bertolinux_lamp /bin/bash
