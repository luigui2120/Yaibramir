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
#Verifica que tipo de sistema operativo para instalar los programas
DatosInstallProgramas() {
    {
        cat /etc/*-release /dev/null 2>&1
    } | tee .Secuencias/.DatosPrograma.txt > /dev/null 2>&1
}

Instanpm() {
         DatosInstallProgramas
         consultaProgramas=$(cat .Secuencias/.DatosPrograma.txt)
        if command -v npm >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] npm..............${green}[ Encontrado ]"
        else
        echo "npm no está instalado. Intentando instalar..."
        if [[ $consultaProgramas == *"debian"* ]]; then
            sudo apt-get update
            sudo apt-get install npm
        elif [[ $consultaProgramas == *"rhel"* || $consultaProgramas == *"centos"* || $consultaProgramas == *"centos"* ]]; then
            sudo LANG=C.UTF-8 dnf update
            sudo LANG=C.UTF-8 dnf upgrade --refresh
            sudo LANG=C.UTF-8 dnf install npm -y
        elif [[ $consultaProgramas == *"arch"* ]]; then
            sudo pacman -S npm
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala npm manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "npm ha sido instalado exitosamente."
        else
            echo "No se pudo instalar npm. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
}

Instalocaltunnel() {
         DatosInstallProgramas
         consultaProgramas=$(cat .Secuencias/.DatosPrograma.txt)
        if command -v lt >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] localtunnel..............${green}[ Encontrado ]"
        else
        echo "localtunnel no está instalado. Intentando instalar..."
        if [[ $consultaProgramas == *"debian"* ]]; then
            sudo apt-get update
            sudo npm install -g localtunnel
        elif [[ $consultaProgramas == *"rhel"* || $consultaProgramas == *"centos"* || $consultaProgramas == *"centos"* ]]; then
            sudo LANG=C.UTF-8 dnf update
            sudo LANG=C.UTF-8 dnf upgrade --refresh
            sudo LANG=C.UTF-8 dnf npm install -g localtunnel -y
        elif [[ $consultaProgramas == *"arch"* ]]; then
            sudo npm install -g localtunnel
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala localtunnel manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "localtunnel ha sido instalado exitosamente."
        else
            echo "No se pudo instalar localtunnel. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
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
Instajava() {
         DatosInstallProgramas
         consultaProgramas=$(cat .Secuencias/.DatosPrograma.txt)
        if command -v java >/dev/null 2>&1; then
        echo -e $yellow "[ ✔ ] java..............${green}[ Encontrado ]"
        else
        echo "java no está instalado. Intentando instalar..."
        if [[ $consultaProgramas == *"debian"* ]]; then
            sudo apt-get update
            sudo apt install default-jdk
        elif [[ $consultaProgramas == *"rhel"* || $consultaProgramas == *"centos"* || $consultaProgramas == *"centos"* ]]; then
            sudo LANG=C.UTF-8 dnf update
            sudo LANG=C.UTF-8 dnf upgrade --refresh
            sudo LANG=C.UTF-8 dnf install default-jdk -y
        elif [[ $consultaProgramas == *"arch"* ]]; then
            sudo pacman -S default-jdk
        else
            echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala java manualmente."
            exit 1
        fi
        if [ $? -eq 0 ]; then
            echo "java ha sido instalado exitosamente."
        else
            echo "No se pudo instalar java. Por favor, instálalo manualmente."
            exit 1
        fi
    fi 
}

#Comienza a verificar si es termux e instalar los programas
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

if command -v java >/dev/null 2>&1; then
    echo -e $yellow "[ ✔ ] jdk..............${green}[ Encontrado ]"
else
    echo "jdk no está instalado. Intentando instalar..."
    
    if [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        pkg install openjdk-17
    else
        echo "No se pudo determinar el gestor de paquetes del sistema. Por favor, instala curl manualmente."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "jdk ha sido instalado exitosamente."
    else
        echo "No se pudo instalar jdk. Por favor, instálalo manualmente."
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
        CondicionParaAvanzarInstall
        clear
        sleep 2
        source Condicion.sh  
        
}
#Verifica si termux o debian,arch,rhel para instalar los programas
VerificaSistemasInstall() {
    if [ -f /etc/os-release ] && (grep -q 'debian\|arch\|rhel' /etc/os-release); then
    	  Instanpm
    	  sleep 2
    	  Instalocaltunnel
          sleep 2
          Instapython3
          sleep 2
          Instawget
          sleep 2
          Instaxterm
          sleep 2
          Instajava
          sleep 2
          Instacurl
          sleep 2
          rm -f .Secuencias/.DatosPrograma.txt
          sleep 3
          CondicionParaAvanzarInstall
          sleep 2
          clear
          source Condicion.sh
    elif [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
        InstallProgramaTermux
    else
        echo "Error"
        exit 1  # Salir con un código de error
    fi
}

# Definir el servidor al que se hará ping
servidor="google.com"

# Función para verificar la conexión a la red
verificar_conexion() {
    if ping -c 1 $servidor >/dev/null 2>&1; then
        echo "Conexión a la red: Conectado"
    else
        echo "Conexión a la red: Error"
        exit 1
    fi
}

# Función para mostrar el banner
mostrar_banner() {
    rm -f "$CarpetaContenedora"
    clear
    echo "----------------------------------------"
    echo "       Verificando Conexion             "
    echo "----------------------------------------"
    echo "Servidor: $servidor"
    echo ""
    verificar_conexion
    echo ""
    echo "Resultados"
    resultado_ping=$(ping -c 4 $servidor)
    echo "$resultado_ping"
    echo "----------------------------------------"
    sleep 3
    clear
    VerificaSistemasInstall
}

# Crea condición para el Install.sh
CondicionParaAvanzarInstall() {
    VerificaActualInstall="$(pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="ProcesoCondicion.txt"
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
# Verificar si Yaibramir.sh se ha ejecutado
BuscaRuta="$(pwd)"
caracter1="/"
caracter2="."
texto1="Secuencias"
texto2="ProcesoInstall.txt"
CarpetaContenedora="$BuscaRuta$caracter1$caracter2$texto1$caracter1$caracter2$texto2"
if [ -e $CarpetaContenedora ]; then
    mostrar_banner
else
    # Mostrar mensaje de error y salir si archivo1.sh no se ha ejecutado
    echo "Este no es el Inicio"
    echo "No ejecutará hasta que"
    echo "Ejecutes el inicio Yaibramir.sh"
    exit 1
fi
}
CondicionTrueoFalse
