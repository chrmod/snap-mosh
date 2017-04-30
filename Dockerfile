FROM ubuntu:xenial

ENV ARCH=armhf \
 GNU_TRIPLET=arm-linux-gnueabihf \
 GNU_MULTILIB_TRIPLET=arm-linux-gnueabihf \
 CXX=arm-linux-gnueabihf-g++ \
 CC=arm-linux-gnueabihf-gcc

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN dpkg --add-architecture $ARCH; dpkg --add-architecture i386

RUN sed -i 's/deb http/deb [arch=amd64,i386] http/' /etc/apt/sources.list \
  echo "deb [arch=$ARCH] http://ports.ubuntu.com/ xenial main universe multiverse restricted" | tee -a /etc/apt/sources.list;\
  echo 'deb [arch=armhf] http://ports.ubuntu.com/ xenial-updates main universe restricted' >> /etc/apt/sources.list;

RUN cat /etc/apt/sources.list

RUN apt-get update -yq; \
  apt-get install -y \
    pkg-config-${GNU_TRIPLET} \
    crossbuild-essential-${ARCH} \
    snapcraft \
    libprotobuf-dev \
  && rm -rf /var/lib/apt/lists/*
