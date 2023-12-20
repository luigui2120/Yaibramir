#!/bin/bash
# Check if root
Local(){
while :
do 
	echo ""
        echo "Quiere iniciar con Internet"
	echo ""                              
	echo "Precione "\""Y"\"" Para Iniciar con Internet"
	echo ""  
	echo "Precione "\""N"\"" Para Iniciar de Forma Local"
	echo ""                              
  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' x
  case $x in
		"Y" | "y")
               checkinternet
	;;

		"N" | "n")
		cd Local
		archivo="Yaibramir.sh"
       if [ -e "$archivo" ] && $( [ -r "$archivo" ] ) && $( [ -w "$archivo" ] ) && $( [ -x "$archivo" ] ) ; then
		./Yaibramir.sh
	   else
		chmod 777 Yaibramir.sh
		sleep 2
		./Yaibramir.sh
		fi
		;;
    *)
      echo Comando invalido \"$x\"
     sleep 3
	reset
      ;;
  esac
done	

}
SudoRoot(){
if [ "$EUID" -ne 0 ]; then
                printf "${Red}Inicia con el ${BGreen}'sudo' ${Red}Porfavor!\n${clr}"
                exit
elif [ "$EUID" -ne 2 ]; then
Local
else
            trap 'printf "\n";stop;exit 1' 2

fi
}
#Check Programan
Instapython3(){
if command -v python3 >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] Python3..............${green}[ Encontrado ]"
else
    echo "Python3 no está instalado. Intentando instalar..."
    
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install python3
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install python3
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S python3
     elif command -v pkg >/dev/null 2>&1; then
             pkg install python3
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala Python3 manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "Python3 ha sido instalado exitosamente."
    else
        echo "No se pudo instalar Python3. Por favor, instálalo manualmente."
        exit 1
    fi
fi
}
Instawget(){
if command -v wget >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] Wget..............${green}[ Encontrado ]"
else
    echo "Wget no está instalado. Intentando instalar..."
    
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install wget
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install wget
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S wget
     elif command -v pkg >/dev/null 2>&1; then
             pkg install wget
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala Wget manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "Wget ha sido instalado exitosamente."
    else
        echo "No se pudo instalar Wget. Por favor, instálalo manualmente."
        exit 1
    fi
fi
}
Instaxterm(){
if command -v xterm >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] Xterm..............${green}[ Encontrado ]"
else
    echo "Xterm no está instalado. Intentando instalar..."
    
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install xterm
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install xterm
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S xterm
     elif command -v pkg >/dev/null 2>&1; then
             pkg install xterm
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala Xterm manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "Xterm ha sido instalado exitosamente."
    else
        echo "No se pudo instalar Xterm. Por favor, instálalo manualmente."
        exit 1
    fi
fi
}
Instacurl(){
if command -v curl >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] Curl..............${green}[ Encontrado ]"
else
    echo "Curl no está instalado. Intentando instalar..."
    
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get install curl
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install curl
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S curl
     elif command -v pkg >/dev/null 2>&1; then
             pkg install curl
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala Curl manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "Curl ha sido instalado exitosamente."
    else
        echo "No se pudo instalar Curl. Por favor, instálalo manualmente."
        exit 1
    fi
fi
}
Instalolcat(){
if command -v lolcat >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] Lolcat..............${green}[ Encontrado ]"
else
    echo "Lolcat no está instalado. Intentando instalar..."
    
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get install lolcat
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install lolcat
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S lolcat
     elif command -v pkg >/dev/null 2>&1; then
             pkg install lolcat
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala Lolcat manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "Lolcat ha sido instalado exitosamente."
    else
        echo "No se pudo instalar Lolcat. Por favor, instálalo manualmente."
        exit 1
    fi
fi
}
# check internet 
function checkinternet(){
  ping -c 1 google.com > /dev/null 2>&1
  if [[ "$?" != 0 ]]; then
    echo -e " Conectando al Internet" 
    sleep 1
    echo -e " Conectando al Internet"
    sleep 1
    echo -e " Conectando al Internet:${Red}CONEXIÓN FALLIDA"
    echo 
    echo -e $red "Este script necesita una conexión a Internet Activa"
    sleep 2
        exit
  else
negro="\e[1;30m"
azul="\e[1;34m"
verde="\e[1;32m"
cian="\e[1;36m"
rojo="\e[1;31m"
purpura="\e[1;35m"
amarillo="\e[1;33m"
blanco="\e[1;37m"
      echo -e -n "${verde}
     ┌═══════════════════════┐
     █${yellow}Conectando al Internet${verde} █
     └═══════════════════════┘
                 "${blanco}
    sleep 1
    echo -e -n "${verde}
     ┌═══════════════════════┐
     █${yellow}Conectando al Internet${verde} █
     └═══════════════════════┘
                 "${blanco}
    sleep 1
    echo -e -n "${verde}
     ┌═══════════════════════┐
     █${yellow}Conectando al Internet${verde} █
     └═══════════════════════┘
                 "${blanco}
    sleep 1
    echo -e -n "${verde}
     ┌══════════════════════════════════┐
     █${yellow}Conectando al Internet: ${LighGreenF}CONECTADO${verde} █
     └══════════════════════════════════┘
                 "${blanco}
    sleep 3
    clear
     Instapython3
     Instawget
     Instaxterm
     Instacurl
     Instalolcat
     sleep 2
     Iniciar
  fi
}

