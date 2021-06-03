#!/bin/bash

launch_cmd="java -Xms$RAM -Xmx$RAM -jar /paper.jar --nogui"

_ask() {
	read -p "$*" -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		return 0
	fi
	return 1
}

_send_input() {
	screen -S $SESSION -p 0 -X stuff "$*"
}

_start() {
	screen -dmS $SESSION $launch_cmd
}

_stop() {
	_send_input $'\003'
}

case $0 in
*"start")
	cd $SDIR
	echo "Starting..."
	_start
	;;
*"reload")
	cd $SDIR
	echo "Reloading..."
	_stop
	sleep 5
	_start
	;;
*"stop")
	echo "Stopping..."
	_stop
	;;
*"console")
	while true; do
		screen -x $SESSION >/dev/null 2>&1 || echo "Cannot attach to console. Server is probably not running" 
		_ask "Relaunch console? [y/n] " || exit
	done
	;;
*"execute")
	_send_input "$*^M"
	;;
*"version")
	$launch_cmd --version
	;;
*)
	echo "Unknown action"
	exit
	;;
esac
