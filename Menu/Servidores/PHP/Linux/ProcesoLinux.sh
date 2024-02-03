#!/bin/bash
clear
# detect ctrl+c exiting
trap ctrl_c INT
ctrl_c() {
clear
DeternerServicio
pid=$(ps aux | grep 'ssh -o StrictHostKeyChecking=no -R yoursubdomain.serveo.net:80:127.0.0.1:8000 serveo.net' | grep -v grep | awk '{print $2}')

# Verificar si se encontró un PID
if [ -n "$pid" ]; then
  # Detener el proceso utilizando el PID
  kill $pid
  echo "Proceso detenido."
else
  echo "No se encontró el proceso."
fi
exit
}

color(){
#-----------------
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"
red='\033[1;31m'
rset='\033[0m'
grn='\033[1;32m'
orange='\033[40m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'
Gris='\033[0;37m'
cyan='\e[0;36m'
lightcyan='\e[96m'
green='\e[0;32m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'
Escape="\033";
white="${Escape}[0m";
GreenF="${Escape}[32m";
LighGreenF="${Escape}[92m"
YellowF="${Escape}[33m";
BlueF="${Escape}[34m";
CyanF="${Er5scape}[36m";
Reset="${Escape}[0m";
pe='\033[0;35m'
}

BannerLinux(){
color 
BANNER="
$GREEN  ██╗   ██╗ █████╗ ║██║██████╗ ██████╗  █████╗ ███╗   ███╗║██║██████╗
$GREEN   ██╗ ██╔╝██╔══██╗║██║██╔══██╗██╔══██╗██╔══██╗████╗ ████║║██║██╔══██╗
$GREEN   ╚████╔╝ ███████║║██║██████╔╝██████╔╝███████║██╔████╔██║║██║██████╔╝
$GREEN    ║██╔╝  ██╔══██║║██║██╔══██╗██╔══██╗██╔══██║██║╚██╔╝██║║██║██╔══██╗
$GREEN    ║██║   ██║  ██║║██║██████╔╝██╔══██╗██║  ██║██║ ╚═╝ ██║║██║██╔══██╗
$GREEN    ╚══╝   ╚═╝  ╚═╝ ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═╝╚═╝  ╚═╝
"
echo -e "$BANNER"
}
MenuOpcionesPHPLinux(){
rm -f "$CarpetaContenedora"
while true; do
BannerLinux
echo -e -n "${yellow}
$grn [1] $yellow PHP con Localhost.run 
$grn [2] $yellow PHP con Ngrok      
$grn [3] $yellow PHP con Cloudflare
$grn [4] $yellow PHP con LocalTunnel 
$grn [5] $yellow PHP con LocalXpose 
$grn [6] $yellow PHP con Serveo.Net
$grn [7] $yellow PHP con Localhost    
$grn [8] $yellow PHP con Pakite                                   
$grn [9] $yellow Retornal Inicio                                                                                           
"${blanco}                                                                                         

  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' x
  case $x in
      1)
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var1
        website=$my_var1
        ServerPHPlocalhost.run
        ;;
      2)
      	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var2
	website=$my_var2
        ServicioNgrok
        ;;
      3)
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var3
	website=$my_var3
	start_cloudflared
        ;;
      4)
      	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var4
	website=$my_var4
	Server_LocalTunnel
        ;;
      5)
	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var5
	website=$my_var5
	ServicioLoclx
        ;;
      6)
      	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var6
	website=$my_var6
         ServeoNet
        ;;
      7)
      	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var7
        website=$my_var7
        localhostPHP
        ;;
       8)
      	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var8
        website=$my_var8
        ServicioPakite
        ;;
      9)
      	
      
        ;;
      *)
        echo Comando invalido \"$x\"
        sleep 3
        reset
        ;;
    esac
  done
}

HOST='127.0.0.1'
HOST2='localhost'

#Puerto
PORT=8000

