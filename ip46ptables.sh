#!/bin/sh
#
# script to apply dual-stack iptables rules to specific addresses

if test "$2" = ''; then
	echo 'Usage: ip46ptables <ipv4addr> <ipv6addr>;';
	exit 1;
fi

ip4="$1";
ip6="$2";

shift 2;

iptables -d "$ip4" $@;
ip6tables -d "$ip6" $@;
