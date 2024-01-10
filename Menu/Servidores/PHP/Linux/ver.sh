        ini_site=$(pwd)
        cd ../../..
        echo -e "\n${red}[${blanco}-${red}]${blue} Preparando Servidor..."${blanco}
	# Verificar si el directorio .Server/www existe; si no, crearlo.
	if [ ! -d .Server/www ]; then
		mkdir -p .Server/www
	fi
	sleep 2
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up Server..."${WHITE}
	cp -rf PaginasWeb/ventas/* .Server/www
	cd "$ini_site" || exit
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP Server..."${WHITE}
	cd ../../..
	cd .Server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 &
	cd "$ini_site" || exit  &
