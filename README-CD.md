# Project 5

## Project Overview

- The goal of this project is to simulate and show github actions implementing tags, as well as up to date semantics being involved with the imaging. The second part
of the project will be to use webhooks to keep up with production.
- The reason for this project is to create a clearer understanding on the workings of github actions as well as the use of webhooks.
- Some of the tools I am going to use for this project are AWS Academy, google + any sites found using google(lol), and dockerhub (mainly desktop).

## Semantic Versioning

- To generate a tag in git/github, you can do it one of two main ways. First is to go to your github repo on the website, and select `release`. Then, by hitting `create a new release` and then filling out the required information, you should have a set tagname for your branch. To do it in commandline, which is what I did, you  need to use the `git tage <tagename>` command. This will set the tagname to the current branch you are working in. Tags are created locally and wont be automatically included with your push. To make the tag pushed, us the `git push origins --tag`.
- This alters the workflow of your github actions because once this is added to your actions file, you will push from github to then have your workflow check tags and branches and then push those tags to dockerhub, who will organize and show images based on those tags.
- Link to dockerhub repo: [LINK](https://hub.docker.com/repository/docker/carsonehenry/3120cicd/general)

## Deployment

- 
