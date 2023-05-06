#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo -e "Usage: $0 <os> <version>"
    echo -e "Example: $0 ubuntu 22.04"
    exit
fi

os=${1}
os_version=${2}

# https://github.com/adoptium/temurin17-binaries/releases/latest
# given release jdk-17.0.7+7 -> jdk_version: 17.0.7 jdk_version_patch: 7
jdk_version=17.0.7
jdk_version_patch=7
jdk_file_name=OpenJDK17U-jdk_x64_linux_hotspot_${jdk_version}_${jdk_version_patch}.tar.gz


if [ ! -f ${jdk_file_name} ]; then
    echo "File ${jdk_file_name} not found, downloading"
    wget "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-${jdk_version}+${jdk_version_patch}/${jdk_file_name}"
fi

docker buildx build \
    --build-arg jdk_version=${jdk_version} \
    --build-arg jdk_version_patch=${jdk_version_patch} \
    --no-cache \
    --progress=plain \
    -t org.tecris/${os}-${os_version}-jdk:23.05.06 \
    -f Dockerfile.${os}_jdk.${os_version} \
    ./
