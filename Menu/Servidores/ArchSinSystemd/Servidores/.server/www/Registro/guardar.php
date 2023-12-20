<?php
 require '../conexion.php';
  
 $Dni  = $_POST['Dni'];
 $correo = $_POST['correo'];
 $usuario = $_POST['usuario'];
 $clave = $_POST['clave'];
 $hash = md5($clave);

   $query_insert = mysqli_query($conection,"INSERT INTO cliente(Dni,correo,usuario,clave,rol,status)
                                                          VALUES('$Dni','$correo','$usuario','$hash','2','1')");
if($query_insert){
   echo "<script> alert('Registro exitoso');
    location.href = '../index.php';
   </script>";

}else{
    echo "<script> alert('Upp No se pudo Registrar');
    location.href = '../index.php';
    </script>";
}






?>
