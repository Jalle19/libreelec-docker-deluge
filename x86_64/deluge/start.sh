#!/bin/sh

if [ ! -f "/config/core.conf" ]; then
  cp /config.template/* /config
fi

/usr/bin/deluged --config=/config && \
/usr/bin/deluge-web --config=/config -p 8112
