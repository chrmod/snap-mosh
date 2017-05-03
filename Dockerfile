FROM chrmod/snapcraft-raspberrypi

RUN  apt-get install -y \
  libprotobuf-dev:armhf \
  libncurses5-dev:armhf \
  zlib1g-dev:armhf \
  libssl-dev:armhf
