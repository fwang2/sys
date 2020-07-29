# Docker 
- [Docker](#docker)
  - [Most common operations](#most-common-operations)
    - [Pull an image](#pull-an-image)
    - [List all containers:](#list-all-containers)
    - [Attach to container](#attach-to-container)
    - [Remove all containers:](#remove-all-containers)
    - [List all images:](#list-all-images)
    - [Build image](#build-image)
    - [Run docker image with interactive shell](#run-docker-image-with-interactive-shell)

## Most common operations

### Pull an image
    docker pull ubuntu:18.04

### List all containers: 
    docker container ls -a 
This will list all containers, active or not.

### Attach to container

Assuming container id is `3c54b8070697`, we can attach it by:

    docker start 3c54b8070697 -a

### Remove all containers: 
    docker container prune

### List all images: 
    docker image ls

### Build image
First, cd to the working directory that has `Dockerfile`.

    docker build --tag fcp .

### Run docker image with interactive shell
    docker run -it ubuntu:18.04 /bin/bash

