#!/usr/bin/env bash

if [ ! $# -eq 5 ];
then
	echo "Usage: $0 socket_file local_port remote_listen remote_port host";
	exit;
fi

SOCKET=$1
LPORT=$2
RLISTEN=$3
RPORT=$4
HOST=$5

ssh -M -S $SOCKET -fnNT -L $LPORT:$RLISTEN:$RPORT $HOST

if [ $? -ne 0 ];then
	exit 255
else
	exit 0
fi