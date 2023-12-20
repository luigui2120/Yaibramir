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
BannerTermux(){
figlet Yaibramir| lolcat -a -d 20
}
VerificaTipoMenu() {
    if [ -f /etc/os-release ] && (grep -q 'debian\|arch\|rhel' /etc/os-release); then
          BannerLinux
    elif [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
          BannerTermux
    else
        echo "Error"
        exit 1  # Salir con un código de error
    fi
}
MenuOpciones(){
rm -f "$CarpetaContenedora"
while true; do
VerificaTipoMenu
echo -e -n "${yellow}
$grn [1] $yellow PHP con localhost.run 
$grn [2] $yellow PHP con Ngrok      
$grn [3] $yellow PHP con Cloudflare
$grn [4] $yellow PHP con LocalTunnel 
$grn [5] $yellow PHP con LocalXpose 
$grn [6] $yellow PHP con Serveo.Net
$grn [7] $yellow PHP con localhost
$grn [8] $yellow TomCat con localhost.run 
$grn [9] $yellow TomCat con Ngrok   
$grn [10] $yellow TomCat con Cloudflare
$grn [11] $yellow TomCat con LocalTunnel 
$grn [12] $yellow TomCat con localhost.run  
$grn [13] $yellow TomCat con Serveo.Net          
$grn [14] $yellow TomCat con LocalHost  
$grn [15] $yellow Serverfaces con localhost.run 
$grn [16] $yellow Serverfaces con Ngrok   
$grn [17] $yellow Serverfaces con Cloudflare
$grn [18] $yellow Serverfaces con LocalTunnel 
$grn [19] $yellow Serverfaces con localhost.run 
$grn [20] $yellow Serverfaces con Serveo.net       
$grn [21] $yellow Serverfaces con LocalHost                                                 
$grn [22] $yellow Retornal Inicio                                                                                           
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
        ApacheTomcatLocalRun
        ;;
      9)
      	 echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
         read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var9
         website=$my_var9
         ApacheTomcatNgrok
        ;;
      10)
	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var10
        website=$my_var10
	ApacheTomcatLocalCloudflare
        ;;
      11)

        ;;
      12)

        ;;
      13)
	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var13
        website=$my_var13
	ApacheTomcatServeoNet
        ;;
      14)
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var14
        website=$my_var14
        ApacheTomcatLocal
        ;;
      15)

        ;;
      16)

        ;;
      17)

        ;;
      18)

        ;;
      19)

        ;;
      20)

        ;;
      *)
        echo Comando invalido \"$x\"
        sleep 3
        reset
        ;;
    esac
  done
}


#Host y el Puerto
HOST='127.0.0.1'
HOST2='localhost'
PORT=8000
#LocalRun
ServerPHPlocalhost.run() {
DeternerServicio
ActivadorServiceGeneral
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Iniciando LocalHostRun ...\e[0m\n"
cd PaginasWeb;cd $website && php -S 127.0.0.1:4545 > /dev/null 2>&1 & 
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Localhost...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:4545\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Press Ctrl+C Buena suerte \e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m"
ssh -R 80:localhost:4545 ssh.localhost.run
}

localhostPHP(){
DeternerServicio
cd PaginasWeb/$my_var7
php -S "$HOST":"$PORT"
}

## Start LocalXpose (Again...)
start_loclx() {
	cusport
	DeternerServicio
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; localxpose_auth; }
	echo -e "\n"
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Change Loclx Server Region? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]:${ORANGE} " opinion
	[[ ${opinion,,} == "y" ]] && loclx_region="eu" || loclx_region="us"
	echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching LocalXpose..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 1 && termux-chroot ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	else
		sleep 1 && ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	fi

	sleep 12
	loclx_url=$(cat .server/.loclx | grep -o '[0-9a-zA-Z.]*.loclx.io')
	custom_url "$loclx_url"
}

#Servicio de serveo.net

