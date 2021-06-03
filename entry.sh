err() {
	echo -e "\e[1;31m[✘]\e[0m $@"
	exit
}

test -f eula.txt && source eula.txt
if "$eula" == "true"; then
	if [ ! -f "eula.txt" ]; then
		echo "eula=true" > eula.txt
	fi
else
	err "You need to agree to the EULA (eula.txt)"
fi

start
screen -x $SESSION