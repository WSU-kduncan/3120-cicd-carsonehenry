# Part 1 - Dockerize it

## Description
- For this project I am going to be working closely with Docker and Dockerhub (Docker Desktop as well but that is just the interface software, you dont need to use it). The goal of this would be to successfully create and integrate a Dockerfile with a working container. Inside that container will be webserver files that will operate a working localhost webserver. The reason I am doing this is that containers make the workload portable and compressed. The tools that I will be using are Docker, nginx, and wsl2.

![HENRY-CI-DIAGRAM](images/HENRY-CI-DIAGRAM.png)

- You install wsl2 by going into command prompt and running wsl -install, and on ubuntu you can check the version of the wsl you are using by `wsl.exe -l -v`.
- You install docker by running a series of commands. The first commands are the basic up to date commands like `sudo apt update`. Following this command will be `sudo apt install docker.io` and `sudo snap install docker`. Check to make sure the correct version is installed with `docker --version`.
- In order to create an image, first we need a `Dockerfile`. The file needs to be named exactly `Dockerfile`. Once the Dockerfile is created, you need to then write the contents. Things like `FROM` to pull the version image, and `RUN` to run the startup commands.
- Using the `docker build -t nginx:1.0 .` command, we will build the image off of the Dockerfile. To check if the image is created, use `docker images` to see a list of all created images. You may need to use sudo. You can change `1.0` because that is just the tag name. It is latest by default, or you can make it a name of your choice.
- In order to run the container, for me the command used was `docker run -d -p 9090:80 --name webserver nginx:1.0`. In order to see if the command worked, check the docker containers using the `docker ps` command. You may need to use the `sudo docker ps -a` command as the container will only be visible with the initial command if its active, if its not active the second command will need to be used.
- To check if the project is running, simply open a web browser and enter `http://<host-ip>:9090`, or whatever port you set the Dockerfile to be listed under. Obviously change host-ip to be whatever ip you are using.

# Part 2 - Github Actions and Dockerhub

- In order to create a public dockerhub repo, sign up and once you are logged into their site, go to create repository. Under visibility, select public and the hit create.
- In order to authenticate via CLI to dockerhub, you can simply use the `docker login` command which will prompt for a username and password. The most secure way of doing this would be to create a 2FA access token through their site. Following `Profile -> Security -> Access Token`, you can create an access token. It is similar to a github key, you need to keep track of the token key because you will not get it again later. This is my recommended route of logging in as not only is it more secure but it is decently convenient.
- In order to push a container image to Dockerhub, use the command `docker push repo:[tag]`. This is similar to git push.
- To set a Github secret, follow `Repository Main Page -> Settings -> Secrets` or you may need to follow this `Repository Main Page -> Settings -> Environments -> Select an Environment -> Add Secret`.
- The secrets for this project are going to be one evironment secret and one `${{ secrets.HENRY_CI_SECRET }}` secret. They obviously need to go hand in hand as they coincide with one another.
- Github workflows are a part of Github actions that allow you to build and test every pull to your repository. Likely, you'll configure Github workflows to trigger based off of certain events, which then activate jobs to do certain actions `Workflow -> Event Trigger -> Job -> Action`. The parts of this workflow that are custom to this project are the custom event triggers that I made. Inside the action yml, I created custom event triggers in order to activate certain responses.
