echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa la carpeta:\e[0m""\e[1;31m]\e[0m" 
        read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' my_var14
        website=$my_var14


MostrarDatos(){
   while true; do
        # Mostrar opciones "y" y "n" para continuar o salir
        echo -e "\n${red}[${blanco}-${red}]${yellow} Informacion..."
        read -p $'\nPresione Y para volver al Menú\nPresione N para Finalizar: ' respuesta
        # Verificar la respuesta
        case "$respuesta" in
            [Yy]*)
                pkill -9 -f "127.0.0.1:8080"
                killall -2 xterm > /dev/null 2>&1
                killall -2 ngrok > /dev/null 2>&1
                killall -2 php > /dev/null 2>&1
                MenuOpciones
                ;;
            [Nn]*)
                pkill -9 -f "127.0.0.1:8080"
                killall -2 xterm > /dev/null 2>&1
                killall -2 ngrok > /dev/null 2>&1
                killall -2 php > /dev/null 2>&1
                exit 0
                ;;
            *)
                echo -e $'\nOpción no válida\nPresione Y para volver al Menú\nPresione N para Finalizar : '
                ;;
        esac

        sleep 0.75
    done
}

#ApacheTomcatLocal
ApacheTomcatLocal(){
current_dir=$(pwd)
cd PaginasWeb; zip -r ROOT.zip $website || exit
mv ROOT.zip $current_dir/.Server/apache-tomcat/webapps/
cd "$current_dir" || exit
#estas en menu
cd .Server/apache-tomcat/webapps || exit
unzip ROOT.zip
sleep 2
rm -f ROOT.zip
sleep 2
cd "$current_dir" || exit
#estas en menu
sleep 2
cd .Server;cd apache-tomcat;cd conf || exit
rm -f server.xml
cat <<Server> server.xml
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
 DeternerServicio

  if [[ -e serveo ]]; then
    rm serveo
  fi

  if [[ -e serveo2.txt ]]; then
    rm serveo2.txt
  fi
  sleep 2
  printf "${BGreen}OK.${clear}\n"
  sleep 2
  printf "${Yellow}Starting ${BGreen}Serveo.net ${Green}server\n"

  ssh -o StrictHostKeyChecking=no -R yoursubdomain.serveo.net:80:127.0.0.1:8000 serveo.net > serveo2.txt 2>&1 &
  sleep 2
  echo "Espere unos minutos"
  sleep 10  # Aumenta este tiempo si es necesario

  neturl=$(cat serveo2.txt | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*')

  if [ -n "$neturl" ]; then
    echo -e "\n${red}[${blanco}-${red}]${blue} URL 1 : ${verde}$neturl"
  else
    echo -e "\n${red}[${blanco}-${red}]${blue} No se pudo obtener la URL de Serveo.${clear}"
  fi

  MostrarDatos
}
ApacheTomcatLocal