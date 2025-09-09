#!/bin/sh
#

# Generate a new month of the day, every day.

if command -v python3 >/dev/null; then
	month=$(python3 -c "m=['January','February','March','April',\
'May','June','July','August','September','October','November',\
'December'];from random import randrange as r;print(\
m[r(len(m))])")
else
	month=Unpythonuary
fi

echo='stdbuf -o0 /bin/echo';
# try to get coreutils' echo if available
command -v gecho >/dev/null && echo='stdbuf -o0 gecho';

${echo} 'Welcome to NICER 716, the fastest spinning neutron star in';
${echo} 'the Milky Way.';
${echo} '';
${echo} "The Month of the Day is ${month}.";
${echo} '';
${echo} 'Websites are stored in /srv/{static,dynamic,hybrid}.';
${echo} 'static = SHiTMaiL, dynamic = rev. proxy, hybrid = PHP 7.';
${echo} 'static/public = as served, static/private = code repos.';
${echo} '';