sleep 2
trap 'printf "\n";stop;exit 1' 2
# detect ctrl+c exiting
trap ctrl_c INT
ctrl_c() {
clear
bannerExit
exit
}
reset
bannerExit(){
echo -e "${verde}
   		      
${rojo}   Gracias por Utilizar Mis Herramientas   
					         
${blanco}             luigui2120                         
					        
${blanco} Visita mis proyectos en la siguiente url:   
	                                        
${blanco}  https://github.com/luigui2120                			         

"${blanco}
sleep 5	
exit
}

DIA=`date +"%d/%m/%Y"`
HORA=`date +"%H:%M"`
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
stop() {

printf "${Green}[${BRed}R${Green}]${BGreen} Re-Run the script\n"
printf "${Green}[${BRed}X${Green}]${BGreen} Exit\n"
read -p "Option: " guard

if [[ $guard == R || $guard == r ]]; then
sleep 1
killall -2 php > /dev/null 2>&1
killall -2 lt > /dev/null 2>&1
killall -2 xterm > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
killall ssh > /dev/null 2>&1
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
sleep 0.5
cd Menu
./retornal.sh

elif [[ $guard == X || $guard == x ]]; then
sleep 2
exit
else
exit
fi

}
Iniciar(){
sleep 3
clear
	echo -e -n "${verde}
             ┌══════════════════════════┐
             █${blanco}  TERMINOS Y CONDICIONES${verde}  █
             └══════════════════════════┘
                   "${blanco}
	echo ""
        echo "Si utilzias este Script aceptas las siguiente condiciónes:"
	echo ""
	echo "1) No clonar sitios web que pertenescan a bancos"
	echo ""
	echo "2) No clonar sitios institucionales sin permiso u autorización"
	echo ""
	echo "3) Mantegamonos sobre los limites de las politicas segùn tu paìs"
	echo ""
	echo "3) El autor no se hace responsable de mal uso del script"
	echo ""
	echo "Precione "\""Y"\"" Enter para Continuar"
	echo ""

	read x

	case "$x" in
		"Y" | "y")
	clear	
while :
do 
figlet Yaibramir| lolcat -a -d 20
color
echo -e -n "${yellow}
$grn [1] $yellow Copiar el interfast de una pagina html                    
$grn [2] $yellow Copiar una pagina completa de html vulnerando robot       
$grn [3] $yellow Copiar html aun con restricciones                          
$grn [4] $yellow Copiar html con limite de velocidad para no ser detectado                                 
$grn [5] $yellow Ver el contenido del archivo                                      
$grn [6] $yellow Programar pagina web                                                                          
$grn [7] $yellow Servidores                                   
$grn [8] $yellow Enviar al correo gmail                                   
$grn [9] $yellow Mas Opciones                                                                                                  
"${blanco}  

  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' x
  case $x in
    1)
      echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa pagina:\e[0m""\e[1;31m]\e[0m"
      read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var 
      echo -n "Desea poner nombre a al archivo(y/n)? "
      read answer1
      clear 

      ;;
    2)
	cd Descargas
	 echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la pagina:\e[0m""\e[1;31m]\e[0m"
         read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var8
         wget  -r -p -U Mozilla $my_var8 
         echo "Eso es todo, en unos minutos esto finalizara"| lolcat -a -d 20
         sleep 3
	 clear
    ;;
    3)
	cd Descargas
	 echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la pagina:\e[0m""\e[1;31m]\e[0m"
         read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var9
         wget -r -k $my_var9 
         echo "Eso es todo, en unos minutos esto finalizara"| lolcat -a -d 20
         sleep 3
	 clear
    ;;
    4)
	cd Descargas
	 echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la pagina:\e[0m""\e[1;31m]\e[0m"
         read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var10
         wget --wait=20 --limit-rate=20K -r -p -U Mozilla $my_var10 
         echo "Eso es todo, en unos minutos esto finalizara"| lolcat -a -d 20
         sleep 3
	 clear
    ;;

    5)
	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mNombre de la Carpeta:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var3
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mNombre del Archivo:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var4
        cd Menu
        cd PaginasWeb
        cd $my_var3
	cat $my_var4
	echo "Desea Buscar otro Archivo y/n"
	while :
do                                                                           
  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' xy
  case $xy in
		"Y" | "y")
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mNombre de la Carpeta:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var3
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mNombre del Archivo:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var4
        cd /
        PWD=$(pwd)
        cd $PWD Menu/PaginasWeb/$my_var3
	cat $my_var4
	echo "Desea Buscar otro Archivo y/n"
	;;

		"N" | "n")
		bannerExit
		exit
		;;
    *)
      echo Comando invalido \"$xy\"
     sleep 3
	reset
      ;;
  esac
done	
      ;;
    6)


      ;;

   7)
   	cd Menu
   	cd Servidores 
   	 reset	
	sudo ./config.sh
    ;;
    8)
      sleep 1
      clear
      python3 office.py
    ;;
   9)
      cd Menu
      ./retorna.sh
    ;;
     HELP|help)
     echo "hola senores"
     clear
    ;;
OPTIONS|options)
     echo "hola senores"
     clear
    ;;
    *)
      echo Comando invalido \"$x\"
     sleep 3
	reset
      ;;
  esac
done		;;

		"N" | "n")
		bannerExit
		;;
    *)
      echo Comando invalido \"$x\"
     sleep 3
	reset
      ;;
  esac	

}
SudoRoot
color
