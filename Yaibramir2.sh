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

trap 'printf "\n";stop;exit 1' 2
# detect ctrl+c exiting
trap ctrl_c INT
ctrl_c() {
clear
bannerExit
exit
}
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
Iniciar(){
while :
do 
VerificaTipoMenu
rm -f "$CarpetaContenedora"
echo -e -n "${yellow}
$grn [1] $yellow Descarga la interfast de una pagina html                    
$grn [2] $yellow Descarga web completa, ignora robots       
$grn [3] $yellow Descarga html aun con restricciones                          
$grn [4] $yellow Descarga HTML a velocidad limitada para discreción
$grn [5] $yellow Descarga la web completa (con imágenes y recursos)            
$grn [6] $yellow Descarga la web entera, incluyendo PDF                  
$grn [7] $yellow Ver el contenido del archivo                                      
$grn [8] $yellow Programar pagina web                                                                          
$grn [9] $yellow Servidores                                   
$grn [10] $yellow Enviar Archivos a correos                                   
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
          carpeta_destino="$ruta_actual/Descargas"
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
            carpeta_destino="$ruta_actual/Descargas"
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
        carpeta_destino="$ruta_actual/Descargas"
        cd "$carpeta_destino" || exit 1
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la pagina:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var8
        wget  -r -p -U Mozilla $my_var8 
        echo "Eso es todo, en unos minutos esto finalizara" | lolcat -a -d 20
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
        carpeta_destino="$ruta_actual/Descargas"
        cd "$carpeta_destino" || exit 1
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la pagina:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var10
        wget --wait=20 --limit-rate=20K -r -p -U Mozilla $my_var10 
        echo "Eso es todo, en unos minutos esto finalizara" | lolcat -a -d 20
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
              archivos=$(ls)
              for archivo in $archivos; do
                if [ -d "$archivo" ]; then
                  color="\e[1;34m"
                else
                  extension="${archivo##*.}"
                  case "$extension" in
                    html)
                      color="\e[1;31m"
                      ;;
                    js)
                      color="\e[1;35m"
                      ;;
                    sh)
                      color="\e[1;33m"
                      ;;
                    py)
                      color="\e[1;37m"
                      ;;
                    *)
                      color="\e[0m"
                      ;;
                  esac
                fi
                printf "${color}${archivo}\e[0m "
              done
              echo
              echo -e "\e[1;31m┌─[\e[0m""\e[1;37mNombre del Archivo:\e[0m""\e[1;31m]\e[0m"
              read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var4      
              cat "$my_var4"
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
        # Agrega aquí tu código para la opción 8
        ;;
      9)
        sleep 1
        CreaMenuserver
        sleep 1
        cd Menu
        clear
        source MenuServer.sh
        ;;
      10)
        sleep 1
        officeCorreo
        sleep 1
        clear
        python3 office.py
        ;;
      11)
        CondicionParaAvanzarInstall
        clear
        source Yaibramir3.sh
        ;;
      *)
        echo Comando invalido \"$x\"
        sleep 3
        reset
        ;;
    esac
  done
}
# Crea condición para el office.sh
officeCorreo(){
VerificaActual="$(pwd)"
caracter="/"
caracter2="."
texto="Secuencias"
texto2="office.txt"
CarpetaContenedora="$VerificaActual$caracter$caracter2$texto"
# Verifica si la carpeta existe
if [ -d "$CarpetaContenedora" ]; then
    touch "$CarpetaContenedora$caracter$caracter2$texto2" 
else
    mkdir "$CarpetaContenedora"
    touch "$CarpetaContenedora$caracter$caracter2$texto2"

fi

}
# Crea condición para entrar ApiServer.sh Menu Server
CreaMenuserver(){
    VerificaActualInstall="$(pwd)"
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
# Crea condición para el Yaibramir2.sh
CondicionParaAvanzarInstall() {
    VerificaActualInstall="$(pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="Yaibramir3.txt"
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
    texto2="Yaibramir2.txt"
    CarpetaContenedora="$BuscaRuta$caracter1$caracter2$texto1$caracter1$caracter2$texto2"
    
    # Verificar si archivo1.sh se ha ejecutado
    if [ -e $CarpetaContenedora ]; then
        Iniciar
    else
        # Mostrar mensaje de error y salir si archivo1.sh no se ha ejecutado
        echo "Este no es el Inicio"
        echo "No ejecutará hasta que"
        echo "Ejecutes el inicio Yaibramir.sh"
        exit 1
    fi
}
CondicionTrueoFalse
