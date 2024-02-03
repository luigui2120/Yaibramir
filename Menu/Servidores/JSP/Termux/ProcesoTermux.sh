#!/bin/bash
BannerTermux(){
figlet Yaibramir| lolcat -a -d 20
}
MenuOpcionesPHPTermux(){
rm -f "$CarpetaContenedora"
while true; do
BannerTermux
echo -e -n "${yellow}
$grn [1] $yellow JSP con LocalXpose   
$grn [2] $yellow JSP con Cloudflare                                    
$grn [3] $yellow Retornal Inicio                                                                                           
"${blanco}                                                                                         

  echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa opcion:\e[0m""\e[1;31m]\e[0m"
  read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' x
  case $x in
      1)
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var1
        website=$my_var1
        ApacheTomcatLocklx
        ;;
      2)
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
	read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var2
	website=$my_var2
	ApacheTomcatLocalCloudflare
        ;;
      3)

        ;;
      *)
        echo Comando invalido \"$x\"
        sleep 3
        reset
        ;;
    esac
  done
}

HOST='127.0.0.1'
HOST2='localhost'

#Puerto
PORT=8000

Inicio_JSP(){
cd ..;cd ..;cd ..; cd PaginasWeb; zip -r ROOT.zip $website
VerificaActual1="$(cd ..;pwd)"
mv ROOT.zip $VerificaActual1/.Server/apache-tomcat/webapps/
sleep 2
VerificaActual2="$(cd ..;pwd)"
unzip "$VerificaActual2/.Server/apache-tomcat/webapps/ROOT.zip" -d "$VerificaActual2/.Server/apache-tomcat/webapps/"
sleep 2
rm -f $VerificaActual2/.Server/apache-tomcat/webapps/ROOT.zip
sleep 2
VerificaActual3="$(cd ..;cd .Server; cd apache-tomcat; cd conf;rm -f server.xml; cat <<Server> server.xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!-- Note:  A "Server" is not itself a "Container", so you may not
     define subcomponents such as "Valves" at this level.
     Documentation at /docs/config/server.html
 -->
<Server port="8005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <!-- Security listener. Documentation at /docs/config/listeners.html
  <Listener className="org.apache.catalina.security.SecurityListener" />
  -->
  <!-- APR library loader. Documentation at /docs/apr.html -->
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <!-- Prevent memory leaks due to use of particular java/javax APIs-->
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />

  <!-- Global JNDI resources
       Documentation at /docs/jndi-resources-howto.html
  -->
  <GlobalNamingResources>
    <!-- Editable user database that can also be used by
         UserDatabaseRealm to authenticate users
    -->
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
  </GlobalNamingResources>

  <!-- A "Service" is a collection of one or more "Connectors" that share
       a single "Container" Note:  A "Service" is not itself a "Container",
       so you may not define subcomponents such as "Valves" at this level.
       Documentation at /docs/config/service.html
   -->
  <Service name="Catalina">

    <!--The connectors can use a shared executor, you can define one or more named thread pools-->
    <!--
    <Executor name="tomcatThreadPool" namePrefix="catalina-exec-"
        maxThreads="150" minSpareThreads="4"/>
    -->


    <!-- A "Connector" represents an endpoint by which requests are received
         and responses are returned. Documentation at :
         Java HTTP Connector: /docs/config/http.html
         Java AJP  Connector: /docs/config/ajp.html
         APR (HTTP/AJP) Connector: /docs/apr.html
         Define a non-SSL/TLS HTTP/1.1 Connector on port 8080
    -->
    <Connector port="8000" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    <!-- A "Connector" using the shared thread pool-->
    <!--
    <Connector executor="tomcatThreadPool"
               port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443
         This connector uses the NIO implementation. The default
         SSLImplementation will depend on the presence of the APR/native
         library and the useOpenSSL attribute of the AprLifecycleListener.
         Either JSSE or OpenSSL style configuration may be used regardless of
         the SSLImplementation selected. JSSE style configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="conf/localhost-rsa.jks"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->
    <!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443 with HTTP/2
         This connector uses the APR/native implementation which always uses
         OpenSSL for TLS.
         Either JSSE or OpenSSL style configuration may be used. OpenSSL style
         configuration is used below.
    -->
    <!--
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11AprProtocol"
               maxThreads="150" SSLEnabled="true"
               maxParameterCount="1000"
               >
        <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" />
        <SSLHostConfig>
            <Certificate certificateKeyFile="conf/localhost-rsa-key.pem"
                         certificateFile="conf/localhost-rsa-cert.pem"
                         certificateChainFile="conf/localhost-rsa-chain.pem"
                         type="RSA" />
        </SSLHostConfig>
    </Connector>
    -->

    <!-- Define an AJP 1.3 Connector on port 8009 -->
    <!--
    <Connector protocol="AJP/1.3"
               address="::1"
               port="8009"
               redirectPort="8443"
               maxParameterCount="1000"
               />
    -->

    <!-- An Engine represents the entry point (within Catalina) that processes
         every request.  The Engine implementation for Tomcat stand alone
         analyzes the HTTP headers included with the request, and passes them
         on to the appropriate Host (virtual host).
         Documentation at /docs/config/engine.html -->

    <!-- You should set jvmRoute to support load-balancing via AJP ie :
    <Engine name="Catalina" defaultHost="localhost" jvmRoute="jvm1">
    -->
    <Engine name="Catalina" defaultHost="localhost">

      <!--For clustering, please take a look at documentation at:
          /docs/cluster-howto.html  (simple how to)
          /docs/config/cluster.html (reference documentation) -->
      <!--
      <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster"/>
      -->

      <!-- Use the LockOutRealm to prevent attempts to guess user passwords
           via a brute-force attack -->
      <Realm className="org.apache.catalina.realm.LockOutRealm">
        <!-- This Realm uses the UserDatabase configured in the global JNDI
             resources under the key "UserDatabase".  Any edits
             that are performed against this UserDatabase are immediately
             available for use by the Realm.  -->
        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
      </Realm>
      
<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true">
    <!-- ... otras configuraciones ... -->
    <Context path="" docBase="$website" reloadable="true"/>
    <!-- ... otras configuraciones ... -->
</Host>

    </Engine>
  </Service>
</Server>
Server
)"
}


