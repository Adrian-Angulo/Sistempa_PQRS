
<%
   
    if (alerta != null) {

        switch (alerta) {
            case "SolicitudNoEnviada":
%>
<!-- aletra de emergencia -->
<div class="alert alert-warning" role="alert" style="position: absolute; top: 120px; right: 100px">
    No se pudo enviar la solicitud
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'
</div>



<%
        break;
    case "SolicitudEnviada":
%>
<!-- aletra de emergencia -->
<div class="alert alert-success" role="alert" style="position: absolute; top: 120px; right: 100px">
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


