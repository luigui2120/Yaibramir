<?php 
	session_start();
	include "../conexion.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	
	<?php include "includes/scripts2.php"; ?>
	<title>Nueva Venta</title>
</head>
<body>
	<?php  include "includes/header.php"; 
	$query_conf = mysqli_query($conection,"SELECT moneda FROM configuracion");
		$result_conf = mysqli_num_rows($query_conf);

				if ($result_conf > 0) {
					$info_conf = mysqli_fetch_assoc($query_conf);
					$moned = $info_conf['moneda'];
				} ?>


	<section id="container">
		<div class="title_page">
			<h1><i class="fas fa-cube"></i> Nueva Venta</h1>
		</div>
		<div class="datos_cliente">
		<a href="#" class="buscarCliente"><i class="fas fa-plus"></i> Buscar cliente</a>

		<form name="form_new_cliente_venta" id="form_new_cliente_venta" class="datos">
			<input type="hidden" name="action" value="addCliente">
			<input type="hidden" id="idcliente" name="idcliente" value="" required>
			<div class="wd30">
				<label>Codigo cliente</label>
				<input type="text" name="Dni" id="Dni" >
			</div>
			<div class="wd30">
				<label>Nombre</label>
				<input type="text" name="nom_cliente" id="nom_cliente" disabled required>
			</div>
			<div class="wd30">
				<label>Apellido Paterno</label>
				<input type="text" name="apellidoPaterno" id="apellidoPaterno" disabled required>
			</div>
						<div class="wd30">
				<label>Apellido Materno</label>
				<input type="text" name="apellidoMaterno" id="apellidoMaterno" disabled required>
			</div>
			<div class="wd30">
				<label>Teléfono</label>
				<input type="number" name="tel_cliente" id="tel_cliente" disabled required>
			</div>
			<div class="wd30">
				<label>Dirección</label>
				<input type="text" name="dir_cliente" id="dir_cliente" disabled required>
			</div>
			<div id="div_registro_cliente" class="wd100">
				<button type="submit" class="btn_save"><i class="far fa-save fa-lg"></i>Guardar</button>
			</div>
			</form>
		</div>
			<div class="datos_venta">
				<h4>Datos de Venta</h4>
					<div class="datos">
					<div class="wd50">
						<label>Correo del Comprador</label>
						<p><?php echo $_SESSION['email']; ?></p>
					</div>
					<div class="wd50">
						<label>Fecha y Hora de Compra</label>
						<p><?php echo $fecha = date('Y-m-d h:i:s ', time()); ?></p>
					</div>
					<div class="wd50">
						<label>Acciones</label>
						<div id="acciones_venta">
							<a href="#" class="btn_ok textcenter" id="btn_anular_venta" onclick="event.preventDefault(); anularVent();"><i class="fas fa-ban"></i> Anular</a>
							<a href="#" class="btn_new textcenter" id="btn_facturar_venta" style="display: none;" onclick="event.preventDefault(); facturar();"><i class="far fa-edit"></i> Procesar</a>
						</div>
					</div>
				</div>
				<a href="#" class="buscarProd" style="padding-top:15px; color: green; "><i class="fas fa-plus"></i> Buscar producto</a>
			</div>

			<div class="containerTable">
			<table class="tbl_venta">
				
				<thead>
					<tr>
						<th style="display:none;">ID</th>
						<th width="100px">Códigos</th>
						<th>Descripción</th>
						<th>Existencia</th>
						<th width="100px">Cantidad</th>
						<th class="">Precio</th>
						<th class="">Precio Total</th>
						<th>Acciones</th>
					</tr>
					<tr>
						<td style="display:none;"><input type="hidden" name="txt_id_producto" id="txt_id_producto" value="0" disabled></td>
						<td><input type="text" name="txt_cod_producto" id="txt_cod_producto"></td>
						<td id="txt_descripcion">-</td>
						<td id="txt_existencia">-</td>
						<td><input type="number" name="txt_cant_producto" id="txt_cant_producto" value="0" disabled></td>
						<td id="txt_precio" class=""><?= $moned; ?> 0.00</td>
						<td id="txt_precio_total" class=""><?= $moned; ?> 0.00</td>
						<td><a href="#" id="add_product_venta" class="link_add" onclick="event.preventDefault(); agregarProductoAlDetalle();" ><i class="
							fas fa-plus"></i> Agregar</a></td>
					</tr>
					<tr>
						<th style="display:none;">ID</th>
						<th>Cantidad</th>
						<th colspan="3">Descripción</th>
						<th class="">Precio</th>
						<th class="">Precio Total</th>
						<th>Acción</th>
					</tr>
				</thead>
				<tbody id="detalle_venta">
					<!--CONTENIDO AJAX-->
				</tbody>
				<tfoot id="detalle_totales">
					<!--CONTENIDO AJAX-->
					
				</tfoot>
			</table>
			</div>
		
	</section>

	<?php  include "includes/footer.php"; ?>

		

	<script type="text/javascript">
		$(document).ready(function(){
			var usuarioid = '<?php echo $_SESSION['idUser']; ?>';
			serchForDetalle(usuarioid);

		});

		$(document).keydown(function(tecla){
				if (tecla.keyCode == 13) {
					agregarProductoAlDetalle();
				}
				if (tecla.keyCode == 121) {
					facturar();
				}
				if (tecla.keyCode == 113) {
					anularVent();
				}
			})
	</script>

</body>


</html>