$grn [7] $yellow Modificar Html o texto       
    echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa el nombre con txt o html:\e[0m""\e[1;31m]\e[0m" 
     read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var7
          nano $my_var7
	clear                             
$grn [8] $yellow Crear texto o Html   
      echo -n "Desea crear una carpeta(y/n)? "
      read answer16
      clear
      if [ "$answer16" != "${answer16#[Yy]}" ];then 
      echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa el nombre con txt o html:\e[0m""\e[1;31m]\e[0m" 
      read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var32
      mkdir -p Html/$my_var32
      cd Menu/$my_var32
	nano
      clear
      else
      cd Menu
	nano
       fi
       
              echo -e "\e[1;31m┌─[\e[0m""\e[1;37mIngresa el nombre :\e[0m""\e[1;31m]\e[0m" 
       read -p $'\e[1;31m└──╼\e[0m\e[1;37m ' my_var4
       grep 'href=' $my_var4
       sleep 10
       clear
