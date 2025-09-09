#!/bin/sh
#

cwd="$(pwd)";
CDPATH= cd /etc/periodic/daily;
ln -sf ../../../usr/local/bin/sentry;
ln -sf ../../../usr/local/bin/varnish-prop;
CDPATH= cd ../hourly;
ln -sf ../../../usr/local/bin/permiss;
CDPATH= cd /etc/nginx;
mkdir -p available enabled;
CDPATH= cd "${cwd}";
