#!/bin/bash
# Script to Create a Container for LAMP, using Docker

# 1. Download Dockerfile and create image
wget https://raw.githubusercontent.com/robertoarcomano/DockerLamp/master/Dockerfile -q -O -|docker build -t bertolinux_lamp -

# 2. Create the container from the image
docker create --name "bertolinux_lamp" bertolinux_lamp

# 3. Start the container
docker start bertolinux_lamp
