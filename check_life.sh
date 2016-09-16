#!/usr/bin/env bash

if [ ! $# -eq 2 ];
then
	echo "Usage: $0 socket_file remote_host";
	exit;
fi

SOCKET=$1
HOST=$2

RES=`ssh -S $SOCKET -O check $HOST 2>&1`
if [ $? -eq 0 ]; then
	export TUNPID=`print $RES | awk 'match($0,/[0-9]+/) { print substr($0, RSTART, RLENGTH) }'`
else
	exit 255
fi
