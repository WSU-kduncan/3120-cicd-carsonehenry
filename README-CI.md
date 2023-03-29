# Part 1 - Dockerize it

- For this project I am going to be working closely with Docker and Dockerhub. The goal of this would be to successfully create and integrate a Dockerfile with a working container. Inside that container will be webserver files that will operate a working localhost webserver. The reason I am doing this is that containers make the workload portable and compressed. The tools that I will be using are Docker, nginx, and wsl2.
- You install wsl2 by going into command prompt and running wsl -install, and on ubuntu you can check the version of the wsl you are using by `wsl.exe -l -v`.
- You install docker by running a series of commands. The first commands are the basic up to date commands like `sudo apt update`. Following this command will be `sudo apt install docker.io` and `sudo snap install docker`. Check to make sure the correct version is installed with `docker --version`.
- In order to create an image, first we need a `Dockerfile`. The file needs to be named exactly `Dockerfile`. Once the Dockerfile is created, you need to then write the contents. Things like `FROM` to pull the version image, and `RUN` to run the startup commands.
- Using the `docker build -t nginx:1.0 .` command, we will build the image off of the Dockerfile. To check if the image is created, use `docker images` to see a list of all created images. You may need to use sudo. You can change `1.0` because that is just the tag name. It is latest by default, or you can make it a name of your choice.
- In order to run the container, for me the command used was `docker run -d -p 9090:80 --name webserver nginx:1.0`. In order to see if the command worked, check the docker containers using the `docker ps` command. You may need to use the `sudo docker ps -a` command as the container will only be visible with the initial command if its active, if its not active the second command will need to be used.
- To check if the project is running, simply open a web browser and enter `http://<host-ip>:9090`, or whatever port you set the Dockerfile to be listed under. Obviously change host-ip to be whatever ip you are using.

# Part 2 - Github Actions and Dockerhub



