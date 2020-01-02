#!/bin/bash
set -eu

BUILD_CMD="docker-compose build --no-cache"

case "$OSTYPE" in
  darwin*)
    $BUILD_CMD web
    ;;
  linux*)
    $BUILD_CMD --build-arg UID=$(id -u) --build-arg GID=$(id -g) web
    ;;
  *)
    echo "Unknown OS Type: $OSTYPE"
    ;;
esac