#Servicio de cloudflared
cusport() {
echo -ne "\n\n${RED}[${WHITE}-${RED}]${BLUE} Using Default Port $PORT...${WHITE}\n"

}

#ApacheTomcatLocklx
ApacheTomcatLocklx() {
	ini_Locklx=$(pwd)
	cd ..;cd ..;cd ..;cd .Server
  	if [[ -e .loclx ]]; then
	  rm .loclx
 	fi
	cd "$ini_Locklx" || exit 
  	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; Inicio_JSP; printf "\e[0m\n";}
	cd ..;cd .Server; cd apache-tomcat;cd bin;bash shutdown.sh;bash startup.sh > /dev/null 2>&1
  	cd "$ini_Locklx" || exit 
  	sleep 2
  	printf "${BGreen}OK.${clear}\n"
  	sleep 2
  	ini_net1=$(cd ..;cd ..;cd ..;cd .Server; pwd)
    	echo -e "\n${red}[${blanco}-${red}]${blue} Selecciona una región: eu,us"${blanco}
    	read -p "Opción: " $my_var1
   	Locklx_region=$my_var1
   	echo -e "\n${red}[${blanco}-${red}]${blue} Login:"${blanco}
        cd ../../../.Server
   	./loclx account login
   	sleep 2
   	termux-chroot && ./loclx tunnel --raw-mode http --region "$Locklx_region" --https-redirect -t "$HOST":"$PORT" > $ini_net1/.loclx 2>&1 &
	sleep 12
	echo "Espere unos minutos"
 	sleep 10  # Aumenta este tiempo si es necesario
	loclx_url=$(cat .loclx | grep -o '[0-9a-zA-Z.]*.loclx.io' )
	if [ -n "$loclx_url" ]; then
  	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$loclx_url"
	else
   	echo -e "\n${red}[${blanco}-${red}]${blue} No se pudo obtener la URL de Serveo.${clear}"
	fi
	MostrarDatos
}

