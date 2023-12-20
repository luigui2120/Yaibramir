#!/bin/bash

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

VerificaSistemasSudo() {
    if [ -f /etc/os-release ] && (grep -q 'debian\|arch\|rhel' /etc/os-release); then
        SudoRoot
    elif [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        InstaneofetchTermux
    else
        echo "Error"
        exit 1  # Salir con un código de error
    fi
}


SudoRoot() {
    if [ "$EUID" -ne 0 ]; then
        printf "${Red}Inicia con ${BGreen}'sudo'${Red} por favor!\n${clr}"
        exit
    elif [ "$EUID" -ne 2 ]; then
        InstaneofetchLinux
    else
        trap 'printf "\n"; stop; exit 1' 2
    fi
}

InicioDatos() {
    {
        cat /etc/*-release /dev/null 2>&1
    } | tee .Secuencias/.inicio.txt > /dev/null 2>&1
}


InstaneofetchLinux() {
         InicioDatos
         consultainicio=$(cat .Secuencias/.inicio.txt)
        if command -v neofetch >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] neofetch..............${green}[ Encontrado ]"
        sleep 3
        rm -f .Secuencias/.inicio.txt
        else
        echo "neofetch no está instalado. Intentando instalar..."
        if [[ $consultainicio == *"debian"* ]]; then
            sudo apt-get update
            sudo apt-get install neofetch
        elif [[ $consultainicio == *"rhel"* ]]; then
            sudo yum install neofetch
        elif [[ $consultainicio == *"arch"* ]]; then
            sudo pacman -S neofetch
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala neofetch manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "neofetch ha sido instalado exitosamente."
            rm -f .Secuencias/.inicio.txt
        else
            echo "No se pudo instalar neofetch. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
     sleep 2
     clear
    verificasistema
}
InstaneofetchTermux() {
    if command -v neofetch >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] neofetch..............${green}[ Encontrado ]"
        sleep 2
        clear
         verificasistema
    else
        echo "neofetch no está instalado. Intentando instalar..."
        
        if [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
          pkg install neofetch
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala neofetch manualmente."
            exit 1
        fi
        
        if [ $? -eq 0 ]; then
            echo "neofetch ha sido instalado exitosamente."
            sleep 2
            clear
            verificasistema
        else
            echo "No se pudo instalar neofetch. Por favor, instálalo manualmente."
            exit 1
        fi
    fi
}

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
		./YaibramirLocal.sh
	   else
		chmod 777 YaibramirLocal.sh
		sleep 2
		./YaibramirLocal.sh
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

DatosInstallProgramas() {
    {
        cat /etc/*-release /dev/null 2>&1
    } | tee .Secuencias/.DatosPrograma.txt > /dev/null 2>&1
}

Instapython3() {
         DatosInstallProgramas
         consultaProgramas=$(cat .Secuencias/.DatosPrograma.txt)
        if command -v python3 >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] python3..............${green}[ Encontrado ]"
        else
        echo "python3 no está instalado. Intentando instalar..."
        if [[ $consultaProgramas == *"debian"* ]]; then
            sudo apt-get update
            sudo apt-get install python3
        elif [[ $consultaProgramas == *"rhel"* || $consultaProgramas == *"centos"* || $consultaProgramas == *"centos"* ]]; then
            sudo LANG=C.UTF-8 dnf update
            sudo LANG=C.UTF-8 dnf upgrade --refresh
            sudo LANG=C.UTF-8 dnf install python3 -y
        elif [[ $consultaProgramas == *"arch"* ]]; then
            sudo pacman -S python3
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala python3 manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "python3 ha sido instalado exitosamente."
        else
            echo "No se pudo instalar python3. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
}
Instacurl() {
         DatosInstallProgramas
         consultaProgramas=$(cat .Secuencias/.DatosPrograma.txt)
        if command -v curl >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] curl..............${green}[ Encontrado ]"
        else
        echo "curl no está instalado. Intentando instalar..."
        if [[ $consultaProgramas == *"debian"* ]]; then
            sudo apt-get update
            sudo apt-get install curl
        elif [[ $consultaProgramas == *"rhel"* || $consultaProgramas == *"centos"* || $consultaProgramas == *"centos"* ]]; then
            sudo LANG=C.UTF-8 dnf update
            sudo LANG=C.UTF-8 dnf upgrade --refresh
            sudo LANG=C.UTF-8 dnf install curl -y
        elif [[ $consultaProgramas == *"arch"* ]]; then
            sudo pacman -S curl
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala curl manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "curl ha sido instalado exitosamente."
        else
            echo "No se pudo instalar curl. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
}
Instaxterm() {
         DatosInstallProgramas
         consultaProgramas=$(cat .Secuencias/.DatosPrograma.txt)
        if command -v xterm >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] xterm..............${green}[ Encontrado ]"
        else
        echo "xterm no está instalado. Intentando instalar..."
        if [[ $consultaProgramas == *"debian"* ]]; then
            sudo apt-get update
            sudo apt-get install xterm
        elif [[ $consultaProgramas == *"rhel"* || $consultaProgramas == *"centos"* || $consultaProgramas == *"centos"* ]]; then
            sudo LANG=C.UTF-8 dnf update
            sudo LANG=C.UTF-8 dnf upgrade --refresh
            sudo LANG=C.UTF-8 dnf install xterm -y
        elif [[ $consultaProgramas == *"arch"* ]]; then
            sudo pacman -S xterm
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala xterm manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "xterm ha sido instalado exitosamente."
        else
            echo "No se pudo instalar xterm. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
}
Instawget() {
         DatosInstallProgramas
         consultaProgramas=$(cat .Secuencias/.DatosPrograma.txt)
        if command -v wget >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] wget..............${green}[ Encontrado ]"
        else
        echo "wget no está instalado. Intentando instalar..."
        if [[ $consultaProgramas == *"debian"* ]]; then
            sudo apt-get update
            sudo apt-get install wget
        elif [[ $consultaProgramas == *"rhel"* || $consultaProgramas == *"centos"* || $consultaProgramas == *"centos"* ]]; then
            sudo LANG=C.UTF-8 dnf update
            sudo LANG=C.UTF-8 dnf upgrade --refresh
            sudo LANG=C.UTF-8 dnf install wget -y
        elif [[ $consultaProgramas == *"arch"* ]]; then
            sudo pacman -S wget
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala wget manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "wget ha sido instalado exitosamente."
        else
            echo "No se pudo instalar wget. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
}
Instalolcat() {
         DatosInstallProgramas
         consultaProgramas=$(cat .Secuencias/.DatosPrograma.txt)
        if command -v lolcat >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] lolcat..............${green}[ Encontrado ]"
        else
        echo "lolcat no está instalado. Intentando instalar..."
        if [[ $consultaProgramas == *"debian"* ]]; then
           sudo apt-get update
           sudo apt-get install lolcat
        elif [[ $consultaProgramas == *"rhel"* || $consultaProgramas == *"centos"* || $consultaProgramas == *"centos"* ]]; then
            sudo LANG=C.UTF-8 dnf update
            sudo LANG=C.UTF-8 dnf upgrade --refresh
            sudo LANG=C.UTF-8 dnf install lolcat -y
        elif [[ $consultaProgramas == *"arch"* ]]; then
            sudo pacman -S lolcat
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala lolcat manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "lolcat ha sido instalado exitosamente."
        else
            echo "No se pudo instalar lolcat. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
}
Instafiglet() {
         DatosInstallProgramas
         consultaProgramas=$(cat .Secuencias/.DatosPrograma.txt)
        if command -v figlet >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] figlet..............${green}[ Encontrado ]"
        else
        echo "figlet no está instalado. Intentando instalar..."
        if [[ $consultaProgramas == *"debian"* ]]; then
           sudo apt-get update
           sudo apt-get install figlet
        elif [[ $consultaProgramas == *"rhel"* || $consultaProgramas == *"centos"* || $consultaProgramas == *"centos"* ]]; then
            sudo LANG=C.UTF-8 dnf update
            sudo LANG=C.UTF-8 dnf upgrade --refresh
            sudo LANG=C.UTF-8 dnf install figlet -y
        elif [[ $consultaProgramas == *"arch"* ]]; then
            sudo pacman -S figlet
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala figlet manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "figlet ha sido instalado exitosamente."
        else
            echo "No se pudo instalar figlet. Por favor, instálalo manualmente."
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
    VerificaSistemasInstall
  fi
}

InstallProgramaTermux() {
if command -v python3 >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] python3..............${green}[ Encontrado ]"
else
    echo "python3 no está instalado. Intentando instalar..."
    
    if [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        pkg install python3
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala python3 manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "python3 ha sido instalado exitosamente."
    else
        echo "No se pudo instalar python3. Por favor, instálalo manualmente."
        exit 1
    fi
fi
sleep 2
if command -v lolcat >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] lolcat..............${green}[ Encontrado ]"
else
    echo "lolcat no está instalado. Intentando instalar..."
    
    if [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        pkg install pip -y
        pip install lolcat
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala lolcat manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "lolcat ha sido instalado exitosamente."
    else
        echo "No se pudo instalar lolcat. Por favor, instálalo manualmente."
        exit 1
    fi
fi
sleep 2
if command -v curl >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] curl..............${green}[ Encontrado ]"
else
    echo "curl no está instalado. Intentando instalar..."
    
    if [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        pkg install curl
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala curl manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "curl ha sido instalado exitosamente."
    else
        echo "No se pudo instalar curl. Por favor, instálalo manualmente."
        exit 1
    fi
fi
sleep 2
if command -v figlet >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] figlet..............${green}[ Encontrado ]"
else
    echo "figlet no está instalado. Intentando instalar..."
    
    if [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        pkg install figlet
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala figlet manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "figlet ha sido instalado exitosamente."
    else
        echo "No se pudo instalar figlet. Por favor, instálalo manualmente."
        exit 1
    fi
fi
sleep 2
if command -v wget >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] wget..............${green}[ Encontrado ]"
else
    echo "wget no está instalado. Intentando instalar..."
    
    if [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        pkg install wget
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala wget manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "wget ha sido instalado exitosamente."
    else
        echo "No se pudo instalar wget. Por favor, instálalo manualmente."
        exit 1
    fi
fi   
        sleep 2
        Iniciar   
}

VerificaSistemasInstall() {
    if [ -f /etc/os-release ] && (grep -q 'debian\|arch\|rhel' /etc/os-release); then
          Instapython3
          sleep 2
          Instawget
          sleep 2
          Instaxterm
          sleep 2
          Instacurl
          sleep 2
          Instalolcat
          sleep 2
          Instafiglet
          sleep 2
          rm -f .Secuencias/.DatosPrograma.txt
          Iniciar
    elif [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        InstallProgramaTermux
    else
        echo "Error"
        exit 1  # Salir con un código de error
    fi
}


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
verificasistema() {
    rm -f inicio.txt
    {
        command -v systemctl
        command -v service
        cat /etc/*-release /dev/null 2>&1
        neofetch /dev/null 2>&1
    } | tee tipo.txt > /dev/null 2>&1

    consulta=$(cat tipo.txt)

    if [[ $consulta == *"debian"* && $consulta == *"systemctl"* && $consulta == *"service"* ]]; then
        rm -f tipo.txt
        Local
    elif [[ $consulta == *"debian"* && $consulta == *"service"* ]]; then
        rm -f tipo.txt
        Local
    elif [[ $consulta == *"Android"* ]]; then
        rm -f tipo.txt
        Local
    elif [[ $consulta == *"arch"* && $consulta == *"systemctl"* && $consulta == *"service"* ]]; then
        rm -f tipo.txt
        Local
    elif [[ $consulta == *"arch"* && $consulta == *"service"* ]]; then
        rm -f tipo.txt
        Local
    else
        echo "Error: Comunicarse con el Administrador"
        exit 1
    fi
}

RutaVerificacion(){
VerificaActual="$(pwd)"
caracter="/"
caracter2="."
texto="Secuencias"
texto2="Proceso.txt"
CarpetaContenedora="$VerificaActual$caracter$caracter2$texto"

# Verifica si la carpeta existe
if [ -d "$CarpetaContenedora" ]; then
    touch "$CarpetaContenedora$caracter$caracter2$texto2" 
     ./Yaibramir2.sh
else
    mkdir "$CarpetaContenedora"
    touch "$CarpetaContenedora$caracter$caracter2$texto2"
    ./Yaibramir2.sh
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
continuar_menu=true
while true; do
figlet Yaibramir| lolcat -a -d 20
color
echo -e -n "${yellow}
$grn [1] $yellow Descarga la interfast de una pagina html                    
$grn [2] $yellow Descarga una pagina completa de html vulnerando robot       
$grn [3] $yellow Descarga html aun con restricciones                          
$grn [4] $yellow Descarga html con limite de velocidad para no ser 
detectado
$grn [5] $yellow Descarga la página web completa (imágenes y 
recursos asociados)             
$grn [6] $yellow Descarga la página web completa (html y pdf)                    
$grn [7] $yellow Ver el contenido del archivo                                      
$grn [8] $yellow Programar pagina web                                                                          
$grn [9] $yellow Servidores                                   
$grn [10] $yellow Enviar al correo gmail                                   
$grn [11] $yellow Mas Opciones                                                                                                  
"${blanco}  

  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' x
  case $x in
    1)
  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la URL de la página:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var 
  echo -n "¿Desea poner nombre al archivo (y/n)? "
  read answer1
  if [ "$answer1" != "${answer1#[Yy]}" ]; then
    ruta_actual="$(pwd)"
    carpeta_destino="$ruta_actual/Descargas"  # Reemplaza con la ruta de la carpeta de destino deseada
    # Verifica si la carpeta de destino existe, si no, la crea
    if [ ! -d "$carpeta_destino" ]; then
        echo "La carpeta de destino no existe. Creando la carpeta..."
        mkdir -p "$carpeta_destino"
    fi
    cd "$carpeta_destino" || exit 1
    echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa el nombre:\e[0m""\e[1;31m]\e[0m"
    read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var6
    wget "$my_var" -O "$my_var6.html" -o /dev/null
    sleep 3
    echo "Descarga completa en $carpeta_destino"
    sleep 3
    cd "$ruta_actual" || exit 1
    clear 
  else
    if [ "$answer1" != "${answer1#[Nn]}" ]; then
        ruta_actual="$(pwd)"
        carpeta_destino="$ruta_actual/Descargas"  # Reemplaza con la ruta de la carpeta de destino deseada

        # Verifica si la carpeta de destino existe, si no, la crea
        if [ ! -d "$carpeta_destino" ]; then
            echo "La carpeta de destino no existe. Creando la carpeta..."
            mkdir -p "$carpeta_destino"
        fi
        cd "$carpeta_destino" || exit 1
        wget "$my_var" -O index.html -o /dev/null
        sleep 5
        echo "Descarga completa en $carpeta_destino"
        sleep 3
        cd "$ruta_actual" || exit 1
        clear
    fi
fi
      ;;
    2)
         ruta_actual="$(pwd)"
         carpeta_destino="$ruta_actual/Descargas"  # Reemplaza con la ruta de la carpeta de destino deseada
	 cd "$carpeta_destino" || exit 1
	 echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la pagina:\e[0m""\e[1;31m]\e[0m"
         read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var8
         wget  -r -p -U Mozilla $my_var8 
         echo "Eso es todo, en unos minutos esto finalizara"| lolcat -a -d 20
         sleep 3
         cd "$ruta_actual" || exit 1
	 clear
    ;;
    3)
	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la URL de la página:\e[0m""\e[1;31m]\e[0m"
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var9
	ruta_actual="$(pwd)"
	carpeta_destino="$ruta_actual/Descargas"  
	if [ ! -d "$carpeta_destino" ]; then
    	echo "La carpeta de destino no existe. Creando la carpeta..."
    	mkdir -p "$carpeta_destino"
	fi
	cd "$carpeta_destino" || exit 1
	wget -r -k "$my_var9"
	if [ $? -eq 0 ]; then
    	echo "La descarga se ha completado con éxito en $carpeta_destino"
	else
    	echo "La descarga ha fallado."
	fi
	cd "$ruta_actual" || exit 1
	clear
    ;;
    4)
            ruta_actual="$(pwd)"
        carpeta_destino="$ruta_actual/Descargas"  # Reemplaza con la ruta de la carpeta de destino deseada
	 cd "$carpeta_destino" || exit 1
	 echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la pagina:\e[0m""\e[1;31m]\e[0m"
         read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var10
         wget --wait=20 --limit-rate=20K -r -p -U Mozilla $my_var10 
         echo "Eso es todo, en unos minutos esto finalizara"| lolcat -a -d 20
         sleep 3
         cd "$ruta_actual" || exit 1
	 clear
    ;;
    5)
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la URL de la página:\e[0m""\e[1;31m]\e[0m"
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mEjemplo https://ejemplo.com:\e[0m""\e[1;31m]\e[0m"
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var11
ruta_actual="$(pwd)"
carpeta_destino="$ruta_actual/Descargas"
if [ ! -d "$carpeta_destino" ]; then
    echo "La carpeta de destino no existe. Creando la carpeta..."
    mkdir -p "$carpeta_destino"
fi
cd "$carpeta_destino" || exit 1
wget --recursive --level=inf --page-requisites --convert-links --no-parent "$my_var11"
if [ $? -eq 0 ]; then
    echo "La descarga se ha completado con éxito en $carpeta_destino"
else
    echo "La descarga ha fallado."
fi
cd "$ruta_actual" || exit 1
clear
    ;;
    6)
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la URL de la página:\e[0m""\e[1;31m]\e[0m"
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mEjemplo https://ejemplo.com:\e[0m""\e[1;31m]\e[0m"
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var12
ruta_actual="$(pwd)"
carpeta_destino="$ruta_actual/Descargas"
if [ ! -d "$carpeta_destino" ]; then
    echo "La carpeta de destino no existe. Creando la carpeta..."
    mkdir -p "$carpeta_destino"
fi
cd "$carpeta_destino" || exit 1
wget --recursive --level=inf --page-requisites --convert-links --no-parent --no-clobber --wait=1 --limit-rate=200k --user-agent="Mozilla" "$my_var12"
if [ $? -eq 0 ]; then
    echo "La descarga se ha completado con éxito en $carpeta_destino"
else
    echo "La descarga ha fallado."
fi
cd "$ruta_actual" || exit 1
clear

      ;;
    7)
	while :
do                                                                           
     	echo -e "\e[1;31m┌─[\e[0m""\e[1;37mPreciona Y para continuar:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' xy
        sleep 2
        clear 
  case $xy in
		"Y" | "y")
        echo "Recurda que la carpeta actual es Yaibramir/"
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mNombre de la Carpeta:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var3
        ruta_actual="$(pwd)"
        carpeta_destino="$ruta_actual/$my_var3/"
# Obtén la lista de archivos y carpetas
archivos=$(ls)

# Imprime la lista en formato horizontal con colores
for archivo in $archivos; do
    # Si es una carpeta, aplícale color azul
    if [ -d "$archivo" ]; then
        color="\e[1;34m"  # Azul para carpetas
    else
        # Obtén la extensión del archivo (si es un archivo)
        extension="${archivo##*.}"
        case "$extension" in
            html)
                color="\e[1;31m"  # Rojo para archivos HTML
                ;;
            js)
                color="\e[1;35m"  # Rojo para archivos JavaScript
                ;;
            sh)
                color="\e[1;33m"  # Naranja para archivos shell
                ;;
            py)
                color="\e[1;37m"  # Naranja para archivos Python
                ;;
            *)
                color="\e[0m"     # Restablece el color para otros tipos de archivos
                ;;
        esac
    fi

    printf "${color}${archivo}\e[0m "
done

echo
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mNombre del Archivo:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var4      
	cat $my_var4
        cd "$ruta_actual" || exit 1
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
    8)

    ;;

   9)
   	cd Menu
   	cd Servidores 
   	 reset	
	sudo ./config.sh
    ;;
    10)
      sleep 1
      clear
      python3 office.py
    ;;
   11)
      RutaVerificacion
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
VerificaSistemasSudo
