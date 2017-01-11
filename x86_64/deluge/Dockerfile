# requires docker > 1.9 to build [supports ARG variable]
# requires docker > 1.8 to build [supports ENV variable]

FROM alpine:3.5
MAINTAINER docker@libreelec.tv

# ARG DELUGE_URL
ENV DELUGE_URL ${DELUGE_URL:-http://download.deluge-torrent.org/source/deluge-1.3.13.tar.bz2}

RUN \
  # add @testing apk repository (for libtorrent-rasterbar)
  echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \

&& \
  # install build and runtime dependencies
  apk add --update \
    boost \
    curl \
    gcc \
    geoip \
    geoip-dev \
    libffi \
    libffi-dev \
    libtorrent-rasterbar@testing \
    musl-dev \
    python \
    python-dev \
    py-setuptools \
    openssl \
    openssl-dev \

&& \
  # install pip as we will use this to install needed python modules
  apk add \
    py2-pip \

&& \
  # update pip
  pip install --upgrade pip && \
  # install required python modules
  pip install --no-cache-dir --upgrade setuptools && \
  pip install --no-cache-dir --upgrade enum && \
  pip install --no-cache-dir --upgrade service_identity && \
  pip install --no-cache-dir --upgrade twisted && \
  pip install --no-cache-dir --upgrade zope.interface && \
  pip install --no-cache-dir --upgrade chardet && \
  pip install --no-cache-dir --upgrade pyOpenSSL && \
  pip install --no-cache-dir --upgrade mako && \
  pip install --no-cache-dir --upgrade pyxdg \

&& \
  # download and build deluge
  mkdir /src && \
  curl -L $DELUGE_URL | tar -C /src -xjf - \
  && \
  cd /src/deluge-* && \
  python setup.py build && \
  python setup.py install --prefix=/usr \

&& \
  # cleanup unnecessary files installed during our process
  rm -rf \
    /usr/include/boost \
    /usr/include/libtorrent \
    /usr/share/pixmaps \
    /usr/share/applications \
    /usr/bin/deluge \
    /usr/bin/deluge-gtk \
    /src \
    /usr/lib/python*/site-packages/deluge-*-py*.egg/share/pixmaps \
    /usr/lib/python*/site-packages/deluge-*-py*.egg/share/man \
    /usr/lib/python*/site-packages/deluge-*-py*.egg/deluge/ui/gtkui \

&& \
  # strip debug symbols from our new libs
  strip -d /usr/lib/*.so.* \

&& \
  # remove the build dependencies and cleanup
  apk del --purge \
    libffi-dev \
    gcc \
    geoip-dev \
    musl-dev \
    py2-pip \
    python-dev \
    openssl-dev \
  && \
  rm -rf \
    /var/cache/apk/* \
    /root/.cache \
    /tmp/*

ADD config /config.template

VOLUME ["/storage", "/watch", "/config"]

ADD ./start.sh /start.sh

EXPOSE 53160 53160/udp 8112 58846

CMD ["/bin/sh", "/start.sh"]
