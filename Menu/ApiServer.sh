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
# Función para descargar y descomprimir archivos en una carpeta específica
download() {
    url="$1"
    output="$2"
    destination="$3"  # Carpeta de destino
    file="$(basename "$url")"

    if [[ -e "$destination/$file" ]]; then
        echo -e "\n${green}[${white}+${green}]${green} $file ya está descargado en $destination"
        sleep 4
        clear
        MenuInicio
    else
        echo -e "\n${green}[${white}+${green}]${cyan} Espere ...."${white}
        sleep 2
        echo -e "\n${green}[${white}+${green}]${cyan} Descargando $file..."${white}
        curl --silent --insecure --fail --retry-connrefused \
            --retry 3 --retry-delay 2 --location --output "${destination}/${file}" "${url}"

        if [[ -e "$destination/$file" ]]; then
		tar -xzf "${destination}/${file}" -C "$destination" > /dev/null 2>&1
		chmod +x "$destination/$file"
		sleep 4
		clear
		MenuInicio
        else
            echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occurred while downloading ${output}."
            { reset_color; exit 1; }
        fi
    fi
}

# Función para instalar Ngrok
install_Ngrok() {
    DatosInicial
    if [ -e "$BusquedaNgrok" ]; then
        sleep 2
        echo -e "\n${green}[${white}+${green}]${green} Ngrok ya está instalado"
    else
        mkdir -p "$BusquedaCarpeta"
        if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
            download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.tgz' 'ngrok' "$BusquedaCarpeta"
        elif [[ "$arch" == *'aarch64'* ]]; then
            download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz' 'ngrok' "$BusquedaCarpeta"
        elif [[ "$arch" == *'x86_64'* ]]; then
            download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz' 'ngrok' "$BusquedaCarpeta"
        else
            download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-386.tgz' 'ngrok' "$BusquedaCarpeta"
        fi
    fi
}

## Install LocalXpose
install_localxpose() {
        DatosInicial
	if [[ -e "$Busquedalocalxpose" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} LocalXpose already installed."
	else
		mkdir -p "$BusquedaCarpeta"
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing LocalXpose..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm.zip' 'loclx'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm64.zip' 'loclx'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-amd64.zip' 'loclx'
		else
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-386.zip' 'loclx'
		fi
	fi
}

# Función para instalar Cloudflared
install_cloudflared() {
    DatosInicial
    if [ -e "$BusquedaCloud" ]; then
        sleep 2
        echo -e "\n${green}[${white}+${green}]${green} Cloudflared ya está instalado"
    else
        mkdir -p "$BusquedaCarpeta"
        if [[ "$arch" == *'arm'* ]]; then
            download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm' 'cloudflared' "$BusquedaCarpeta"
        elif [[ "$arch" == *'aarch64'* ]]; then
            download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64' 'cloudflared' "$BusquedaCarpeta"
        elif [[ "$arch" == *'x86_64'* ]]; then
            download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64' 'cloudflared' "$BusquedaCarpeta"
        else
            download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386' 'cloudflared' "$BusquedaCarpeta"
        fi
    fi
}

# Datos de consulta en el sistema
DatosInicial() {
    color
    BuscaRuta="$(pwd)"
    caracter1="/"
    caracter2="."
    texto1="Server"
    BusquedaCarpeta="$BuscaRuta$caracter1$caracter2$texto1"
    arch=$(uname -m)
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
MenuInicio(){
rm -f "$CarpetaContenedora"
while true; do
VerificaTipoMenu
echo -e -n "${yellow}
╔━━━━━━━━━━━━━━━━━━━━━━━╗
┃ $grn [1] $blanco Instalar Ngrok ${yellow} ┃
╔━━━━━━━━━━━━━━━━━━━━━━━━━━━╗${yellow}
┃ $grn [2] $blanco Ingresar Token Ngrok${yellow}┃
╔━━━━━━━━━━━━━━━━━━━━━━━━━━━━╗
┃ $grn [3] $blanco Instalar Cloudflared ${yellow}┃
╔━━━━━━━━━━━━━━━━━━━━━━━━━━━━╗${yellow}   
┃ $grn [4] $blanco Retornar anterior  ${yellow}  ┃
╚━━━━━━━━━━━━━━━━━━━━━━━━━━━━╝${yellow}
"${blanco}  
  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' x
  case $x in
      1)
        install_Ngrok
        ;;
      2)
         echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa Token:\e[0m""\e[1;31m]\e[0m"
         read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' var_1
         DatosInicial
         cd $caracter1$caracter2$texto1
         ./ngrok $var_1
        ;;
      3)
        install_cloudflared
        ;;
      4)
       CreaRetornarInicio
       sleep 1
       clear
       source MenuServer.sh
        ;;
      *)
        echo Comando invalido \"$x\"
        sleep 3
        reset
        ;;
    esac
  done
}

# Crea condición para el retorno Menu Server
CreaRetornarInicio(){
    VerificaActualInstall="$(cd ..;pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ProcesoMenuServer.txt"
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
# Verificar si MenuServer.sh se ha ejecutado
BuscaRuta="$(cd ..;pwd)"
caracter1="/"
caracter2="."
texto1="Secuencias"
texto2="ProcesoInstallApiServer.txt"
CarpetaContenedora="$BuscaRuta$caracter1$caracter2$texto1$caracter1$caracter2$texto2"
if [ -e $CarpetaContenedora ]; then
    MenuInicio
else
    # Mostrar mensaje de error y salir si archivo1.sh no se ha ejecutado
    echo "Este no es el Inicio"
    echo "No ejecutará hasta que"
    echo "Ejecutes el inicio Yaibramir.sh"
    exit 1
fi
}
CondicionTrueoFalse
