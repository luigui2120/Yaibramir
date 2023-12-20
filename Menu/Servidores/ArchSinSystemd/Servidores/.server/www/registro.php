<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Registro | Minimarket Fresco-Express </title>
	<link rel="stylesheet" type="text/css" href="css/style.css?1.0" media="all">
	<link rel="stylesheet" href="css/estiloBoton.css">
	<link rel="stylesheet" href="css/estiloBoton1.css">
</head>
<body>

	<section id="container">
		
		<form  method="POST" name="form-work" action="Registro/guardar.php">
			<h3>Bienvenido al Registro</h3>
			<img src="img/1.png" alt="Login">
            <input name="Dni" class="form-control" placeholder="Dni" type="text">
			<input name="correo" class="form-control" placeholder="ejemplo@gmail.com" type="text">
			<input name="usuario" class="form-control" placeholder="Usuario" type="text">
			<input name="clave" class="form-control" placeholder="Contraseña" type="password">
			<div class="container">
			 <button type="submit" class="boton_personalizado">Registrarse</button>
			<div/>
			<div align="center" class="container1">
			<a class="boton_personalizado1" href="index.php">Atras</a>
			<div/>
		</form>
	</section>
</body>
</html>
