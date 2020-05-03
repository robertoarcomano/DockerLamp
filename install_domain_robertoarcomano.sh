#!/bin/bash
# Script to Create a Container for LAMP, using Docker

# 1. Download git repository
git clone -b domain_robertoarcomano https://github.com/robertoarcomano/DockerLamp.git /tmp/DockerLamp
cd /tmp/DockerLamp

# 2. Download Dockerfile and create image
docker build -t dockerlamp .

# 3. Create the container from the image
docker create -p 81:80 --name "dockerlamp" dockerlamp

# 4. Start the container
docker start dockerlamp

# 5. Delete supervisor.conf /tmp/Dockerfile
cd 
rm -rf /tmp/DockerLamp
