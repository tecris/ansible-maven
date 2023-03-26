#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo -e "Usage: $0 <os> <version>"
    echo -e "Example: $0 ubuntu 22.04"
    exit
fi

os=${1}
version=${2}

docker build -t org.tecris/${os}.${version}-jdk:23.03.26 -f Dockerfile.${os}_jdk.${version} ./
#docker build --no-cache -t org.tecris/${os}.${version}-jdk:23.03.26 -f Dockerfile.${os}_jdk.${version} ./
