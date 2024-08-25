#!/bin/bash

# https://github.com/adoptium/temurin21-binaries/releases/latest
# given release jdk-21.0.4+7 -> jdk_version: 21.0.4 jdk_version_patch: 7
jdk_major_version=21
jdk_version=${jdk_major_version}.0.4
jdk_version_patch=7
jdk_file_name=OpenJDK${jdk_major_version}U-jdk_x64_linux_hotspot_${jdk_version}_${jdk_version_patch}.tar.gz


if [ ! -f ${jdk_file_name} ]; then
    echo "File ${jdk_file_name} not found, downloading"
    wget "https://github.com/adoptium/temurin${jdk_major_version}-binaries/releases/download/jdk-${jdk_version}+${jdk_version_patch}/${jdk_file_name}"
fi

IMAGE_TAG=$(date +"%y.%m.%d")

function build_image() {
  os=${1}
  os_version=${2}
  IMAGE_NAME=org.tecris/${os}-${os_version}-jdk:${IMAGE_TAG}
  echo "=================================================="
  echo "building: ${IMAGE_NAME}"
  echo "=================================================="

  docker buildx use default    # to be able to use local images
  docker buildx build \
    --build-arg jdk_version=${jdk_version} \
    --build-arg jdk_version_patch=${jdk_version_patch} \
    --build-arg TAG=${IMAGE_TAG} \
    --no-cache \
    --progress=plain \
    --load \
    -t ${IMAGE_NAME} \
    -f Dockerfile.${os}_jdk.${os_version} \
    ./

}

declare -A distrubution_array
distrubution_array[debian]="11,12"
distrubution_array[ubuntu]="20.04,22.04,24.04"

for distribution in "${!distrubution_array[@]}"
do
  os=${distribution}
  os_version_list=${distrubution_array[${distribution}]}
  for os_version in ${distrubution_array[${distribution}]//,/ }
  do
    build_image ${os} ${os_version}
  done
done
