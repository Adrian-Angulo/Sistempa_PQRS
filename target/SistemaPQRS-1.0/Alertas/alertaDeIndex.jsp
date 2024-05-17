
<%
   
    if (alerta != null) {

        switch (alerta) {
            case "UsuarioNoAutenticado":
%>
<!-- aletra de emergencia -->
<div class="alert alert-warning" role="alert" style="position: absolute; top: 150px">
    Correo y / o contraseña incorrectos
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'
</div>



<%
        break;
    case "UsuarioRegistrado":
%>
<!-- aletra de emergencia -->
<div class="alert alert-warning" role="alert" style="position: absolute; top: 150px">
    El usuario ya se encuantra registrado
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'
</div>
<%
        break;
    case "RegistroExitoso":
%>
<!-- alerta verde -->
<div class="alert alert-success" role="alert" style="position: absolute; top: 150px">
    El usuario a sido registrado correctamente
</div>

<%
                break;

            default:
                throw new AssertionError();
        }
    }
%>


