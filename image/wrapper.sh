#!/bin/bash

launch_cmd=(java -Xms"$RAM" -Xmx"$RAM" -jar "$PAPER_JAR" --nogui)

case $0 in
*"start")
	"${launch_cmd[@]}" "$@"
	;;
*"version")
	java --version
	"${launch_cmd[@]}" --version
	;;
*)
	echo "Unknown action"
	exit
	;;
esac
