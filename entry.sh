err() {
	echo -e "\e[1;31m[✘]\e[0m $*"
}

if [ ! -f "$PAPER_JAR" ]; then
	err "Cannot find PaperMC version $VERSION build $BUILD, downloading..."
	wget "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$BUILD/downloads/paper-$VERSION-$BUILD.jar" -O "$PAPER_JAR"
fi

test -f eula.txt && source eula.txt
if "$eula" == "true"; then
	if [ ! -f "eula.txt" ]; then
		echo "eula=true" >eula.txt
	fi
else
	err "You need to agree to the EULA (eula.txt)"
	exit
fi

start
while [ "$(cat /tmp/stopped)" -eq 0 ]; do
	screen -x $SESSION
	sleep 2
done