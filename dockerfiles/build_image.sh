#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo -e "Usage: $0 <os> <version>"
    echo -e "Example: $0 ubuntu 22.04"
    exit
fi

os=${1}
version=${2}

# https://github.com/adoptium/temurin17-binaries/releases/latest
jdk=OpenJDK17U-jdk_x64_linux_hotspot_17.0.6_10.tar.gz

if [ ! -f ${jdk} ]; then
    echo "File ${jdk} not found, download"
    wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.6%2B10/OpenJDK17U-jdk_x64_linux_hotspot_17.0.6_10.tar.gz
fi

docker build --no-cache \
    -t org.tecris/${os}-${version}-jdk:23.03.26 \
    -f Dockerfile.${os}_jdk.${version} ./
