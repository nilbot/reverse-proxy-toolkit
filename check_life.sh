#!/usr/bin/env bash

if [ ! $# -eq 2 ];
then
	echo "Usage: $0 socket_file host";
	exit;
fi

SOCKET=$1
HOST=$2

if [ -z ${debug+"FALSE"} ]; then
	:
fi

if [ "$debug" = "TRUE" ]; then
	echo "socket_file: $SOCKET"
	echo "host: $HOST"
fi

RES=`ssh -S $SOCKET -O check $HOST 2>&1`

CHECK_RET=$?

if [ "$debug" = "TRUE" ]; then
	echo "RES: $RES"
	echo "CHECK_RET: $CHECK_RET"
fi

if [ "$debug" = "TRUE" ]; then
	echo "RES: $RES"
fi

if [ $CHECK_RET -ne 0 ]; then
	exit $CHECK_RET
fi

echo $RES | awk 'match($0,/[0-9]+/) { print substr($0, RSTART, RLENGTH) }'