ServeoNet() {
  DeternerServicio

  if [[ -e serveo ]]; then
    rm serveo
  fi

  if [[ -e serveo2.txt ]]; then
    rm serveo2.txt
  fi

  cp -rf PaginasWeb/"$website"/* .Server/www

  printf "${Yellow}Starting ${BGreen}PHP ${Green}server\n"

  cd .Server/www && xterm -geometry 90x26+1000 -hold -T "PHP server🅿️" -e "php -S $HOST:$PORT" > /dev/null 2>&1 &
  sleep 2
  printf "${BGreen}OK.${clear}\n"
  sleep 2
  printf "${Yellow}Starting ${BGreen}Serveo.net ${Green}server\n"

  ssh -o StrictHostKeyChecking=no -R yoursubdomain.serveo.net:80:127.0.0.1:8000 serveo.net > serveo2.txt 2>&1 &
  sleep 2
  echo "Espere unos minutos"
  sleep 10  # Aumenta este tiempo si es necesario

  neturl=$(cat serveo2.txt | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*')

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
#Servicio de cloudflared
setup_site() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up Server..."${WHITE}
	cp -rf PaginasWeb/"$website"/* .Server/www
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP Server..."${WHITE}
	cd .Server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 &
}

## Start Cloudflared
start_cloudflared() { 
        DeternerServicio
	cd .Server && rm .cld.log > /dev/null 2>&1 &
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.Server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .Server/.cld.log > /dev/null 2>&1 &
	else
		sleep 2 && ./.Server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .Server/.cld.log > /dev/null 2>&1 &
	fi
	
	sleep 8
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".Server/.cld.log")
	cldflr_url2=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".Server/.cld.log" | sed 's/https:\/\///')
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$cldflr_url"
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 2 : ${verde}$mask@$cldflr_url2"
        MostrarDatos
}

#LocalTunnel
Server_LocalTunnel() {
DeternerServicio
if [[ -e xtermtunnel ]]; then
    rm xtermtunnel
fi

if [[ -e xtermflared ]]; then
    rm xtermflared
fi

cp -rf PaginasWeb/"$website"/* .Server/www

printf "${Yellow}Starting ${BGreen}PHP ${Green}server\n"
cd .Server/www && xterm -geometry 90x26+1000 -hold -T "PHP server🅿️" -e "php -S $HOST2:$PORT" > /dev/null 2>&1 &
sleep 5
printf "${BGreen}OK.${clear}\n"

printf "${Yellow}Starting ${BGreen}LocalTunnel ${Green}server\n"
xterm -hold -geometry 90x26+1000+1000 -l -lf xtermtunnel -T "LocalTunnel server ☣" -e "lt --port $PORT --subdomain $website-com --print-requests" > /dev/null 2>&1 &
sleep 5
printf "${BGreen}OK.${clear}\n\n"
sleep 2
printf "${BYellow}Localhost: ${BGreen}$HOST2:$PORT\n\n"
sleep 2
printf "${BYellow}Your URL is: ${BGreen} " && cat xtermtunnel | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*'
sleep 2
printf "Website: $website\n\n" > WebSite.txt
xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f WebSite.txt' > /dev/null 2>&1 &
sleep 2

ip=$(curl ifconfig.me) 
echo -e "\n${red}[${blanco}-${red}]${blue} IP PÚBLICA: ${verde}$ip"
MostrarDatos
}

DeternerServicio(){
current_dir=$(pwd)
cd .Server; cd apache-tomcat; cd bin || exit
bash shutdown.sh  
cd "$current_dir" || exit
}

#Servicio de ngrok
ServicioNgrok() {
        DeternerServicio
        ActivadorServiceGeneral
	echo -e "\n${red}[${blanco}-${red}]${blue} Preparando Servidor..."${blanco}
	# Verificar si el directorio .Server/www existe; si no, crearlo.
	if [ ! -d .Server/www ]; then
		mkdir -p .Server/www
	fi
	cp -rf PaginasWeb/"$website"/* .Server/www
	echo -ne "\n${red}[${blanco}-${RED}]${blue} Encendiendo PHP Server..."${blanco}
	cd .Server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 & 
	echo -e "\n${red}[${blanco}-${red}]${verde} Iniciando... ${verde}( ${cyan}http://$HOST:$PORT ${verde})"
	sleep 1
	echo -e "\n"
	read -n1 -p "${RED}[${WHITE}-${RED}]${ORANGE} Y para Activar Servidor de Region: ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]:${ORANGE} " opinion
	[[ ${opinion,,} == "Y" ]] && ngrok_region="sa" || ngrok_region="us"
	echo -e "\n\n${red}[${blanco}-${red}]${verde} Encendido Ngrok..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 2 && ./.Server/ngrok http --region ${ngrok_region} "$HOST":"$PORT" --log=stdout > /dev/null 2>&1 &
	else
		sleep 2 && ./.Server/ngrok http --region ${ngrok_region} "$HOST":"$PORT" --log=stdout > /dev/null 2>&1 &
	fi
	sleep 8
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -Eo '(https)://[^/"]+(ngrok-free.app)')
	ngrok_url1=${ngrok_url#https://}
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$ngrok_url"
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 2 : ${verde}$mask@$ngrok_url1"
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
############### FIN CODIGO PARA QUE ESTE ACTIVO EL NGROK EN LA PANTALLA ####################
# Crea condición para entrar WebHosting.sh Menu Server
CreaWebHosting(){
    VerificaActualInstall="$(cd ..;pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ProcesoWebHosting.txt"
    CarpetaContenedoraInstall="$VerificaActualInstall$caracter1$caracter2$texto1"
 
    # Verifica si la carpeta existe
    if [ -d "$CarpetaContenedoraInstall" ]; then
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2" 
    else
        mkdir "$CarpetaContenedoraInstall"
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2"
    fi
}


#ApacheTomcatServeoNet

ApacheTomcatServeoNet(){
current_dir=$(pwd)
cd PaginasWeb; zip -r ROOT.zip $website || exit
mv ROOT.zip $current_dir/.Server/apache-tomcat/webapps/
cd "$current_dir" || exit
#estas en menu
cd .Server/apache-tomcat/webapps || exit
unzip ROOT.zip
sleep 2
rm -f ROOT.zip
sleep 2
cd "$current_dir" || exit
#estas en menu
sleep 2
cd .Server;cd apache-tomcat;cd conf || exit
rm -f server.xml
cat <<Server> server.xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!-- Note:  A "Server" is not itself a "Container", so you may not
     define subcomponents such as "Valves" at this level.
     Documentation at /docs/config/server.html
 -->
<Server port="8005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <!-- Security listener. Documentation at /docs/config/listeners.html
  <Listener className="org.apache.catalina.security.SecurityListener" />
  -->
  <!-- APR library loader. Documentation at /docs/apr.html -->
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <!-- Prevent memory leaks due to use of particular java/javax APIs-->
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />

  <!-- Global JNDI resources
       Documentation at /docs/jndi-resources-howto.html
  -->
  <GlobalNamingResources>
    <!-- Editable user database that can also be used by
         UserDatabaseRealm to authenticate users
    -->
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
  </GlobalNamingResources>

  <!-- A "Service" is a collection of one or more "Connectors" that share
       a single "Container" Note:  A "Service" is not itself a "Container",
       so you may not define subcomponents such as "Valves" at this level.
       Documentation at /docs/config/service.html
   -->
  <Service name="Catalina">

    <!--The connectors can use a shared executor, you can define one or more named thread pools-->
    <!--
    <Executor name="tomcatThreadPool" namePrefix="catalina-exec-"
        maxThreads="150" minSpareThreads="4"/>
    -->


    <!-- A "Connector" represents an endpoint by which requests are received
         and responses are returned. Documentation at :
         Java HTTP Connector: /docs/config/http.html
         Java AJP  Connector: /docs/config/ajp.html
         APR (HTTP/AJP) Connector: /docs/apr.html
         Define a non-SSL/TLS HTTP/1.1 Connector on port 8080
    -->
    <Connector port="8000" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    <!-- A "Connector" using the shared thread pool-->
    <!--
    <Connector executor="tomcatThreadPool"
               port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443
         This connector uses the NIO implementation. The default
         SSLImplementation will depend on the presence of the APR/native
         library and the useOpenSSL attribute of the AprLifecycleListener.
         Either JSSE or OpenSSL style configuration may be used regardless of
         the SSLImplementation selected. JSSE style configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="conf/localhost-rsa.jks"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443 with HTTP/2
         This connector uses the APR/native implementation which always uses
         OpenSSL for TLS.
         Either JSSE or OpenSSL style configuration may be used. OpenSSL style
         configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11AprProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" />
        <SSLHostConfig>
            <Certificate certificateKeyFile="conf/localhost-rsa-key.pem"
                         certificateFile="conf/localhost-rsa-cert.pem"
                         certificateChainFile="conf/localhost-rsa-chain.pem"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->

    <!-- Define an AJP 1.3 Connector on port 8009 -->
    <!--
    <Connector protocol="AJP/1.3"
               address="::1"
               port="8009"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->

    <!-- An Engine represents the entry point (within Catalina) that processes
         every request.  The Engine implementation for Tomcat stand alone
         analyzes the HTTP headers included with the request, and passes them
         on to the appropriate Host (virtual host).
         Documentation at /docs/config/engine.html -->

    <!-- You should set jvmRoute to support load-balancing via AJP ie :
    <Engine name="Catalina" defaultHost="localhost" jvmRoute="jvm1">
    -->
    <Engine name="Catalina" defaultHost="localhost">

      <!--For clustering, please take a look at documentation at:
          /docs/cluster-howto.html  (simple how to)
          /docs/config/cluster.html (reference documentation) -->
      <!--
      <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster"/>
      -->

      <!-- Use the LockOutRealm to prevent attempts to guess user passwords
           via a brute-force attack -->
      <Realm className="org.apache.catalina.realm.LockOutRealm">
        <!-- This Realm uses the UserDatabase configured in the global JNDI
             resources under the key "UserDatabase".  Any edits
             that are performed against this UserDatabase are immediately
             available for use by the Realm.  -->
        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
      </Realm>
      
<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true">
    <!-- ... otras configuraciones ... -->
    <Context path="" docBase="$website" reloadable="true"/>
    <!-- ... otras configuraciones ... -->
</Host>

    </Engine>
  </Service>
</Server>
Server
cd "$current_dir" || exit
#estas en menu
cd .Server; cd apache-tomcat; cd bin || exit
bash shutdown.sh  
sleep 2 
bash startup.sh > /dev/null 2>&1
cd "$current_dir" || exit
  if [[ -e serveo ]]; then
    rm serveo
  fi

  if [[ -e serveo2.txt ]]; then
    rm serveo2.txt
  fi

  printf "${BGreen}OK.${clear}\n"
  sleep 2
  printf "${Yellow}Starting ${BGreen}Serveo.net ${Green}server\n"

  ssh -o StrictHostKeyChecking=no -R yoursubdomain.serveo.net:80:127.0.0.1:8000 serveo.net > serveo2.txt 2>&1 &
  sleep 2
  echo "Espere unos minutos"
  sleep 10  # Aumenta este tiempo si es necesario

  neturl=$(cat serveo2.txt | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*')

  if [ -n "$neturl" ]; then
    echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$neturl"
  else
    echo -e "\n${red}[${blanco}-${red}]${blue} No se pudo obtener la URL de Serveo.${clear}"
  fi

  MostrarDatos
}

#ApacheTomcatLocalRun
ApacheTomcatLocalRun(){
current_dir=$(pwd)
cd PaginasWeb; zip -r ROOT.zip $website || exit
mv ROOT.zip $current_dir/.Server/apache-tomcat/webapps/
cd "$current_dir" || exit
#estas en menu
cd .Server/apache-tomcat/webapps || exit
unzip ROOT.zip
sleep 2
rm -f ROOT.zip
sleep 2
cd "$current_dir" || exit
#estas en menu
sleep 2
cd .Server;cd apache-tomcat;cd conf || exit
rm -f server.xml
cat <<Server> server.xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!-- Note:  A "Server" is not itself a "Container", so you may not
     define subcomponents such as "Valves" at this level.
     Documentation at /docs/config/server.html
 -->
<Server port="8005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <!-- Security listener. Documentation at /docs/config/listeners.html
  <Listener className="org.apache.catalina.security.SecurityListener" />
  -->
  <!-- APR library loader. Documentation at /docs/apr.html -->
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <!-- Prevent memory leaks due to use of particular java/javax APIs-->
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />

  <!-- Global JNDI resources
       Documentation at /docs/jndi-resources-howto.html
  -->
  <GlobalNamingResources>
    <!-- Editable user database that can also be used by
         UserDatabaseRealm to authenticate users
    -->
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
  </GlobalNamingResources>

  <!-- A "Service" is a collection of one or more "Connectors" that share
       a single "Container" Note:  A "Service" is not itself a "Container",
       so you may not define subcomponents such as "Valves" at this level.
       Documentation at /docs/config/service.html
   -->
  <Service name="Catalina">

    <!--The connectors can use a shared executor, you can define one or more named thread pools-->
    <!--
    <Executor name="tomcatThreadPool" namePrefix="catalina-exec-"
        maxThreads="150" minSpareThreads="4"/>
    -->


    <!-- A "Connector" represents an endpoint by which requests are received
         and responses are returned. Documentation at :
         Java HTTP Connector: /docs/config/http.html
         Java AJP  Connector: /docs/config/ajp.html
         APR (HTTP/AJP) Connector: /docs/apr.html
         Define a non-SSL/TLS HTTP/1.1 Connector on port 8080
    -->
    <Connector port="8000" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    <!-- A "Connector" using the shared thread pool-->
    <!--
    <Connector executor="tomcatThreadPool"
               port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443
         This connector uses the NIO implementation. The default
         SSLImplementation will depend on the presence of the APR/native
         library and the useOpenSSL attribute of the AprLifecycleListener.
         Either JSSE or OpenSSL style configuration may be used regardless of
         the SSLImplementation selected. JSSE style configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="conf/localhost-rsa.jks"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443 with HTTP/2
         This connector uses the APR/native implementation which always uses
         OpenSSL for TLS.
         Either JSSE or OpenSSL style configuration may be used. OpenSSL style
         configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11AprProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" />
        <SSLHostConfig>
            <Certificate certificateKeyFile="conf/localhost-rsa-key.pem"
                         certificateFile="conf/localhost-rsa-cert.pem"
                         certificateChainFile="conf/localhost-rsa-chain.pem"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->

    <!-- Define an AJP 1.3 Connector on port 8009 -->
    <!--
    <Connector protocol="AJP/1.3"
               address="::1"
               port="8009"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->

    <!-- An Engine represents the entry point (within Catalina) that processes
         every request.  The Engine implementation for Tomcat stand alone
         analyzes the HTTP headers included with the request, and passes them
         on to the appropriate Host (virtual host).
         Documentation at /docs/config/engine.html -->

    <!-- You should set jvmRoute to support load-balancing via AJP ie :
    <Engine name="Catalina" defaultHost="localhost" jvmRoute="jvm1">
    -->
    <Engine name="Catalina" defaultHost="localhost">

      <!--For clustering, please take a look at documentation at:
          /docs/cluster-howto.html  (simple how to)
          /docs/config/cluster.html (reference documentation) -->
      <!--
      <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster"/>
      -->

      <!-- Use the LockOutRealm to prevent attempts to guess user passwords
           via a brute-force attack -->
      <Realm className="org.apache.catalina.realm.LockOutRealm">
        <!-- This Realm uses the UserDatabase configured in the global JNDI
             resources under the key "UserDatabase".  Any edits
             that are performed against this UserDatabase are immediately
             available for use by the Realm.  -->
        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
      </Realm>
      
<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true">
    <!-- ... otras configuraciones ... -->
    <Context path="" docBase="$website" reloadable="true"/>
    <!-- ... otras configuraciones ... -->
</Host>

    </Engine>
  </Service>
</Server>
Server
cd "$current_dir" || exit
#estas en menu
cd .Server; cd apache-tomcat; cd bin || exit
bash shutdown.sh  
sleep 2 
bash startup.sh > /dev/null 2>&1
cd "$current_dir" || exit
ssh -R 80:localhost:8000 ssh.localhost.run
}

#ApacheTomcatLocalCloudflare
ApacheTomcatLocalCloudflare(){
current_dir=$(pwd)
cd PaginasWeb; zip -r ROOT.zip $website || exit
mv ROOT.zip $current_dir/.Server/apache-tomcat/webapps/
cd "$current_dir" || exit
#estas en menu
cd .Server/apache-tomcat/webapps || exit
unzip ROOT.zip
sleep 2
rm -f ROOT.zip
sleep 2
cd "$current_dir" || exit
#estas en menu
sleep 2
cd .Server;cd apache-tomcat;cd conf || exit
rm -f server.xml
cat <<Server> server.xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!-- Note:  A "Server" is not itself a "Container", so you may not
     define subcomponents such as "Valves" at this level.
     Documentation at /docs/config/server.html
 -->
<Server port="8005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <!-- Security listener. Documentation at /docs/config/listeners.html
  <Listener className="org.apache.catalina.security.SecurityListener" />
  -->
  <!-- APR library loader. Documentation at /docs/apr.html -->
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <!-- Prevent memory leaks due to use of particular java/javax APIs-->
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />

  <!-- Global JNDI resources
       Documentation at /docs/jndi-resources-howto.html
  -->
  <GlobalNamingResources>
    <!-- Editable user database that can also be used by
         UserDatabaseRealm to authenticate users
    -->
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
  </GlobalNamingResources>

  <!-- A "Service" is a collection of one or more "Connectors" that share
       a single "Container" Note:  A "Service" is not itself a "Container",
       so you may not define subcomponents such as "Valves" at this level.
       Documentation at /docs/config/service.html
   -->
  <Service name="Catalina">

    <!--The connectors can use a shared executor, you can define one or more named thread pools-->
    <!--
    <Executor name="tomcatThreadPool" namePrefix="catalina-exec-"
        maxThreads="150" minSpareThreads="4"/>
    -->


    <!-- A "Connector" represents an endpoint by which requests are received
         and responses are returned. Documentation at :
         Java HTTP Connector: /docs/config/http.html
         Java AJP  Connector: /docs/config/ajp.html
         APR (HTTP/AJP) Connector: /docs/apr.html
         Define a non-SSL/TLS HTTP/1.1 Connector on port 8080
    -->
    <Connector port="8000" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    <!-- A "Connector" using the shared thread pool-->
    <!--
    <Connector executor="tomcatThreadPool"
               port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443
         This connector uses the NIO implementation. The default
         SSLImplementation will depend on the presence of the APR/native
         library and the useOpenSSL attribute of the AprLifecycleListener.
         Either JSSE or OpenSSL style configuration may be used regardless of
         the SSLImplementation selected. JSSE style configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="conf/localhost-rsa.jks"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443 with HTTP/2
         This connector uses the APR/native implementation which always uses
         OpenSSL for TLS.
         Either JSSE or OpenSSL style configuration may be used. OpenSSL style
         configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11AprProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" />
        <SSLHostConfig>
            <Certificate certificateKeyFile="conf/localhost-rsa-key.pem"
                         certificateFile="conf/localhost-rsa-cert.pem"
                         certificateChainFile="conf/localhost-rsa-chain.pem"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->

    <!-- Define an AJP 1.3 Connector on port 8009 -->
    <!--
    <Connector protocol="AJP/1.3"
               address="::1"
               port="8009"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->

    <!-- An Engine represents the entry point (within Catalina) that processes
         every request.  The Engine implementation for Tomcat stand alone
         analyzes the HTTP headers included with the request, and passes them
         on to the appropriate Host (virtual host).
         Documentation at /docs/config/engine.html -->

    <!-- You should set jvmRoute to support load-balancing via AJP ie :
    <Engine name="Catalina" defaultHost="localhost" jvmRoute="jvm1">
    -->
    <Engine name="Catalina" defaultHost="localhost">

      <!--For clustering, please take a look at documentation at:
          /docs/cluster-howto.html  (simple how to)
          /docs/config/cluster.html (reference documentation) -->
      <!--
      <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster"/>
      -->

      <!-- Use the LockOutRealm to prevent attempts to guess user passwords
           via a brute-force attack -->
      <Realm className="org.apache.catalina.realm.LockOutRealm">
        <!-- This Realm uses the UserDatabase configured in the global JNDI
             resources under the key "UserDatabase".  Any edits
             that are performed against this UserDatabase are immediately
             available for use by the Realm.  -->
        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
      </Realm>
      
<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true">
    <!-- ... otras configuraciones ... -->
    <Context path="" docBase="$website" reloadable="true"/>
    <!-- ... otras configuraciones ... -->
</Host>

    </Engine>
  </Service>
</Server>
Server
cd "$current_dir" || exit
echo "$current_dir"
#estas en menu
cd .Server; cd apache-tomcat; cd bin || exit
bash shutdown.sh  
sleep 2 
bash startup.sh > /dev/null 2>&1
cd "$current_dir" || exit
#estas en menu
cd .Server;cd .Server || exit
rm .cld.log
cd "$current_dir" || exit
#estas en menu
cd .Server || exit
./cloudflared tunnel -url "127.0.0.1":"8000" --logfile .Server/.cld.log 

}

#ApacheTomcatNgrok

ApacheTomcatNgrok(){
current_dir=$(pwd)
cd PaginasWeb; zip -r ROOT.zip $website || exit
mv ROOT.zip $current_dir/.Server/apache-tomcat/webapps/
cd "$current_dir" || exit
#estas en menu
cd .Server/apache-tomcat/webapps || exit
unzip ROOT.zip
sleep 2
rm -f ROOT.zip
sleep 2
cd "$current_dir" || exit
#estas en menu
sleep 2
cd .Server;cd apache-tomcat;cd conf || exit
rm -f server.xml
cat <<Server> server.xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!-- Note:  A "Server" is not itself a "Container", so you may not
     define subcomponents such as "Valves" at this level.
     Documentation at /docs/config/server.html
 -->
<Server port="8005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <!-- Security listener. Documentation at /docs/config/listeners.html
  <Listener className="org.apache.catalina.security.SecurityListener" />
  -->
  <!-- APR library loader. Documentation at /docs/apr.html -->
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <!-- Prevent memory leaks due to use of particular java/javax APIs-->
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />

  <!-- Global JNDI resources
       Documentation at /docs/jndi-resources-howto.html
  -->
  <GlobalNamingResources>
    <!-- Editable user database that can also be used by
         UserDatabaseRealm to authenticate users
    -->
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
  </GlobalNamingResources>

  <!-- A "Service" is a collection of one or more "Connectors" that share
       a single "Container" Note:  A "Service" is not itself a "Container",
       so you may not define subcomponents such as "Valves" at this level.
       Documentation at /docs/config/service.html
   -->
  <Service name="Catalina">

    <!--The connectors can use a shared executor, you can define one or more named thread pools-->
    <!--
    <Executor name="tomcatThreadPool" namePrefix="catalina-exec-"
        maxThreads="150" minSpareThreads="4"/>
    -->


    <!-- A "Connector" represents an endpoint by which requests are received
         and responses are returned. Documentation at :
         Java HTTP Connector: /docs/config/http.html
         Java AJP  Connector: /docs/config/ajp.html
         APR (HTTP/AJP) Connector: /docs/apr.html
         Define a non-SSL/TLS HTTP/1.1 Connector on port 8080
    -->
    <Connector port="8000" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    <!-- A "Connector" using the shared thread pool-->
    <!--
    <Connector executor="tomcatThreadPool"
               port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443
         This connector uses the NIO implementation. The default
         SSLImplementation will depend on the presence of the APR/native
         library and the useOpenSSL attribute of the AprLifecycleListener.
         Either JSSE or OpenSSL style configuration may be used regardless of
         the SSLImplementation selected. JSSE style configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="conf/localhost-rsa.jks"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443 with HTTP/2
         This connector uses the APR/native implementation which always uses
         OpenSSL for TLS.
         Either JSSE or OpenSSL style configuration may be used. OpenSSL style
         configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11AprProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" />
        <SSLHostConfig>
            <Certificate certificateKeyFile="conf/localhost-rsa-key.pem"
                         certificateFile="conf/localhost-rsa-cert.pem"
                         certificateChainFile="conf/localhost-rsa-chain.pem"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->

    <!-- Define an AJP 1.3 Connector on port 8009 -->
    <!--
    <Connector protocol="AJP/1.3"
               address="::1"
               port="8009"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->

    <!-- An Engine represents the entry point (within Catalina) that processes
         every request.  The Engine implementation for Tomcat stand alone
         analyzes the HTTP headers included with the request, and passes them
         on to the appropriate Host (virtual host).
         Documentation at /docs/config/engine.html -->

    <!-- You should set jvmRoute to support load-balancing via AJP ie :
    <Engine name="Catalina" defaultHost="localhost" jvmRoute="jvm1">
    -->
    <Engine name="Catalina" defaultHost="localhost">

      <!--For clustering, please take a look at documentation at:
          /docs/cluster-howto.html  (simple how to)
          /docs/config/cluster.html (reference documentation) -->
      <!--
      <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster"/>
      -->

      <!-- Use the LockOutRealm to prevent attempts to guess user passwords
           via a brute-force attack -->
      <Realm className="org.apache.catalina.realm.LockOutRealm">
        <!-- This Realm uses the UserDatabase configured in the global JNDI
             resources under the key "UserDatabase".  Any edits
             that are performed against this UserDatabase are immediately
             available for use by the Realm.  -->
        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
      </Realm>
      
<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true">
    <!-- ... otras configuraciones ... -->
    <Context path="" docBase="$website" reloadable="true"/>
    <!-- ... otras configuraciones ... -->
</Host>

    </Engine>
  </Service>
</Server>
Server
cd "$current_dir" || exit
#estas en menu
cd .Server; cd apache-tomcat; cd bin || exit
bash shutdown.sh  
sleep 2 
bash startup.sh > /dev/null 2>&1
cd "$current_dir" || exit
#estas en menu
cd .Server || exit
read -n1 -p "${RED}[${WHITE}-${RED}]${ORANGE} Y para Activar Servidor de Region: ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]:${ORANGE} " opinion
	[[ ${opinion,,} == "Y" ]] && ngrok_region="sa" || ngrok_region="us"
	echo -e "\n\n${red}[${blanco}-${red}]${verde} Encendido Ngrok..."
	if [[ `command -v termux-chroot` ]]; then
		sleep 2 && ./ngrok http --region ${ngrok_region} "127.0.0.1":"8000" --log=stdout > /dev/null 2>&1 &
	else
		sleep 2 && ./ngrok http --region ${ngrok_region} "127.0.0.1":"8000" --log=stdout > /dev/null 2>&1 &
		
	fi
		sleep 8
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -Eo '(https)://[^/"]+(ngrok-free.app)')
	ngrok_url1=${ngrok_url#https://}
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$ngrok_url"
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 2 : ${verde}$mask@$ngrok_url1"
	MostrarDatos
}

#ApacheTomcatLocal

ApacheTomcatLocal(){
cd PaginasWeb; zip -r ROOT.zip $website
VerificaActual1="$(cd ..;pwd)"
mv ROOT.zip $VerificaActual1/.Server/apache-tomcat/webapps/
sleep 2
VerificaActual2="$(cd ..;pwd)"
unzip "$VerificaActual2/.Server/apache-tomcat/webapps/ROOT.zip" -d "$VerificaActual2/.Server/apache-tomcat/webapps/"
sleep 2
rm -f $VerificaActual2/.Server/apache-tomcat/webapps/ROOT.zip
sleep 2
VerificaActual3="$(cd ..;cd .Server; cd apache-tomcat; cd conf;rm -f server.xml; cat <<Server> server.xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!-- Note:  A "Server" is not itself a "Container", so you may not
     define subcomponents such as "Valves" at this level.
     Documentation at /docs/config/server.html
 -->
<Server port="8005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <!-- Security listener. Documentation at /docs/config/listeners.html
  <Listener className="org.apache.catalina.security.SecurityListener" />
  -->
  <!-- APR library loader. Documentation at /docs/apr.html -->
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <!-- Prevent memory leaks due to use of particular java/javax APIs-->
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />

  <!-- Global JNDI resources
       Documentation at /docs/jndi-resources-howto.html
  -->
  <GlobalNamingResources>
    <!-- Editable user database that can also be used by
         UserDatabaseRealm to authenticate users
    -->
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
  </GlobalNamingResources>

  <!-- A "Service" is a collection of one or more "Connectors" that share
       a single "Container" Note:  A "Service" is not itself a "Container",
       so you may not define subcomponents such as "Valves" at this level.
       Documentation at /docs/config/service.html
   -->
  <Service name="Catalina">

    <!--The connectors can use a shared executor, you can define one or more named thread pools-->
    <!--
    <Executor name="tomcatThreadPool" namePrefix="catalina-exec-"
        maxThreads="150" minSpareThreads="4"/>
    -->


    <!-- A "Connector" represents an endpoint by which requests are received
         and responses are returned. Documentation at :
         Java HTTP Connector: /docs/config/http.html
         Java AJP  Connector: /docs/config/ajp.html
         APR (HTTP/AJP) Connector: /docs/apr.html
         Define a non-SSL/TLS HTTP/1.1 Connector on port 8080
    -->
    <Connector port="8000" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    <!-- A "Connector" using the shared thread pool-->
    <!--
    <Connector executor="tomcatThreadPool"
               port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443
         This connector uses the NIO implementation. The default
         SSLImplementation will depend on the presence of the APR/native
         library and the useOpenSSL attribute of the AprLifecycleListener.
         Either JSSE or OpenSSL style configuration may be used regardless of
         the SSLImplementation selected. JSSE style configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="conf/localhost-rsa.jks"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443 with HTTP/2
         This connector uses the APR/native implementation which always uses
         OpenSSL for TLS.
         Either JSSE or OpenSSL style configuration may be used. OpenSSL style
         configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11AprProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" />
        <SSLHostConfig>
            <Certificate certificateKeyFile="conf/localhost-rsa-key.pem"
                         certificateFile="conf/localhost-rsa-cert.pem"
                         certificateChainFile="conf/localhost-rsa-chain.pem"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->

    <!-- Define an AJP 1.3 Connector on port 8009 -->
    <!--
    <Connector protocol="AJP/1.3"
               address="::1"
               port="8009"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->

    <!-- An Engine represents the entry point (within Catalina) that processes
         every request.  The Engine implementation for Tomcat stand alone
         analyzes the HTTP headers included with the request, and passes them
         on to the appropriate Host (virtual host).
         Documentation at /docs/config/engine.html -->

    <!-- You should set jvmRoute to support load-balancing via AJP ie :
    <Engine name="Catalina" defaultHost="localhost" jvmRoute="jvm1">
    -->
    <Engine name="Catalina" defaultHost="localhost">

      <!--For clustering, please take a look at documentation at:
          /docs/cluster-howto.html  (simple how to)
          /docs/config/cluster.html (reference documentation) -->
      <!--
      <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster"/>
      -->

      <!-- Use the LockOutRealm to prevent attempts to guess user passwords
           via a brute-force attack -->
      <Realm className="org.apache.catalina.realm.LockOutRealm">
        <!-- This Realm uses the UserDatabase configured in the global JNDI
             resources under the key "UserDatabase".  Any edits
             that are performed against this UserDatabase are immediately
             available for use by the Realm.  -->
        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
      </Realm>
      
<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true">
    <!-- ... otras configuraciones ... -->
    <Context path="" docBase="$website" reloadable="true"/>
    <!-- ... otras configuraciones ... -->
</Host>

    </Engine>
  </Service>
</Server>
Server
)"
VerificaActual4="$(cd ..;cd .Server; cd apache-tomcat;cd bin;bash shutdown.sh;./catalina.sh run)"
}

# Crea condición para entrar ApiServer.sh Menu Server
CreaInstallApiServer(){
    VerificaActualInstall="$(cd ..;pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ProcesoInstallApiServer.txt"
    CarpetaContenedoraInstall="$VerificaActualInstall$caracter1$caracter2$texto1"
 
    # Verifica si la carpeta existe
    if [ -d "$CarpetaContenedoraInstall" ]; then
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2" 
    else
        mkdir "$CarpetaContenedoraInstall"
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2"
    fi
}
CondicionTrueoFalse(){
# Verificar si Yaibramir2.sh se ha ejecutado
BuscaRuta="$(cd ..;pwd)"
caracter1="/"
caracter2="."
texto1="Secuencias"
texto2="ProcesoMenuServer.txt"
CarpetaContenedora="$BuscaRuta$caracter1$caracter2$texto1$caracter1$caracter2$texto2"
if [ -e $CarpetaContenedora ]; then
    MenuOpciones
else
    # Mostrar mensaje de error y salir si archivo1.sh no se ha ejecutado
    echo "Este no es el Inicio"
    echo "No ejecutará hasta que"
    echo "Ejecutes el inicio Yaibramir.sh"
    exit 1
fi
}
MenuOpciones
