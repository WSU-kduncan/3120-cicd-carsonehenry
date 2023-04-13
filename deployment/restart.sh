#!/bin/bash
# Pull the latest image
docker container restart CONTAINER cdcontainer

docker pull carsonehenry/3120cicd:latest

#Stop and remove the existing container
docker stop site
docker ps -a
docker rm site
docker ps -a
docker images

# Run the new image
docker run -d -p 80:80 --name site carsonehenry/3120cicd:latest


