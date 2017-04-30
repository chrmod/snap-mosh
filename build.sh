#!/bin/bash
set -e

docker build -t arm .
docker run -v $(pwd):$(pwd) -w $(pwd) -t arm sh -c "snapcraft clean; snapcraft --target-arch=armhf"
