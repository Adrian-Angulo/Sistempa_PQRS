<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Comentario"%>
<!-- Modal para segumiento -->
<div class="modal modal-xl"
     id="Ver<%= s.getId_Solicitud()%>"
     tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">



            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> <%= s.getTitulo()%></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>


            <div class="modal-body row">

                <div class="col-md-3">
                    <label for="validationCustom01" class="form-label">Fecha de envio</label>
                    <input type="text" class="form-control" id="validationCustom01" value="<%= s.getFechaCreacion()%>" name="Asunto" disabled >
                </div>

                <div class="col-md-3">
                    <label for="validationCustom01" class="form-label">Usuario</label>
                    <input type="text" class="form-control" id="validationCustom01" value="<%= Usuario.darNombreUsuario(s.getUsuario())%>" name="Asunto" disabled >
                </div>

                <div class="col-md-3">
                    <label for="validationCustom04" class="form-label">Tipo</label>

                    <input type="text" class="form-control" name="documento" value=" <%= Tipo.darTipoSolicitud(s.getTipo())%>" id="validationCustom05" disabled >

                </div>
                <div class="col-md-3">
                    <label for="validationCustom05" class="form-label">Fecha limite</label>
                    <input type="text" class="form-control" name="documento" value=" <%= s.getFechaDeRespuesta()%>" id="validationCustom05" disabled >
                </div>
                <div class="col-md-12">
                    <label for="validationTextarea" class="form-label">Descripcion</label>
                    <textarea class="form-control" id="validationTextarea" name="Descripcion"  disabled ><%= s.getDescripcion()%></textarea>

                </div>


                <!-- Mostrar Documento -->

                <div class="col-md-12 text-center" style="margin: 10px">
                    <% if (s.getArchivo() == null
                                || s.getArchivo().isEmpty()) {
                    %>

                    <button type="button"
                            class="btn btn-success">
                        Sin Documentacion
                    </button>


                    <% } else {%>
                    <button type="button"
                            class="btn btn-success"
                            data-bs-toggle="modal"
                            data-bs-target="#Archivo<%= s.getId_Solicitud()%>">
                        <i
                            class="bi bi-file-earmark-pdf-fill"></i> Documento
                    </button>
                    <% }%>



                </div>
                <%
                    List<Comentario> listaC = Comentario.comentariosDeSolicitud(s.getId_Solicitud());

                    if (listaC != null || !listaC.isEmpty()) {

                        for (Comentario c : listaC) {

                %>



                <div class="col-md-12">
                    <label for="validationTextarea" class="form-label"> <%= Usuario.darNombreUsuario(c.getUsuario())%></label>
                    <textarea class="form-control" id="validationTextarea" name="Descripcion"  disabled ><%= c.getComentario()%></textarea>

                </div>



                <%
                        }
                    }
                %>

                <form action="SvComentario"  method="post" enctype="multipart/form-data">

                    <input type="hidden" id="campoOculto" name="solicitud" value="<%= s.getId_Solicitud()%>">
                    <input type="hidden" id="campoOculto" name="usuario" value="<%= usuario.getId_U()%>">


                    <!-- text area de respuesta -->
                    <div class="col-md-12">
                        <div class="d-flex justify-content-between">
                            <label for="validationTextarea" id="comentario" class="form-label">Comentario</label>

                        </div>
                        <textarea class="form-control" id="comentario" name="comentario" placeholder="Escribe una respuesta" required></textarea>
                        <div class="invalid-feedback">
                            Por favor escriba algo
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="3" name="terminado" id="flexRadioDefault1">
                            <label class="form-check-label" for="flexRadioDefault1">
                                Solicitud terminada
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="2" name="terminado" id="flexRadioDefault2" checked>
                            <label class="form-check-label" for="flexRadioDefault2">
                                Solicitud en tramite
                            </label>
                        </div>

                    </div>

                    <div class="col-md-12 text-center" style="margin: 10px">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button  type="submit" class="btn btn-primary">Comentar</button>
                    </div>

                </form>



            </div>

        </div>
    </div>
</div>