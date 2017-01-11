#!/usr/bin/env bash

usage() {
  echo "$0 <container> <arch>"
}

if [ -z "$1" -a -z "$2" ]; then
  usage
  exit 0
fi

if [ -z "$(which docker 2>/dev/null)" ]; then
  echo "You need to install Docker"
  exit 0
fi

CONTAINER=$1
ARCH=$2

case $ARCH in
  x86_64)
    IMAGE=libreelec/${CONTAINER}
    ;;
  arm)
    IMAGE=libreelecarm/${CONTAINER}
    ;;
esac

VERSION=$(cat ${ARCH}/${CONTAINER}/version.txt)

docker build --rm --no-cache --tag ${IMAGE} ${ARCH}/${CONTAINER}/

ID=$(docker images -q ${IMAGE} | head -n1)
docker tag ${ID} ${IMAGE}:${VERSION}
