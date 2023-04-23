#!/bin/sh   
IMAGE=napatsc/dev

# check if docker cli is installed
if ! [ -x $(command -v docker) ]; then
    echo 'Error: docker cli is not installed.' >&2
    exit 1
fi

# build an image if it does not exist
if [ -z $(docker images -q) ]; then
    docker build -t "$IMAGE" ./
fi

# spin up a test container
docker run --rm -it --name "test-container" "$IMAGE" /bin/sh -c "source .profile"
