#!/bin/sh
#

## permission fixer

chown -R nginx:nginx /etc/letsencrypt;
chown -R nginx:nginx /etc/nginx;
chown -R varnish:varnish /etc/varnish;
chown -R nginx:nginx /var/lib/nginx;
chown -R varnish:varnish /var/lib/varnish;
chown -R nginx:nginx /var/log/nginx;
chown -R varnish:varnish /var/log/varnish;

chmod 700 /etc/acpi;
chmod 700 /etc/grub.d;
chmod 700 /etc/letsencrypt;
chmod 750 /etc/nginx;
chmod 750 /etc/varnish;
chmod-files 755 /usr/local/bin;
chmod 750 /var/lib/nginx;
chmod 750 /var/lib/varnish;
chmod 750 /var/log/nginx;
chmod 750 /var/log/varnish;
