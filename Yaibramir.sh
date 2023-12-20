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
         Permiso1
   	 sleep 2
	 Permiso2
 	 sleep 2
	 Permiso3
	 sleep 2
	 Permiso4
	 sleep 2
	 Permiso5
	 sleep 2
	 Permiso6
	 sleep 2
	 Permiso7
	 sleep 2
	 Permiso8
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

Permiso1() {
    archivo="Condicion.sh"
    if [ -e "$archivo" ] && [ -r "$archivo" ] && [ -w "$archivo" ] && [ -x "$archivo" ]; then
         echo -e $yellow "[ ✔ ] $archivo ${green}[Encontrado]"
    else
        chmod 777 "$archivo"
        echo -e $yellow "[ ✔ ] $archivo ${green}[Permiso dado]"
    fi
}
Permiso2() {
    archivo="Conexion.sh"
    if [ -e "$archivo" ] && [ -r "$archivo" ] && [ -w "$archivo" ] && [ -x "$archivo" ]; then
         echo -e $yellow "[ ✔ ] $archivo ${green}[Encontrado]"
    else
        chmod 777 "$archivo"
        echo -e $yellow "[ ✔ ] $archivo ${green}[Permiso dado]"
    fi
}
Permiso3() {
    archivo="Install.sh"
    if [ -e "$archivo" ] && [ -r "$archivo" ] && [ -w "$archivo" ] && [ -x "$archivo" ]; then
         echo -e $yellow "[ ✔ ] $archivo ${green}[Encontrado]"
    else
        chmod 777 "$archivo"
        echo -e $yellow "[ ✔ ] $archivo ${green}[Permiso dado]"
    fi
}
Permiso4() {
    archivo="Yaibramir.sh"
    if [ -e "$archivo" ] && [ -r "$archivo" ] && [ -w "$archivo" ] && [ -x "$archivo" ]; then
        echo -e $yellow "[ ✔ ] $archivo ${green}[Encontrado]"
    else
        chmod 777 "$archivo"
        echo -e $yellow "[ ✔ ] $archivo ${green}[Permiso dado]"
    fi
}
Permiso5() {
    archivo="Yaibramir2.sh"
    if [ -e "$archivo" ] && [ -r "$archivo" ] && [ -w "$archivo" ] && [ -x "$archivo" ]; then
         echo -e $yellow "[ ✔ ] $archivo ${green}[Encontrado]"
    else
        chmod 777 "$archivo"
        echo -e $yellow "[ ✔ ] $archivo ${green}[Permiso dado]"
    fi
}
Permiso6() {
    archivo="InstallNeo.sh"
    if [ -e "$archivo" ] && [ -r "$archivo" ] && [ -w "$archivo" ] && [ -x "$archivo" ]; then
         echo -e $yellow "[ ✔ ] $archivo ${green}[Encontrado]"
    else
        chmod 777 "$archivo"
        echo -e $yellow "[ ✔ ] $archivo ${green}[Permiso dado]"
    fi
}
Permiso7() {
    archivo="Yaibramir3.sh"
    if [ -e "$archivo" ] && [ -r "$archivo" ] && [ -w "$archivo" ] && [ -x "$archivo" ]; then
         echo -e $yellow "[ ✔ ] $archivo ${green}[Encontrado]"
    else
        chmod 777 "$archivo"
        echo -e $yellow "[ ✔ ] $archivo ${green}[Permiso dado]"
    fi
}
Permiso8() {
    archivo="office.py"
    if [ -e "$archivo" ] && [ -r "$archivo" ] && [ -w "$archivo" ] && [ -x "$archivo" ]; then
         echo -e $yellow "[ ✔ ] $archivo ${green}[Encontrado]"
    else
        chmod 777 "$archivo"
        echo -e $yellow "[ ✔ ] $archivo ${green}[Permiso dado]"
    fi
}
PermisoTermux() {
color
    archivo1="Condicion.sh"
    if [ -e "$archivo1" ] && [ -r "$archivo1" ] && [ -w "$archivo1" ] && [ -x "$archivo1" ]; then
       echo -e $yellow "[ ✔ ] $archivo1 ${green}[Encontrado]"
    else
         chmod 777 "$archivo1"
         echo -e $yellow "[ ✔ ] $archivo1 ${green}[Permiso dado]"
    fi
   sleep 2
    archivo2="Conexion.sh"
    if [ -e "$archivo2" ] && [ -r "$archivo2" ] && [ -w "$archivo2" ] && [ -x "$archivo2" ]; then
        echo -e $yellow "[ ✔ ] $archivo2 ${green}[Encontrado]"
    else
        chmod 777 "$archivo2"
        echo -e $yellow "[ ✔ ] $archivo2 ${green}[Permiso dado]"
    fi
   sleep 2
    archivo3="Install.sh"
    if [ -e "$archivo3" ] && [ -r "$archivo3" ] && [ -w "$archivo3" ] && [ -x "$archivo3" ]; then
        echo -e $yellow "[ ✔ ] $archivo3 ${green}[Encontrado]"
    else
         chmod 777 "$archivo3"
         echo -e $yellow "[ ✔ ] $archivo3 ${green}[Permiso dado]"
    fi
   sleep 2
    archivo4="Yaibramir.sh"
    if [ -e "$archivo4" ] && [ -r "$archivo4" ] && [ -w "$archivo4" ] && [ -x "$archivo4" ]; then
       echo -e $yellow "[ ✔ ] $archivo4 ${green}[Encontrado]"
    else
        chmod 777 "$archivo4"
        echo -e $yellow "[ ✔ ] $archivo4 ${green}[Permiso dado]"
    fi
   sleep 2
    archivo5="InstallNeo.sh"
    if [ -e "$archivo5" ] && [ -r "$archivo5" ] && [ -w "$archivo5" ] && [ -x "$archivo5" ]; then
        echo -e $yellow "[ ✔ ] $archivo5 ${green}[Encontrado]"
    else
        chmod 777 "$archivo5"
        echo -e $yellow "[ ✔ ] $archivo5 ${green}[Permiso dado]"
    fi
   sleep 2
    archivo6="Yaibramir2.sh"
    if [ -e "$archivo6" ] && [ -r "$archivo6" ] && [ -w "$archivo6" ] && [ -x "$archivo6" ]; then
        echo -e $yellow "[ ✔ ] $archivo6 ${green}[Encontrado]"
    else
        chmod 777 "$archivo6"
        echo -e $yellow "[ ✔ ] $archivo6 ${green}[Permiso dado]"
    fi
        sleep 2
     archivo7="Yaibramir3.sh"
    if [ -e "$archivo7" ] && [ -r "$archivo7" ] && [ -w "$archivo7" ] && [ -x "$archivo7" ]; then
        echo -e $yellow "[ ✔ ] $archivo7 ${green}[Encontrado]"
    else
        chmod 777 "$archivo7"
        echo -e $yellow "[ ✔ ] $archivo7 ${green}[Permiso dado]"
    fi
        sleep 2   
      archivo8="office.py"
    if [ -e "$archivo8" ] && [ -r "$archivo8" ] && [ -w "$archivo8" ] && [ -x "$archivo8" ]; then
        echo -e $yellow "[ ✔ ] $archivo8 ${green}[Encontrado]"
    else
        chmod 777 "$archivo8"
        echo -e $yellow "[ ✔ ] $archivo8 ${green}[Permiso dado]"
    fi
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
