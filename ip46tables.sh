#!/bin/sh
#
# script to apply dual-stack iptables rules

iptables $*;
ip6tables $*;