#ApacheTomcatLocalCloudflare
ApacheTomcatLocalCloudflare(){
	ini_cloud=$(pwd)
	cd ..;cd ..;cd ..;cd .Server
	if [[ -e .cld.log ]]; then
  	  rm .cld.log 
  	fi
  	cd "$ini_cloud" || exit 
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; Inicio_JSP; printf "\e[0m\n";}
	cusport
	cd ..;cd .Server; cd apache-tomcat;cd bin;bash shutdown.sh;bash startup.sh > /dev/null 2>&1
	cd "$ini_cloud" || exit
	sleep 2
	echo -e  '\e[1;31m[\e[0m\e[1;77m-\e[0m\e[1;31m]\e[0m\e[1;92m ¿Deseas ejecutar localmente? \e[0m\e[1;91m[\e[0m\e[1;92mY\e[0m\e[1;91m/\e[0m\e[1;92mn\e[0m\e[1;91m] : \e[0m\e[1;93m'
	read opinion
	printf "\e[0m\n"  # Salto de línea con formato de reinicio
	if [ "$opinion" == "y" ]; then
	ini_net1=$(cd ..;cd ..;cd ..;cd .Server; pwd)
    	cloudflared tunnel -url "$HOST":"$PORT" --logfile $ini_net1/.cld.log > /dev/null 2>&1 &
	elif [ "$opinion" == "n" ]; then
	ini_net1=$(cd ..;cd ..;cd ..;cd .Server; pwd)
   	cd ../../../ && cd .Server; sleep 2 && termux-chroot ./cloudflared tunnel -url http://$HOST:$PORT --logfile .cld.log > /dev/null 2>&1 &
	else
    	echo "[ - ] Respuesta no válida. Por favor, responde 'y' o 'n'."
   	killall -2 xterm > /dev/null 2>&1
    	ApacheTomcatLocalCloudflare
	fi
	sleep 8
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log")
	cldflr_url2=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log" | sed 's/https:\/\///')
	cd "$ini_cloud" || exit 
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$cldflr_url"
	echo -e "\n${red}[${blanco}-${red}]${blue} URL 2 : ${verde}$mask@$cldflr_url2"
        MostrarDatos
}
        
	
MostrarDatos(){
  	 while true; do
        # Mostrar opciones "y" y "n" para continuar o salir
        echo -e "\n${red}[${blanco}-${red}]${yellow} Informacion..."
        read -p $'\nPresione Y para volver al Menú\nPresione N para Finalizar: ' respuesta
        # Verificar la respuesta
        case "$respuesta" in
            [Yy]*)
                VerificaActual4="$(cd ..;cd ..;cd ..;cd .Server; cd apache-tomcat;cd bin;bash shutdown.sh)"
                pkill -9 -f "127.0.0.1:8080"
                killall -2 php > /dev/null 2>&1
                # Obtener el PID del proceso
	# Verificar si se encontró un PID
	if [ -n "$pid" ]; then
  	# Detener el proceso utilizando el PID
  	kill $pid
 	 echo "Proceso detenido."
	else
 	 echo "No se encontró el proceso."
	fi
                MenuOpciones
                ;;
            [Nn]*)
                VerificaActual4="$(cd ..;cd ..;cd ..;cd .Server; cd apache-tomcat;cd bin;bash shutdown.sh)"
                pkill -9 -f "127.0.0.1:8080"
                killall -2 php > /dev/null 2>&1
	# Verificar si se encontró un PID
	if [ -n "$pid" ]; then
 	 # Detener el proceso utilizando el PID
 	 kill $pid
 	 echo "Proceso detenido."
	else
  	echo "No se encontró el proceso."
	fi
                exit 0
                ;;
            *)
                echo -e $'\nOpción no válida\nPresione Y para volver al Menú\nPresione N para Finalizar : '
                ;;
        esac

        sleep 0.75
    done
}
MenuOpcionesPHPTermux

