#!/bin/bash
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
$grn [1] $yellow Descarga Api Server                   
$grn [2] $yellow Simular Servicios Web Hosting                                                                 
$grn [3] $yellow Retornal Inicio                                                                                                  
"${blanco}  

  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' x
  case $x in
      1)
         CreaInstallApiServer
         sleep 1
         clear
         source ApiServer.sh
        ;;
      2)
      	CreaWebHosting
      	sleep 1
      	clear
        source WebHosting.sh
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
CondicionTrueoFalse
