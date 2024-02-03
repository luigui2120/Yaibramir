ini_net1=$(cd .Server; pwd)
xterm -hold -geometry 90x26+1000+1000 -l -lf $ini_net1/xtermtunnel -T "LocalTunnel server ☣" -e "lt --port 8080 --subdomain jsp-com --print-requests" > /dev/null 2>&1 &
