FROM ubuntu:bionic
MAINTAINER neggelandia@gmail.com

# ARG DELUGE_URL
ENV DELUGE_URL ${DELUGE_URL:-https://ftp.osuosl.org/pub/deluge/source/deluge-1.3.15.tar.bz2}

RUN \
  # install build and runtime dependencies
  apt-get -y update && \
  apt-get -y build-dep deluge && \
  apt-get -y install curl \
&& \
  # download and build deluge
  mkdir /src && \
  curl -L $DELUGE_URL | tar -C /src -xjf - \
  && \
  cd /src/deluge-* && \
  python setup.py build && \
  python setup.py install \
&& \
  # cleanup unnecessary files installed during our process
  rm -rf \
    /usr/local/bin/deluge \
    /usr/local/bin/deluge-gtk \
    /src \
    /usr/local/lib/python*/site-packages/deluge-*-py*.egg/share/pixmaps \
    /usr/local/lib/python*/site-packages/deluge-*-py*.egg/share/man \
    /usr/local/lib/python*/site-packages/deluge-*-py*.egg/deluge/ui/gtkui \
&& \
  rm -rf \
  /var/lib/apt/lists/* \
  /root/.cache \
  /tmp/*

ADD config /config.template

VOLUME ["/storage", "/watch", "/config", "/var/media"]

ADD start.sh /start.sh

EXPOSE 53160 53160/udp 8112 58846

CMD ["/bin/sh", "/start.sh"]
