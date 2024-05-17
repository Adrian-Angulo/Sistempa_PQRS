<!-- Modal para archivo -->
<div class="modal modal-xl"
     id="Archivo<%= s.getId_Solicitud()%>"
     tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <button type="button" class="btn" data-bs-toggle="modal"
                        data-bs-target="#Ver<%= s.getId_Solicitud()%>"><i class="bi bi-arrow-left"></i></button>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <embed
                src="<%=s.getArchivo()%>"
                type="application/pdf"
                width="100%"
                height="700px">
        </div>
    </div>
</div>