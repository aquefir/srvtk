#!/bin/sh
#
# script to apply the comprehensive public firewall with iptables
# install ip46ptables and ip46tables scripts before using this

ip4="$(cat /etc/myip4)";
ip6="$(cat /etc/myip6)";

if test "$ip4" = '' || test "$ip6" = ''; then
	echo 'either ipv4 or ipv6 addresses are not available.';
	echo 'make sure /etc/myip{4,6} is populated and valid.';
	exit 1;
fi

ip46tables -F;
ip46tables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP;
ip46tables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP;
ip46tables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP;
ip46tables -A INPUT -p udp --dport 547 -m limit --limit 10/min \
	--limit-burst 5 -j ACCEPT;
ip46tables -A OUTPUT -p udp --sport 546 -j ACCEPT;
ip46tables -A INPUT -i lo -j ACCEPT;
ip46tables -A OUTPUT -j ACCEPT;
# ensure ping is permitted
ip46tables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT;
# 22: SSH
ip46ptables $ip4 $ip6 -A INPUT -p tcp --dport 22 -j ACCEPT;
# 80: HTTP
ip46ptables $ip4 $ip6 -A INPUT -p tcp --dport 80 -j ACCEPT;
# 113: ident
#ip46ptables $ip4 $ip6 -A INPUT -p tcp --dport 113 -j ACCEPT;
# 443: HTTPS
ip46ptables $ip4 $ip6 -A INPUT -p tcp --dport 443 -j ACCEPT;
# 58868: ZNC
# n.b. (u16)58868 == ~(u16)6667
#ip46ptables $ip4 $ip6 -A INPUT -p tcp --dport 58868 -j ACCEPT;
# 25565: Minecraft Java Edition
#ip46ptables $ip4 $ip6 -A INPUT -p tcp --dport 25565 -j ACCEPT;
# 19132: Minecraft Bedrock Edition
#ip46ptables $ip4 $ip6 -A INPUT -p udp --dport 19132 -j ACCEPT;
#ip46ptables $ip4 $ip6 -A INPUT -p udp --dport 19133 -j ACCEPT;
#ip46ptables $ip4 $ip6 -A INPUT -p udp --dport 51413 -j ACCEPT;

ip46tables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT;
ip46tables -P OUTPUT ACCEPT;
ip46tables -P INPUT DROP;
ip46tables -L;
