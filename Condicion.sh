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
bannerExit(){
color
echo -e "${verde}
   		      
${rojo}   Gracias por Utilizar Mis Herramientas   
					         
${blanco}             luigui2120                         
					        
${blanco} Visita mis proyectos en la siguiente url:   
	                                        
${blanco}  https://github.com/luigui2120                			         

"${blanco}
sleep 5	
exit
}
Condicion(){
rm -f "$CarpetaContenedora"
color
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

while :
do
  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' x
  case "$x" in
    "Y" | "y")
        CondicionParaAvanzarInstall
        sleep 2
        clear
        source Yaibramir2.sh
        ;;

    "N" | "n")
	bannerExit
        ;;

    *)
        echo "Comando inválido \"$x\""
        sleep 3
        clear
        ;;
  esac
done
}

# Crea condición para el Yaibramir2.sh
CondicionParaAvanzarInstall() {
    VerificaActualInstall="$(pwd)"
    caracter1="/"
    caracter2="."
    texto1="Secuencias"
    texto2="Yaibramir2.txt"
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
    texto2="ProcesoCondicion.txt"
    CarpetaContenedora="$BuscaRuta$caracter1$caracter2$texto1$caracter1$caracter2$texto2"
    
    # Verificar si archivo1.sh se ha ejecutado
    if [ -e $CarpetaContenedora ]; then
        Condicion
    else
        # Mostrar mensaje de error y salir si archivo1.sh no se ha ejecutado
        echo "Este no es el Inicio"
        echo "No ejecutará hasta que"
        echo "Ejecutes el inicio Yaibramir.sh"
        exit 1
    fi
}
CondicionTrueoFalse
