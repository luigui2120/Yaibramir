#!/bin/bash
BannerTermux(){
figlet Yaibramir| lolcat -a -d 20
}
MenuOpcionesPHPTermux(){
rm -f "$CarpetaContenedora"
while true; do
BannerTermux
echo -e -n "${yellow}
$grn [1] $yellow PHP con Localhost.run   
$grn [2] $yellow PHP con Cloudflare                                    
$grn [3] $yellow Retornal Inicio                                                                                           
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
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var3
	website=$my_var3
	start_cloudflared
        ;;
      3)

        ;;
      *)
        echo Comando invalido \"$x\"
        sleep 3
        reset
        ;;
    esac
  done
}
MenuOpcionesPHPTermux

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
	cd .Server/www && php -S $HOST:$PORT > /dev/null 2>&1 &
	cd "$ini_site" || exit  &
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
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."
        cd .Server; sleep 2 && termux-chroot ./cloudflared tunnel -url http://$HOST:$PORT --logfile .cld.log > /dev/null 2>&1 &
	sleep 2
	cd "$ini_cloud" || exit 
	sleep 8
	cd ..;cd ..;cd ..;cd .Server;
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log")
	cldflr_url2=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log" | sed 's/https:\/\///')
	cd "$ini_cloud" || exit 
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$cldflr_url"
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 2 : ${verde}$mask@$cldflr_url2"
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
                killall -2 php > /dev/null 2>&1
                # Obtener el PID del proceso
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
                killall -2 php > /dev/null 2>&1
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
MenuOpcionesPHPTermux

