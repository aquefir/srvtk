#!/bin/sh
#

if test "$1" = '' || test "$2" = ''; then
	echo 'Usage: chmod-files <mode> <path>';
	exit 127;
fi

find "$2" -type f -exec chmod "$1" {} \;
