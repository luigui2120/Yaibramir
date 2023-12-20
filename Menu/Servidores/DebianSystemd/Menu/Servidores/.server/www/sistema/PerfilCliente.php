<?php
session_start(); 

include "../conexion.php";

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<?php include "includes/scripts.php"; ?>
	<link rel="stylesheet" type="text/css" href="css/styless.css" />
		<title>Perfil-Food</title>
</head>
<body>
	<?php 

		include "includes/header.php";
		include "../conexion.php";

		//Datos empresa
		$correo = '';
		$usuario = '';
		$Dni = '';
		$nombre = '';
		$apellidoPaterno= '';
		$apellidoMaterno = '';
		$telefono= '';
		$direccion= '';
		$idcliente= $_SESSION['idUser'];


		$query_empresa = mysqli_query($conection,"SELECT * FROM cliente where idcliente='$idcliente'");
		$row_empesa = mysqli_num_rows($query_empresa);
		if ($row_empesa > 0) 
		{
			while ($arrInfoEmpresa = mysqli_fetch_assoc($query_empresa)) {
				$correo = $arrInfoEmpresa['correo'];
				$usuario = $arrInfoEmpresa['usuario'];
				$Dni = $arrInfoEmpresa['Dni'];
				$nombre = $arrInfoEmpresa['nombre'];
				$apellidoPaterno = $arrInfoEmpresa['apellidoPaterno'];
				$apellidoMaterno = $arrInfoEmpresa['apellidoMaterno'];
				$telefono = $arrInfoEmpresa['telefono'];
				$direccion = $arrInfoEmpresa['direccion'];
			}
		}

	?>
	
			<!--	
				<a href="ventas.php">
					<i class="far fa-file-alt"></i>
					<p>
						<strong>Ventas</strong><br>
					-->
						<?php 
						/*
						$ventas = '';
						
							$moneda = $moned;
							if ($data_dash['ventas'] == '') {
								$ventas = '<span>'.$moneda.' 0.00</span>';
							}else{
								$ventotal = number_format($data_dash['ventas'],2);
								$ventas= '<span>'.$moneda.' '.$ventotal.'</span>';
							}
							
							echo $ventas;
						*/
						 ?>
					

		<div class="divInfoSistema">
			<div>
				<h1 class="titlePanelControl">Configuración</h1>
			</div>
			<div class="containerPerfil">
				<div class="containerDataUser">
					<div class="logoUser">
						<img src="img/logoUser.png">
					</div>
					<div class="divDataUser">

						<h4>Cambiar contraseña</h4>
						<form action="" method="post" name="frmChangePass" id="frmChangePass">
								<div>
									<input type="password" name="txtPassUser" id="txtPassUser" placeholder="Contraseña actual" required>								
								</div>
								<div>
									<input class="newPass" type="password" name="txtNewPassUser" id="txtNewPassUser" placeholder="Nueva contraseña" required>								
								</div>
								<div>
									<input class="newPass" type="password" name="txtPassConfirm" id="txtPassConfirm" placeholder="Confirmar contraseña" required>								
								</div>
								<div class="alertChangePass" style="display: none;" >
								</div>
								<div>
									<button type="submit" class="btn_save btnChangePass"><i class="fas fa-key"></i> Cambiar contraseña</button>
								</div>
						</form>
					</div>
				</div>
				<div class="containerDataEmpresa">
	                                        <form action="" method="post" name="form_add_product" id="form_add_product" onsubmit="event.preventDefault(); actualizarCliente();">
                                            <input type="hidden" name="action" value="actualizarCliente">
                                            <h1><i class="fas fa-user" style="font-size: 45pt;"></i> <br> Actualizar Datos</h1>
                                            <input type="hidden" name="idCliente" value="'info.idcliente'">
                                            <input type="text" name="DniCliente" id="DniCliente" value="<?= $Dni; ?>" placeholder="Dni" required><br>
                                            <input type="text" name="nombreCliente" id="nombreCliente" value="<?= $nombre; ?>" placeholder="Nombre" onkeypress="return soloLetras(event)" onpaste="return false" required><br>
                                            <input type="text" name="apellidoCliente" id="apellidoCliente" value="<?= $apellidoPaterno; ?>" placeholder="Apellidos Paterno" onkeypress="return soloLetras(event)" onpaste="return false" required><br>
                                            <input type="text" name="apellidoClient" id="apellidoClient" value="<?= $apellidoMaterno; ?>" placeholder="Apellidos Materno" onkeypress="return soloLetras(event)" onpaste="return false" required><br>
                                            <input type="number" name="telefonoCliente" id="telefonoCliente" value="<?= $telefono; ?>" placeholder="Teléfono" required><br>
                                            <input type="text" name="direccionCliente" id="direccionCliente" value="<?= $direccion; ?>" placeholder="Dirección" required><br>
                                            <div class="alert alertAddProduct"></div>
                                            <button type="submit" class="btn_new"><i class="far fa-save fa-lg"></i> Guardar datos</button>           			
						</form>
				</div>
			</div>
		</div>
	</section>


		<?php include "includes/footer.php"?>
		

</body>
<script type="text/javascript">(function () {
    var ldk = document.createElement('script');
    ldk.type = 'text/javascript';
    ldk.async = true;
    ldk.src = 'https://s.cliengo.com/weboptimizer/5f25a31f38bf5f002ab5f2bf/5f25a36d5007b7002ade9cdb.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(ldk, s);
})();</script>


</html>
