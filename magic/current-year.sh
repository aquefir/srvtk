#!/bin/sh
#

stdbuf -o0 /bin/echo 'Content-type: text/html';
stdbuf -o0 /bin/echo '';
stdbuf -o0 /bin/date -u '+%Y';
