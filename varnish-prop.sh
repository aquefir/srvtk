#!/bin/sh
#

## This script is to be called by cron daily.
##
## It reboots the varnishd process to periodically refresh stale DNS
## resolution of dynamic rDNS queries it might have to resolve for its
## backends. This is done by `killall` followed by a loop to start up
## varnishd with our chosen parameters, since DNS resolution is fickle
## (it usually sticks after a few attempts).

killall varnishd;

_mem="$(echo $(cat /proc/meminfo | grep MemTotal | xargs \
	| cut -d' ' -f 2)' / 2 / 1024' | bc)M";

until varnishd -s malloc,${_mem} -a 127.0.0.1:81 \
	-f /etc/varnish/default.vcl; do sleep 1; done
