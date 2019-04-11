## Commands to create a working LAMP container using Docker

# 1. Create the image using Dockerfile
docker build -t bertolinux_lamp .

# 2. Create the container from the image
docker create --name "bertolinux_lamp" bertolinux_lamp

# 3. Start the container
docker start bertolinux_lamp

# 4. Connect to the container
docker exec -it bertolinux_lamp /bin/bash
