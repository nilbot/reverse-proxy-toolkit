#!/usr/bin/env bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 socket_file host"
	exit 1
fi

SOCKET=$1
HOST=$2

if [ ! -e $SOCKET ]; then
	echo "no socket file, do nothing"
	exit 1
fi

ssh -S $SOCKET -O exit $HOST
