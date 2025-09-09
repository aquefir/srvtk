#!/bin/sh
#

if test "$1" = '' || test "$2" = ''; then
	echo 'Usage: chmod-dirs <mode> <path>';
	exit 1;
fi

find "$2" -type d -exec chmod "$1" {} \;
