#!/bin/bash
VerificaTipoMenu() {
    if [ -f /etc/os-release ] && (grep -q 'debian\|arch\|rhel' /etc/os-release); then
          cd Linux; source ProcesoLinux.sh
    elif [ -n "$ANDROID_ROOT" ] && [ -n "$TERMUX_VERSION" ]; then
          cd Termux; source ProcesoTermux.sh
    else
        echo "Error"
        exit 1  # Salir con un código de error
    fi
}


CondicionTrueoFalse(){
# Verificar si WebHosting.sh se ha ejecutado
BuscaRuta="$(cd..;cd ..;pwd)"
caracter1="/"
caracter2="."
texto1="Secuencias"
texto2="ProcesoMenuServer.txt"
CarpetaContenedora="$BuscaRuta$caracter1$caracter2$texto1$caracter1$caracter2$texto2"
if [ -e $CarpetaContenedora ]; then
   MenuOpcionesPHP
else
    # Mostrar mensaje de error y salir si archivo1.sh no se ha ejecutado
    echo "Este no es el Inicio"
    echo "No ejecutará hasta que"
    echo "Ejecutes el inicio Yaibramir.sh"
    exit 1
fi
}
VerificaTipoMenu
