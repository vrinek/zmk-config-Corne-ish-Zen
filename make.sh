#!/usr/bin/env bash

set -ex

docker run -it -v $(pwd):/root/config \
    zmkfirmware/zmk-build-arm:2.5 \
    bash /root/config/make-in-docker.sh