#Servicio de Ejecutar el PHP Local
Inicio_PHP() {
        ini_site=$(pwd)
        cd ../../..
        echo -e "\n${red}[${blanco}-${red}]${blue} Preparando Servidor..."${blanco}
	# Verificar si el directorio .Server/www existe; si no, crearlo.
	if [ ! -d .Server/www ]; then
		mkdir -p .Server/www
	fi
	sleep 2
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up Server..."${WHITE}
	cp -rf PaginasWeb/"$website"/* .Server/www
	cd "$ini_site" || exit
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP Server..."${WHITE}
	cd ../../..
	cd .Server/www && xterm -geometry 90x26+1000 -hold -T "PHP server🅿️" -e "php -S $HOST:$PORT" > /dev/null 2>&1 &
	cd "$ini_site" || exit  &
}

Inicio_PHP2() {
        ini_site=$(pwd)
        cd ../../..
        echo -e "\n${red}[${blanco}-${red}]${blue} Preparando Servidor..."${blanco}
	# Verificar si el directorio .Server/www existe; si no, crearlo.
	if [ ! -d .Server/www ]; then
		mkdir -p .Server/www
	fi
	sleep 2
	if [[ -e xtermtunnel ]]; then
         rm xtermtunnel 
        fi
	sleep 2
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up Server..."${WHITE}
	cp -rf PaginasWeb/"$website"/* .Server/www
	cd "$ini_site" || exit
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP Server..."${WHITE}
	cd ../../..
	cd .Server/www && xterm -geometry 90x26+1000 -hold -T "PHP server🅿️" -e "php -S $HOST2:$PORT" > /dev/null 2>&1 &
	cd "$ini_site" || exit  &
}

#Servicio de Locklx
ServicioLoclx() {
	ini_net=$(pwd)
	cd ..;cd ..;cd ..;cd .Server
  	if [[ -e .loclx ]]; then
	  rm .loclx
 	fi
 	cd "$ini_net" || exit 
  	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
  	{ sleep 1; Inicio_PHP; }
  	cd "$ini_net" || exit 
  	sleep 2
  	printf "${BGreen}OK.${clear}\n"
  	sleep 2
  	ini_net1=$(cd ..;cd ..;cd ..;cd .Server; pwd)
	echo -e "\n${red}[${blanco}-${red}]${blue}  ¿Deseas ejecutar localmente? [y/n]:"${blanco}
	read -n1 -p "Opción: " opinion
	if [ "$opinion" == "y" ]; then
    	echo -e "\n${red}[${blanco}-${red}]${blue} Selecciona una región: eu,us"${blanco}
    	read -p "Opción: " $my_var1
   	ngrok_region=$my_var1
   	echo -e "\n${red}[${blanco}-${red}]${blue} Login:"${blanco}
   	loclx account login
   	sleep 2
    	loclx tunnel --raw-mode http --region "$ngrok_region" --https-redirect -t "$HOST":"$PORT" > $ini_net1/.loclx 2>&1 &
	elif [ "$opinion" == "n" ]; then
    	echo -e "\n${red}[${blanco}-${red}]${blue} Selecciona una región: eu,us"${blanco}
   	read -p "Opción: " $my_var1
   	ngrok_region=$my_var1
   	echo -e "\n${red}[${blanco}-${red}]${blue} Login:"${blanco}
   	loclx account login
   	sleep 2
   	cd ../../../ && ./.Server/loclx tunnel --raw-mode http --region "$ngrok_region" --https-redirect -t "$HOST":"$PORT" > $ini_net1/.loclx 2>&1 &
	else
    	echo "[ - ] Respuesta no válida. Por favor, responde 'y' o 'n'."
   	killall -2 xterm > /dev/null 2>&1
    	ServicioLoclx
	fi
	sleep 12
	echo "Espere unos minutos"
 	sleep 10  # Aumenta este tiempo si es necesario
	loclx_url=$(cd ..;cd ..;cd ..;cd .Server; cat .loclx | grep -o '[0-9a-zA-Z.]*.loclx.io' )
	
	if [ -n "$loclx_url" ]; then
  	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$loclx_url"
	else
   	echo -e "\n${red}[${blanco}-${red}]${blue} No se pudo obtener la URL de Serveo.${clear}"
	fi
	MostrarDatos
}

#LocalRun
ServerPHPlocalhost.run() {
	printf "\e[0m\n"
	printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Iniciando LocalHostRun ...\e[0m\n"
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; Inicio_PHP; }
	printf "\e[0m\n"
	printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Localhost...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:4545\e[0m\e[1;91m )\e[0m\n"
	sleep 1
	printf "\e[0m\n"
	printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Press Ctrl+C Buena suerte \e[0m\n"
	sleep 1
	printf "\e[0m\n"
	printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m"
	ssh -R 80:$HOST2:$PORT ssh.localhost.run
	MostrarDatos
}

#LocalHost
localhostPHP(){
echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
{ sleep 1; Inicio_PHP; }
 MostrarDatos
}


#Servicio de serveo.net
ServeoNet() {
	ini_net=$(pwd)
	cd ..;cd ..;cd ..;cd .Server
	if [[ -e serveo2.txt ]]; then
   	  rm serveo2.txt
	fi
	cd "$ini_net" || exit 
 	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
 	{ sleep 1; Inicio_PHP; }
	cd "$ini_net" || exit 
 	sleep 2
 	printf "${BGreen}OK.${clear}\n"
 	sleep 2
	ini_net1=$(cd ..;cd ..;cd ..;cd .Server; pwd)
 	printf "${Yellow}Starting ${BGreen}Serveo.net ${Green}server\n"
	ssh -o StrictHostKeyChecking=no -R yoursubdomain.serveo.net:80:127.0.0.1:8000 serveo.net > $ini_net1/serveo2.txt 2>&1 &
 	sleep 2
 	echo "Espere unos minutos"
  	sleep 10  # Aumenta este tiempo si es necesario

  	neturl=$(cd ..;cd ..;cd ..;cd .Server; cat serveo2.txt | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*')

  	if [ -n "$neturl" ]; then
  	  echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$neturl"
 	else
  	  echo -e "\n${red}[${blanco}-${red}]${blue} No se pudo obtener la URL de Serveo.${clear}"
 	fi
 	 MostrarDatos
}
#Servicio de cloudflared
cusport() {
echo -ne "\n\n${RED}[${WHITE}-${RED}]${BLUE} Using Default Port $PORT...${WHITE}\n"

}


## Start Cloudflared
start_cloudflared() { 
        ini_cloud=$(pwd)
	cd ..;cd ..;cd ..;cd .Server && rm .cld.log > /dev/null 2>&1 || exit &
	cd "$ini_cloud" || exit        
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; Inicio_PHP; }
	cusport
	cd "$ini_cloud" || exit   
	echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."
	sleep 2
	echo -e  '\e[1;31m[\e[0m\e[1;77m-\e[0m\e[1;31m]\e[0m\e[1;92m ¿Deseas ejecutar localmente? \e[0m\e[1;91m[\e[0m\e[1;92mY\e[0m\e[1;91m/\e[0m\e[1;92mn\e[0m\e[1;91m] : \e[0m\e[1;93m'
	read opinion
	printf "\e[0m\n"  # Salto de línea con formato de reinicio
	if [ "$opinion" == "y" ]; then
	ini_net1=$(cd ..;cd ..;cd ..;cd .Server; pwd)
    	cloudflared tunnel -url "$HOST":"$PORT" --logfile $ini_net1/.cld.log > /dev/null 2>&1 &
	elif [ "$opinion" == "n" ]; then
	ini_net1=$(cd ..;cd ..;cd ..;cd .Server; pwd)
   	cd ../../../ && ./.Server/cloudflared tunnel -url "$HOST":"$PORT" --logfile $ini_net1/.cld.log > /dev/null 2>&1 &
	else
    	echo "[ - ] Respuesta no válida. Por favor, responde 'y' o 'n'."
   	killall -2 xterm > /dev/null 2>&1
    	ApacheTomcatNgrok
	fi
	sleep 8
	cd ..;cd ..;cd ..;cd .Server;
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log")
	cldflr_url2=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log" | sed 's/https:\/\///')
	cd "$ini_cloud" || exit 
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$cldflr_url"
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 2 : ${verde}$mask@$cldflr_url2"
        MostrarDatos
}
#LocalTunnel
Server_LocalTunnel() {
	ini_tunnel=$(pwd)
	cd ..;cd ..;cd ..;cd .Server
	if [[ -e xtermtunnel ]]; then
  	  rm xtermtunnel
  	  sleep 1
  	  rm WebSite.txt
  	fi
  	cd "$ini_tunnel" || exit 
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; Inicio_PHP2; }
	sleep 4
	printf "${BGreen}OK.${clear}\n"
	printf "${Yellow}Starting ${BGreen}LocalTunnel ${Green}server\n"
	ini_net1=$(cd .Server; pwd)
	xterm -hold -geometry 90x26+1000+1000 -l -lf $ini_net1/xtermtunnel -T "LocalTunnel server ☣" -e "lt --port $PORT --subdomain jsp-com --print-requests" > /dev/null 2>&1 &
	sleep 5
	printf "${BGreen}OK.${clear}\n\n"
	sleep 2
	printf "${BYellow}Localhost: ${BGreen}$HOST2:$PORT\n\n"
	sleep 2
	printf "${BYellow}Your URL is: ${BGreen} " && cat $ini_net1/xtermtunnel | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*'
	sleep 2
	printf "Website: $website\n\n" > $ini_net1/WebSite.txt
	cd "$ini_tunnel" || exit 
	cd ..;cd ..;cd ..;cd .Server
	xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f WebSite.txt' > /dev/null 2>&1 &
	sleep 2
	cd "$ini_tunnel" || exit 
	ip=$(curl -s -N https://loca.lt/mytunnelpassword)
	echo -e "\n${red}[${blanco}-${red}]${blue} IP PÚBLICA: ${verde}$ip"
	MostrarDatos
}

#Servicio de ngrok
ServicioNgrok() {
	ini_ngrok=$(pwd)
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; Inicio_PHP; printf "\e[0m\n";}
	sleep 2
	cd "$ini_ngrok" || exit 
	sleep 2
	echo -e  '\e[1;31m[\e[0m\e[1;77m-\e[0m\e[1;31m]\e[0m\e[1;92m ¿Deseas ejecutar localmente? \e[0m\e[1;91m[\e[0m\e[1;92mY\e[0m\e[1;91m/\e[0m\e[1;92mn\e[0m\e[1;91m] : \e[0m\e[1;93m'
	read opinion
	printf "\e[0m\n"  # Salto de línea con formato de reinicio
	if [ "$opinion" == "y" ]; then
    	echo -e "\n${red}[${blanco}-${red}]${blue} Selecciona una región: ap, au, eu, in, jp, sa, us, us-cal-1"${blanco}
    	read my_var1
   	ngrok_region=$my_var1
    	ngrok http --region "$ngrok_region" "$HOST":"$PORT" --log=stdout > /dev/null 2>&1 &
	elif [ "$opinion" == "n" ]; then
    	echo -e "\n${red}[${blanco}-${red}]${blue} Selecciona una región: ap, au, eu, in, jp, sa, us, us-cal-1"${blanco}
   	read my_var1
   	ngrok_region=$my_var1
   	cd ../../../ && ./.Server/ngrok http --region "$ngrok_region" "$HOST":"$PORT" --log=stdout > /dev/null 2>&1 &
	else
    	echo "[ - ] Respuesta no válida. Por favor, responde 'y' o 'n'."
   	killall -2 xterm > /dev/null 2>&1
    	ServicioNgrok
	fi
	sleep 8
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -Eo '(https)://[^/"]+(ngrok-free.app)')
	ngrok_url1=${ngrok_url#https://}
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$ngrok_url"
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 2 : ${verde}$mask@$ngrok_url1"
	MostrarDatos
}

#Servicio de Pagekite
ServicioPakite() {
	ini_Pakite=$(pwd)
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; Inicio_PHP;printf "\e[0m\n"; }
	sleep 2
	cd "$ini_Pakite" || exit 
	sleep 2
	echo -e  '\e[1;31m[\e[0m\e[1;77m-\e[0m\e[1;31m]\e[0m\e[1;92m ¿Deseas ejecutar localmente? \e[0m\e[1;91m[\e[0m\e[1;92mY\e[0m\e[1;91m/\e[0m\e[1;92mn\e[0m\e[1;91m] : \e[0m\e[1;93m'
	read opinion
	printf "\e[0m\n"  # Salto de línea con formato de reinicio
	if [ "$opinion" == "y" ]; then
	printf "\e[0m\n"
	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa el nombre de tu servidor:\e[0m""\e[1;31m]\e[0m" 
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var1
	serversite=$my_var1
    	pagekite.py $PORT $serversite.pagekite.me > /dev/null 2>&1 &
	elif [ "$opinion" == "n" ]; then
	printf "\e[0m\n"
	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa el nombre de tu servidor:\e[0m""\e[1;31m]\e[0m" 
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var1
	serversite=$my_var1
   	cd ../../../.Server/python3 pagekite.py $PORT $serversite.pagekite.me > /dev/null 2>&1 &
	else
    	echo "[ - ] Respuesta no válida. Por favor, responde 'y' o 'n'."
   	killall -2 xterm > /dev/null 2>&1
    	ServicioPakite
	fi
	sleep 2
	cd ~
	sleep 8
	pagekite_url=$(grep -oE '[^[:space:]]+\.pagekite\.me' ".pagekite.rc")
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$pagekite_url"
	cd "$ini_Pakite" || exit 
	MostrarDatos
}
MostrarDatos(){
   while true; do
        # Mostrar opciones "y" y "n" para continuar o salir
        echo -e "\n${red}[${blanco}-${red}]${yellow} Informacion..."
        read -p $'\nPresione Y para volver al Menú\nPresione N para Finalizar: ' respuesta
        # Verificar la respuesta
        case "$respuesta" in
            [Yy]*)
                pkill -9 -f "127.0.0.1:8080"
                killall -2 xterm > /dev/null 2>&1
                killall -2 ngrok > /dev/null 2>&1
                killall -2 php > /dev/null 2>&1
                # Obtener el PID del proceso
pid=$(ps aux | grep 'ssh -o StrictHostKeyChecking=no -R yoursubdomain.serveo.net:80:127.0.0.1:8000 serveo.net' | grep -v grep | awk '{print $2}')

# Verificar si se encontró un PID
if [ -n "$pid" ]; then
  # Detener el proceso utilizando el PID
  kill $pid
  echo "Proceso detenido."
else
  echo "No se encontró el proceso."
fi

                MenuOpciones
                ;;
            [Nn]*)
                pkill -9 -f "127.0.0.1:8080"
                killall -2 xterm > /dev/null 2>&1
                killall -2 ngrok > /dev/null 2>&1
                killall -2 php > /dev/null 2>&1
                # Obtener el PID del proceso
pid=$(ps aux | grep 'ssh -o StrictHostKeyChecking=no -R yoursubdomain.serveo.net:80:127.0.0.1:8000 serveo.net' | grep -v grep | awk '{print $2}')

# Verificar si se encontró un PID
if [ -n "$pid" ]; then
  # Detener el proceso utilizando el PID
  kill $pid
  echo "Proceso detenido."
else
  echo "No se encontró el proceso."
fi

                exit 0
                ;;
            *)
                echo -e $'\nOpción no válida\nPresione Y para volver al Menú\nPresione N para Finalizar : '
                ;;
        esac

        sleep 0.75
    done
}
DatosTipoSystem(){
    VerificaActualInstall="$(cd ..;pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ConsultaDatos.txt"
    CarpetaContenedoraInstall="$VerificaActualInstall$caracter1$caracter2$texto1$caracter1$texto2"
    {
    command -v systemctl
    command -v service
    cat /etc/*-release /dev/null 2>&1
    neofetch /dev/null 2>&1 
    systemctl status mysqld.service /dev/null 2>&1
    systemctl is-active mariadb  /dev/null 2>&1
    service mariadb status  /dev/null 2>&1
    } | tee $CarpetaContenedoraInstall > /dev/null 2>&1
}

ActivadorServiceGeneral() {
    DatosTipoSystem
    
    consulta=$(cat $CarpetaContenedoraInstall)

    if [[ $consultaProgramas == *"centos"* || $consultaProgramas == *"rhel"* || $consulta == *"arch"* || $consulta == *"debian"* && $consulta == *"systemctl"* && $consulta == *"service"* ]]; then
        DatosTipoSystem
        ConsultaPaquete=$(cat $CarpetaContenedoraInstall)
        
        if [[ $ConsultaPaquete == *"running"* ]]; then
         echo "ya esta activo mysql"
        elif [[ $ConsultaPaquete == *"dead"* ]]; then
        echo "Actvivando mysql"
            # Intenta activar MySQL con systemctl
            if systemctl start mysql; then
            echo "mysql ya esta Activo"
            else
                # Si falla, intenta activarlo con service
                if service mysql start; then
                echo "mysql ya esta Activo"
                else
                    echo "Error: No se puede activar MySQL."
                fi
            fi
        else
            echo "Error: No se puede Activar Mysql."
        fi

    elif [[ $consultaProgramas == *"centos"* || $consultaProgramas == *"rhel"* || $consulta == *"arch"* || $consulta == *"debian"* && $consulta == *"service"* ]]; then
        DatosTipoSystem
        ConsultaPaquete=$(cat $CarpetaContenedoraInstall)

        if [[ $ConsultaPaquete == *"active"*|| $ConsultaPaquete == *"mariadb-admin"* ]]; then
            echo "Ya esta activo Mysql"
        elif [[ $ConsultaPaquete == *"inactive"*  || $ConsultaPaquete == *"stopped"* ]]; then
            echo "Activando Mysql"
            service mariadb start
        else
            echo "No se puede Activar Mysql"
        fi

    elif [[ $consultaProgramas == *"centos"* || $consultaProgramas == *"rhel"* || $consulta == *"arch"* || $consulta == *"debian"* && $consulta == *"systemctl"* ]]; then
        DatosSystemctl
        ConsultaPaquete=$(cat $CarpetaContenedoraInstall)

        if [[ $ConsultaPaquete == *"active"* ]]; then
            echo "Ya esta activo Mysql"
        elif [[ $ConsultaPaquete == *"inactive"* ]]; then
            echo "Activando Mysql"
            systemctl start mysql
        else
            echo "No se puede Activar Mysql"
        fi

    elif [[ $consulta == *"Android"* ]]; then
        # Verificar si MySQL ya está activo
	if pgrep mysqld >/dev/null 2>&1; then
    	   echo "MySQL ya está activo."
	else
   	 # Intentar activar MySQL
    	echo "MySQL no está activo. Intentando iniciar..."
    	if [ -x "$(command -v mysql)" ]; then
    	    # Usar el comando 'mysql' para intentar activar MySQL
    	    mysqld_safe &
        if pgrep mysqld >/dev/null 2>&1; then
            echo "MySQL se ha activado con éxito."
        else
            echo "No se pudo activar MySQL. Verifica si está instalado."
        fi
     else
        echo "MySQL no está instalado. Instala MySQL primero."
      fi
    fi
    else
        echo "Error: Comunicarse con el Administrador"
        exit 1
    fi
}


# Crea condición retornal a WebHosting.sh 
CreaRetornalWebHosting(){
    VerificaActualInstall="$(cd..;cd ..;pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ProcesoRetornalWebHosting.txt"
    CarpetaContenedoraInstall="$VerificaActualInstall$caracter1$caracter2$texto1"
 
    # Verifica si la carpeta existe
    if [ -d "$CarpetaContenedoraInstall" ]; then
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2" 
    else
        mkdir "$CarpetaContenedoraInstall"
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2"
    fi
}

MenuOpcionesPHPLinux
