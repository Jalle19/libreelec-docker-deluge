#!/bin/sh

if [ ! -f "/config/core.conf" ]; then
  cp /config.template/* /config
fi

/usr/local/bin/deluged --config=/config && \
/usr/local/bin/deluge-web -d --config=/config -p 8112
