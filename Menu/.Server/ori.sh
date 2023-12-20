#!/bin/bash

# Ruta del directorio de instalación de Tomcat

TOMCAT_DIR="/home/luigui/ProyectoWeb/Yaibramir/Menu/.Server/apache-tomcat-9.0.82/"


# Ruta de la aplicación WAR que deseas desplegar
WAR_FILE="/home/luigui/ProyectoWeb/Yaibramir/Menu/.Server/apache-tomcat-9.0.82/webapps/prueba"

# Nueva carpeta de inicio para la aplicación
NEW_APP_BASE="webapps/prueba"

# Cambiar al directorio de instalación de Tomcat
cd "$TOMCAT_DIR" || exit 1

# Detener Tomcat
sleep 2
"$TOMCAT_DIR/bin/shutdown.sh" || true



# Eliminar la carpeta existente de la aplicación por defecto (ROOT)
rm -rf "$TOMCAT_DIR/webapps/ROOT"

# Crear la nueva carpeta de inicio
mkdir -p "$TOMCAT_DIR/$NEW_APP_BASE"

# Copiar la aplicación WAR a la nueva carpeta de inicio
cp "$WAR_FILE" "$TOMCAT_DIR/$NEW_APP_BASE/ROOT.war"
sleep 2
# Iniciar Tomcat
"$TOMCAT_DIR/bin/startup.sh"


echo "Se ha cambiado la carpeta de inicio de Tomcat a $NEW_APP_BASE."
