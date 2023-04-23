#!/bin/sh   
IMAGE=napatsc/dev

if ! [ -x "$(command -v docker)" ]; then
    echo 'Error: docker cli is not installed.' >&2
    exit 1
fi

docker build -t "$IMAGE" ./ && \
docker run --rm -it "$IMAGE" /bin/sh
