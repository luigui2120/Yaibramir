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
	<title>Perfil</title>
</head>
<body>
	<?php 

		include "includes/header.php";
		include "../conexion.php";

		//Datos empresa
		$ruc = '';
		$nombreEmpresa = '';
		$razonSocial = '';
		$telEmpresa = '';
		$emailEmpresa = '';
		$dirEmpresa = '';
		$iva = '';
		$usuario_id = $_SESSION['idUser'];

		$query_empresa = mysqli_query($conection,"SELECT * FROM configuracion");
		$row_empesa = mysqli_num_rows($query_empresa);
		if ($row_empesa > 0) 
		{
			while ($arrInfoEmpresa = mysqli_fetch_assoc($query_empresa)) {
				$ruc = $arrInfoEmpresa['ruc'];
				$nombreEmpresa = $arrInfoEmpresa['nombre'];
				$razonSocial = $arrInfoEmpresa['razon_social'];
				$telEmpresa = $arrInfoEmpresa['telefono'];
				$emailEmpresa = $arrInfoEmpresa['email'];
				$dirEmpresa = $arrInfoEmpresa['direccion'];
				$iva = $arrInfoEmpresa['iva'];
				$moned = $arrInfoEmpresa['moneda'];
			}
			$foto = '';
			$classRemove = 'notBlock';

			if ($foto1 != '') {
				$classRemove = '';
				$foto = '<img id="img" src="factura/img/'.$foto1.'" alt="Producto">';
			}
		}

		$query_dash = mysqli_query($conection,"CALL dataDashboard($usuario_id);");
		$result_das = mysqli_num_rows($query_dash);
		if ($result_das > 0) {
			$data_dash = mysqli_fetch_assoc($query_dash);
			mysqli_close($conection);
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

				<?php if ($_SESSION['rol'] == 1) {
				 ?>
				<div class="containerDataEmpresa">
					<div class="logoUser">
						<img src="img/rojo.jpg">
					</div>
					<h4>Datos de la empresa</h4>

						<form action="" method="post" name="frmEmpresa" id="frmEmpresa">
							<input type="hidden" name="action" value="updateDataEmpresa">

								<div>
									<label>ruc:</label><input type="text" name="txtruc" id="txtruc" placeholder="ruc de la empresa" value="<?= $ruc; ?>" required>								
								</div>
								<div>
									<label>Nombre:</label><input type="text" name="txtNombre" id="txtNombre" placeholder="Nombre de la empresa" value="<?= $nombreEmpresa; ?>" required>								
								</div>
								<div>
									<label>Razon social:</label><input type="text" name="txtRSocial" id="txtRSocial" placeholder="Razon social" value="<?= $razonSocial; ?>">								
								</div>
								<div>
									<label>Teléfono:</label><input type="text" name="txtTelEmpresa" id="txtTelEmpresa" placeholder="Númer de teléfono" value="<?= $telEmpresa; ?>" required>								
								</div>
								<div>
									<label>Correo electrónico:</label><input type="email" name="txtEmailEmpresa" id="txtEmailEmpresa" placeholder="Correo electrónico" value="<?= $emailEmpresa; ?>" required>					
								</div>
								<div>
									<label>Dirección:</label><input type="text" name="txtDirEmpresa" id="txtDirEmpresa" placeholder="Dirección de la empresa" value="<?= $dirEmpresa; ?>" required>								
								</div>
								<div>
									<label>Moneda:</label><input type="text" name="txtMoneda" id="txtMoneda" placeholder="Simbolo de moneda" value="<?= $moned; ?>" required>								
								</div>
								<!--<div>
									<label>IVA (%):</label><input type="text" name="txtIva" id="txtIva" placeholder="Impuesto al valor agregado (IVA)" value="<?= $iva; ?>" required>								
								</div>-->
								<div class="alertFormEmpresa" style="display: none; text-align: center;"></div>
								<div>
									<button type="submit" class="btn_save btnChangePass"><i class="far fa-save fa-lg"></i> Guardar datos</button>
								</div>
						</form>
				</div>
			<?php } ?>
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
