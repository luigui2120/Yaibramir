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
# Crea condición para el Install.sh
CondicionParaAvanzarInstall() {
    VerificaActualInstall="$(pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ProcesoInstall.txt"
    CarpetaContenedoraInstall="$VerificaActualInstall$caracter1$caracter2$texto1"
    
    # Verifica si la carpeta existe
    if [ -d "$CarpetaContenedoraInstall" ]; then
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2" 
    else
        mkdir "$CarpetaContenedoraInstall"
        touch "$CarpetaContenedoraInstall$caracter1$caracter2$texto2"
    fi
}

# Si cumple con la condición puede acceder, si no ejecutar el inicio
CondicionTrueoFalse() {
    BuscaRuta="$(pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ProcesoConexion.txt"
    CarpetaContenedora="$BuscaRuta$caracter1$caracter2$texto1$caracter1$caracter2$texto2"
    
    # Verificar si archivo1.sh se ha ejecutado
    if [ -e $CarpetaContenedora ]; then
        VerificaBanner
    else
        # Mostrar mensaje de error y salir si archivo1.sh no se ha ejecutado
        echo "Este no es el Inicio"
        echo "No ejecutará hasta que"
        echo "Ejecutes el inicio Yaibramir.sh"
        exit 1
    fi
}
BannerX64yX86() {
    color
    echo ""
    echo -e "\e[1;37mQuiere iniciar con Internet:\e[1;31m"
    echo ""
    yellow=$(tput setaf 3)
    red=$(tput setaf 1)
    echo -e "${yellow}[ ✔ ]  ${red}Y  ${yellow}[Para Iniciar con Internet]"
    echo ""
    echo -e "${yellow}[ ✔ ]  ${red}N  ${yellow}[Para Iniciar de Forma Local]"
    echo ""
    Local
}

BannerTermux() {
    color
    echo ""
    echo -e "\e[1;37mQuiere iniciar con Internet:\e[1;31m"
    echo ""
    echo -e $yellow "[ ✔ ] Y ${green}[Para Iniciar con Internet]"
    echo ""
    echo -e $yellow "[ ✔ ] N ${green}[Para Iniciar de Forma Local]"
    echo ""
    Local
}

VerificaBanner() {
    if [ -f /etc/os-release ] && (grep -q 'debian\|arch\|rhel' /etc/os-release); then
        BannerX64yX86
    elif [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        BannerTermux
    else
        echo "Error"
        exit 1  # Salir con un código de error
    fi
}
# Condición para acceder con conexión a Internet o sin Internet
Local() {
    sleep 3
    rm -f "$CarpetaContenedora"
    while :
    do 
        
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' x
        case $x in
            "Y" | "y")
                # Ejecuta Install.sh en el mismo proceso actual
                CondicionParaAvanzarInstall
                sleep 2
                source ./Install.sh
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

CondicionTrueoFalse
