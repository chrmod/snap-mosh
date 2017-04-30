FROM ubuntu:zesty

ENV ARCH=armhf \
 GNU_TRIPLET=arm-linux-gnueabihf \
 GNU_MULTILIB_TRIPLET=arm-linux-gnueabihf \
 CXX=arm-linux-gnueabihf-g++ \
 CC=arm-linux-gnueabihf-gcc

RUN dpkg --add-architecture $ARCH

RUN sed -i 's/deb http/deb [arch=amd64,i386] http/' /etc/apt/sources.list && \
  echo "deb [arch=$ARCH] http://ports.ubuntu.com/ zesty main universe" | tee -a /etc/apt/sources.list && \
  echo 'deb [arch=armhf] http://ports.ubuntu.com/ zesty-updates main universe' >> /etc/apt/sources.list

RUN  apt-get update && \
  apt-get install -y \
    build-essential \
    pkg-config-${GNU_TRIPLET} \
    crossbuild-essential-${ARCH} \
    snapcraft

RUN  apt-get install -y \
  libprotobuf-dev:armhf \
  libncurses5-dev:armhf \
  zlib1g-dev:armhf \
  libssl-dev:armhf
