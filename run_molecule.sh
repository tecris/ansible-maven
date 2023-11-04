#!/bin/bash

# set -x

docker run --rm -it \
    -v $(pwd):/molecule/ansible-maven \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /molecule/ansible-maven \
    org.tecris/molecule6:23.11.04 \
    "$@"
