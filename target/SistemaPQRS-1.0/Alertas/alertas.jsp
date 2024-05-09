
<%

    if (alerta != null) {

        switch (alerta) {
            case "UsuarioNoRegistrado":

%>


<div class="alert alert-warning  alerta" id="alerta" role="alert">

    Usuario y / o contraseña incorrectos
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>


<%        break;

    case "UsuarioYaRegistrado":
%>

<div class="alert alert-warning  alerta" id="alerta" role="alert">

    El usuario ya esta registrado
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>


<%
                break;
            default:

        }
        alerta = null;
    }

%>