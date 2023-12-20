<?php
	
	$host = '192.168.18.213';
	$user = 'luigui';
	$password = 'Luigui21@';
	$db = 'ventas';

	$conection = @mysqli_connect($host,$user,$password,$db);

	if (!$conection) {
		echo "Error en la conexion";
	}

?>

