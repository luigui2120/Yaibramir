$(document).ready(inicialize);

function inicialize() {

    $('#myModal').on('hide.bs.modal', function (e) {
        Dropzone.forElement("#myDropzone").removeAllFiles(true);
    })

    $("#slider").empty().load(getPath() + "Avisos/MuestraBanner");

    $(document).ready(function () {
        $('.solo_numero').keyup(function () {
            this.value = (this.value + '').replace(/[^0-9]/g, '');
        });
    });



    var header_h = $('header').height() + 50;
    $('main').css('margin-top', header_h + 'px');

    $("#logoff").click(function (event) {
        Logoff(event);
    });
    $("#mensajes").click(function (event) {
        mensajes(event);
    });






}

function getPath() {
    var pathInfo = window.location.pathname;

    var uri = pathInfo.split("/");

    //var URL = '/' + uri[1] + '/'; //Desarrollo
    var URL = '/'; //Producción

    //alert("1 " + uri[0] + " 2 " + uri[1])

    return URL;
}

function Logoff(event) {
    event.preventDefault();
    $("#VentanaModal").modal();
    $("#panelmensajes").empty().load(getPath() + "Account/LogOff");
}


function AceptaCerrar(link, requiereCierre) {
    if (requiereCierre =="siRequiereCierre") {
        var x = window.open(link, target = '_blank', width = '400px', height = '400px');
    }
  

    $.ajax({
        type: 'POST',
        url: getPath() + 'Account/LogOff',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (data) {
            if (data == 'UNUTP') {
                window.location.replace(getPath() + "Home/loginUTP/")
            }
            else if (data == 'UNIDT') {
                window.location.replace(getPath() + "Home/LoginIDAT/")
            }
            else {
                window.location.replace(getPath() + "Home/loginUTP/")
            }
        },
        error: function (data) {
            if (data == 'UNUTP') {
                window.location.replace(getPath() + "Home/loginUTP/")
            }
            else if (data == 'UNIDT') {
                window.location.replace(getPath() + "Home/LoginIDAT/")
            }
            else {
                window.location.replace(getPath() + "Home/loginUTP/")
            }
        }
    });
}


function mensajes(event) {
    var grado = "";
    var cod_alumno = "";
    event.preventDefault();
    $.ajax({
        type: 'POST',
        url: getPath() + 'Avisos/muestraAvisos',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ grado: grado, cod_alumno: cod_alumno }),
        dataType: 'json',
        success: function (data) {
            if (data <= 1) {
                $("#VentanaModal").modal();
                $("#panelmensajes").empty().load(getPath() + "Avisos/misAvisos");
            }
        },
        error: function (data) {

        }
    });
}

function detalleMensaje(codigo) {


    $("#panelmensajes").empty().load(getPath() + "Avisos/misAvisosDetalle?cod_aviso=" + codigo);


}
function generaCaptcha() {
    $.ajax({
        type: 'POST',
        url: getPath() + 'Account/CaptchaImage',
        contentType: 'application/json; charset=utf-8',
        dataType: 'html',
        success: function (data) {
            $("#dCaptcha").attr('src', 'data:image/Jpeg;base64,' + data);
        },
        error: function (data) {
            $("#Error").html("<label id='lblError'  class='text-danger'>Ocurrio al validar el captcha</label>");
        }
    });
}

function validaLogin(event) {
    if (($("#tcActDir").val() == "") || ($("#tcActPas").val() == "") || $("#tcCaptcha").val() == "") {
        $("#Error").html("<label id='lblError' class='text-danger'>Complete todos los campos obligatorios</label>");
        event.preventDefault();
    } else {
        if (validaCaptcha($("#cCaptcha").val()) == false) {
            $("#Error").empty().html("<label id='lblError'  class='text-danger'>El texto no corresponde al de la imagen.</label>");
            event.preventDefault();
            generaCaptcha();
            $("#cCaptcha").val("");
        }
    }

}

function validaCaptcha(cCaptcha) {
    var valida = false;
    $.ajax({
        type: 'POST',
        url: getPath() + 'Account/validaCaptcha',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ tcCaptcha: cCaptcha }),
        dataType: 'json',
        async: false,
        success: function (data) {
            valida = data;
        },
        error: function (data) {
            $("#Error").html("<label id='lblError'  class='text-danger'>Ocurrio al validar el captcha</label>");
        }
    });

    return valida;
}





function regresar_simulacion() {
    var redireccionar = getPath() + "SimulacionAcceso/RegresarSimulacion";
    window.location = redireccionar;
}


function modificarPerfil(event) {
    $("#myModal").modal();
}













