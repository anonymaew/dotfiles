#!/bin/sh   
IMAGE=anonymaew/dotfiles

# check if docker cli is installed
if ! [ -x $(command -v docker) ]; then
    echo 'Error: docker cli is not installed.' >&2
    exit 1
fi

# build an image if it does not exist
if [ -z $(docker images -q $IMAGE) ]; then
    docker build -t "$IMAGE" $(dirname "$0")
fi

# spin up a test container
docker run --rm -it --name "test-container" "$IMAGE"
