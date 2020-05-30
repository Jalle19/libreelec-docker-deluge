FROM ubuntu:bionic
LABEL MAINTAINER="neggelandia@gmail.com"

ENV DELUGE_URL ${DELUGE_URL:-https://ftp.osuosl.org/pub/deluge/source/2.0/deluge-2.0.3.tar.xz}
ENV DEBIAN_FRONTEND=noninteractive

RUN \
  # install build and runtime dependencies
  apt-get -y update && \
  apt-get -y install python3-libtorrent \
    python3-geoip python3-dbus \
    python3-gi \
    python3-gi-cairo \
    python3-setuptools \
    gir1.2-gtk-3.0 \
    gir1.2-appindicator3 \
    libnotify4 \
    librsvg2-common xdg-utils \
    python3-dev \
    curl \
    python3-pip \
    python3-markupsafe \
    intltool \
    xz-utils \
    build-essential \
    libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python3-tk \
    libharfbuzz-dev libfribidi-dev libxcb1-dev \ 
    libffi-dev \
    libssl-dev \
&& \
  # download and build deluge
  cd /usr/src && \
  curl -L $DELUGE_URL | tar -C /usr/src -xJf - && \
  cd /usr/src/deluge-* && \
  python3 setup.py build && \
  python3 setup.py install \
&& \
  # cleanup unnecessary files installed during our process
  rm -rf \
    /usr/local/bin/deluge \
    /usr/local/bin/deluge-gtk \
    /usr/src \
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
