#!/usr/bin/env bash

if [ -z "$(which docker 2>/dev/null)" ]; then
  echo "You need to install Docker"
  exit 0
fi

IMAGE=jalle19/libreelec-deluge
VERSION=$(cat deluge/version.txt)

docker build --rm --no-cache --tag ${IMAGE} deluge/

ID=$(docker images -q ${IMAGE} | head -n1)
docker tag ${ID} ${IMAGE}:${VERSION}
