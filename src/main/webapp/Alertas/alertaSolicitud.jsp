
<%
   
    if (alerta != null) {

        switch (alerta) {
            case "SolicitudNoEnviada":
%>
<!-- aletra de emergencia -->
<div class="alert alert-warning" role="alert" style="position: absolute; top: 150px">
    No se pudo enviar la solicitud
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'
</div>



<%
        break;
    case "UsuarioRegistrado":
%>
<!-- aletra de emergencia -->
<div class="alert alert-success" role="alert" style="position: absolute; top: 150px">
   Se ha enviado la solicitud
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'
</div>

<%
                break;

            default:
                throw new AssertionError();
        }
    }
%>


