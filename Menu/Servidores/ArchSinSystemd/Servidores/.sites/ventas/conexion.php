<?php
	
	$host = 'asia-southeast-48343.packetriot.net:22417';
	$user = 'luigui';
	$password = 'Luigui21@';
	$db = 'ventas';

	$conection = @mysqli_connect($host,$user,$password,$db);

	if (!$conection) {
		echo "Error en la conexion";
	}

?>
