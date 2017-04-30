#!/bin/bash
docker build -t arm .
docker run -v $(pwd):$(pwd) -w $(pwd) -t arm sh -c "snapcraft --target-arch=armhf"
