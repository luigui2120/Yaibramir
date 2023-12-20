        echo "Recurda que la carpeta actual es Yaibramir/"
        echo -e "\e[1;31m┌─[\e[0m""\e[1;37mNombre de la Carpeta:\e[0m""\e[1;31m]\e[0m"
        read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var3
        ruta_actual="$(pwd)"
        ruta_carpeta="$ruta_actual/$my_var3/"
 	cd "$ruta_carpeta"
        archivos=$(ls)
for archivo in $archivos; do
    # Si es una carpeta, aplícale color azul
    if [ -d "$archivo" ]; then
        color="\e[1;34m"  # Azul para carpetas
    else
        # Obtén la extensión del archivo (si es un archivo)
        extension="${archivo##*.}"
        case "$extension" in
            html)
                color="\e[1;31m"  # Rojo para archivos HTML
                ;;
            js)
                color="\e[1;35m"  # Rojo para archivos JavaScript
                ;;
            sh)
                color="\e[1;33m"  # Naranja para archivos shell
                ;;
            py)
                color="\e[1;37m"  # Naranja para archivos Python
                ;;
            *)
                color="\e[0m"     # Restablece el color para otros tipos de archivos
                ;;
        esac
    fi

    printf "${color}${archivo}\e[0m "
done

echo
