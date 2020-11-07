#!/bin/bash

ROOT_PATH="$(realpath $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"

DOCKER=$(which docker)
DOCKERFILE=${ROOT_PATH}/Dockerfile
IMAGE="br_rpi2_image"
NAME="br_rpi2"

echo "Docker binary:        \"${DOCKER}\""
echo "Dockerfile:           \"${DOCKERFILE}\""
echo "Repository root path: \"${ROOT_PATH}\""
echo "Image:                \"${IMAGE}\""
echo "Name:                 \"${NAME}\""
echo -n "Task:                 "

if [ "$#" -eq 1 ] && [ "$1" == "BUILD" ]; then
    echo "Building container"
    $DOCKER build -f ${DOCKERFILE} -t $IMAGE .
    exit $?
elif [ "$#" -eq 0 ]; then
    echo "Running image with interactive terminal"
    echo ""
    echo "===== The image \"${IMAGE}\" is now running - Type \"exit\" to quit ====="
    echo ""
    $DOCKER run -it --rm --mount src="${ROOT_PATH}",target=/buildroot,type=bind --name $NAME $IMAGE
    exit $?
else
    echo "Running image $IMAGE with command \"${@:1}\""
    echo ""
    echo "===== The image \"${IMAGE}\" is now running - Wait for the command to finish or press CTRL^C ====="
    $DOCKER run --rm --mount src="${ROOT_PATH}",target=/buildroot,type=bind --name $NAME $IMAGE ${@:1}
    exit $?
fi
