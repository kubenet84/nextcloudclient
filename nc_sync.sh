#!/bin/bash

mkdir -p "$HOME/tmp"
PIDFILE="$HOME/tmp/nextcloudcmd.pid"



if [ -e "${PIDFILE}" ] && (ps -u $(whoami) -opid= |
                           grep -P "^\s*$(cat ${PIDFILE})$" &> /dev/null); then
  #echo "Already running."
  exit 99
fi

echo "Init sync between Server $NC_SERVER$NC_SERVER_PATH and local path $NC_LOCAL_PATH"
if [ -z "$NC_PARAMS" ]
	then
		/usr/bin/nextcloudcmd -u "$NC_USER" -p "$NC_PASS" --path "$NC_SERVER_PATH" --non-interactive "$NC_LOCAL_PATH" "$NC_SERVER" &
	else
		/usr/bin/nextcloudcmd -u "$NC_USER" -p "$NC_PASS" --path "$NC_SERVER_PATH" $NC_PARAMS --non-interactive "$NC_LOCAL_PATH" "$NC_SERVER" &
 fi


echo $! > "${PIDFILE}"
chmod 644 "${PIDFILE}"
