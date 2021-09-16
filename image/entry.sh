#!/bin/bash

err() {
	echo -e "\e[1;31m[✘]\e[0m $*"
}

if [ ! -r "$PAPER_JAR" ]; then
	err "Cannot find PaperMC version $VERSION build $BUILD, downloading..."
	wget "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$BUILD/downloads/paper-$VERSION-$BUILD.jar" -O "$PAPER_JAR"
fi

test -r eula.txt && source eula.txt
if [ "$eula" = "true" ]; then
	if [ ! -r "eula.txt" ]; then
		echo "eula=true" >eula.txt
	fi
else
	start
	err "You need to agree to the EULA (eula.txt)"
	exit
fi

start