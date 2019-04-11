#!/bin/bash

# Download Dockerfile and execute script
wget -q https://github.com/robertoarcomano/DockerLamp/archive/master.zip
unzip master.zip
rm master.zip
cd DockerLamp-master
sh ./create_lamp.sh 
