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
}
# Si esta en linux ingresa con sudo
# Si esta en termux sin sudo
SudoRoot() {
    if [ "$EUID" -ne 0 ]; then
        printf "${Red}Inicia con ${BGreen}'sudo'${Red} por favor!\n${clr}"
        exit
    elif [ "$EUID" -ne 2 ]; then
         color
	 PermisoLinux
	 sleep 2
         CondicionParaAvanzarInstall
         sleep 2
         clear
         source InstallNeo.sh
    else
        trap 'printf "\n"; stop; exit 1' 2
    fi
}

#Condicion paraejecutar el siguien proceso Conexion.sh
# Crea condición para el Install.sh
CondicionParaAvanzarInstall() {
    VerificaActualInstall="$(pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ProcesoNeofetch.txt"
    CarpetaContenedoraInstall="$VerificaActualInstall$caracter1$caracter2$texto1"
    
    # Verifica si la carpeta existe
    if [ -d "$CarpetaContenedoraInstall" ]; then
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2" 
    else
        mkdir "$CarpetaContenedoraInstall"
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2"
    fi
}

PermisoLinux() {
    Permiso=$(pwd)
    cd ..
    chmod -R ugo+rwx Yaibramir
    cd "$Permiso" || exit
}

PermisoTermux() {
	color
	Permiso=$(pwd)
        cd ..
        chmod -R ugo+rwx Yaibramir
        sleep 2   
        cd "$Permiso" || exit
        sleep 2
        CondicionParaAvanzarInstall
        clear
        sleep 2
        source InstallNeo.sh
}

#Verifica si termux o debian,arch,rhel Chmod
VerificaPermisos() {
    if [ -f /etc/os-release ] && (grep -q 'debian\|arch\|rhel' /etc/os-release); then
          SudoRoot
    elif [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
          PermisoTermux
    else
        echo "Error"
        exit 1  # Salir con un código de error
    fi
}
VerificaPermisos
