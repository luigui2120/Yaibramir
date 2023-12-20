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
color 
echo -e -n "${yellow}
╔━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╗  ╔━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╗${yellow}
┃ $grn [1] $blanco Descargar Tomcat      ${yellow}  ┃  ┃ $grn [2] $blanco Descargar Glassfish-5.0${yellow}   ┃
╔━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╗  ╔━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╗${yellow}   
┃ $grn [3] $blanco Descargar JDK-8${yellow}         ┃  ┃ $grn [4] $blanco Descargar JDK-18${yellow}          ┃
╚━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╝  ╚━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╝${yellow}
"${blanco} 
echo -e -n "${yellow}
     ┌═══════════════┐
     █${red}Ingresa opcion${yellow} █
     └═══════════════┘
"${blanco}
read -p $'\e[1;31m     └──╼\e[0m\e[1;92m '  OpcionInicial
if [ $OpcionInicial -eq 1 ]; then
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.zip
elif [ $OpcionInicial -eq 2 ]; then
wget http://download.oracle.com/glassfish/5.0/release/glassfish-5.0.zip
elif [ $OpcionInicial -eq 3 ]; then
wget download.oracle.com/otn/java/jdk/8u202-b08/1961070e4c9b4e26a04e7f5a083f551e/jdk-8u202-linux-x64.tar.gz
elif [ $OpcionInicial -eq 4 ]; then
wget https://download.oracle.com/java/18/archive/jdk-18.0.2.1_linux-x64_bin.tar.gz
else
printf "No Existe ese Archivo \n"
fi

