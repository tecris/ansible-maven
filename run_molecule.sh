#!/bin/bash

# set -x
 
IMAGE_TAG=$(date +"%y.%m.%d")

docker run --rm -it \
    -v $(pwd):/molecule/ansible-maven \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /molecule/ansible-maven \
    tecristea/molecule6:24.01.20 \
    "$@"
