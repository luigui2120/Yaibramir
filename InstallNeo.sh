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
#Condicion paraejecutar el siguien proceso Conexion.sh
# Crea condición para el Install.sh
CondicionParaAvanzarInstall() {
    VerificaActualInstall="$(pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ProcesoConexion.txt"
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
    texto2="ProcesoNeofetch.txt"
    CarpetaContenedora="$BuscaRuta$caracter1$caracter2$texto1$caracter1$caracter2$texto2"
    
    # Verificar si archivo1.sh se ha ejecutado
    if [ -e $CarpetaContenedora ]; then
        VerificaNeofetch
    else
        # Mostrar mensaje de error y salir si archivo1.sh no se ha ejecutado
        echo "Este no es el Inicio"
        echo "No ejecutará hasta que"
        echo "Ejecutes el inicio Yaibramir.sh"
        exit 1
    fi
}
# Verifica si esta en modo sudo
# Si ejecuta Sudo y verifica que es linux debian,arch,rhel ingresara al siguiente proceso
# No Si en caso verifica que termux sin sudo sigue al siguiente proceso
VerificaNeofetch() {
    if [ -f /etc/os-release ] && (grep -q 'debian\|arch\|rhel' /etc/os-release); then
        InstaneofetchLinux
    elif [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        InstaneofetchTermux
    else
        echo "Error"
        exit 1  # Salir con un código de error
    fi
}

# Consultalos datos para poder descargar en que tipo de arquitectura debian,arch,rhel o termux
InicioDatos() {
    {
        cat /etc/*-release /dev/null 2>&1
    } | tee .Secuencias/.DatosNeofetch.txt > /dev/null 2>&1
}
# Descarga Neofetch segun el tipo de arquitectura
#Neofetch para linux
InstaneofetchLinux() {
         rm -f "$CarpetaContenedora"
         color
         InicioDatos
         consultainicio=$(cat .Secuencias/.DatosNeofetch.txt)
        if command -v neofetch >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] neofetch..............${green}[ Encontrado ]"
        sleep 3
        rm -f "$CarpetaContenedora"
        rm -f .Secuencias/.DatosNeofetch.txt
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
            rm -f "$CarpetaContenedora"
        else
            echo "No se pudo instalar neofetch. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
     sleep 2
     CondicionParaAvanzarInstall
     sleep 2
     clear
   source Conexion.sh
}
#Neofetch para Termux
InstaneofetchTermux() {
    if command -v neofetch >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] neofetch..............${green}[ Encontrado ]"
        sleep 2
        rm -f "$CarpetaContenedora"
        clear
        CondicionParaAvanzarInstall
        sleep 2
        source Conexion.sh
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
            rm -f "$CarpetaContenedora"
            rm -f .Secuencias/.DatosNeofetch.txt
            sleep 2
            CondicionParaAvanzarInstall
            sleep 2
            source Conexion.sh
        else
            echo "No se pudo instalar neofetch. Por favor, instálalo manualmente."
            exit 1
        fi
    fi
}
CondicionTrueoFalse

