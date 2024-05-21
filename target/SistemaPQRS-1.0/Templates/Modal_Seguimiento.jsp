<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Comentario"%>
<!-- Modal para segumiento -->
<div class="modal modal-xl"
     id="Ver<%= s.getId_Solicitud()%>"
     tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">

        <%
            Usuario userS = Usuario.darUsuarioPorId(s.getUsuario());
        %>
        <div class="modal-content">
            <div class="modal-header" style=" background-color: rgb(14, 34, 56); color: white;">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Infomacion de Usuario</h1>
                <a style="background-color: white"
                   type="button"
                   class="btn-close"
                   data-bs-dismiss="modal"
                   aria-label="Close"
                   ></a>
            </div>
            <div class="modal-body" style="background-color: rgb(247, 251, 255);">
                <div class="d-flex mb-1">
                    <div class="me-auto p-2">
                        <div class=" flex-grow-1">
                            <div>
                                <i class="bi bi-person-circle" style="font-size: 40px;"></i>
                                <label for="" style="font-size: larger; font-weight: bold;"> <%= userS.getNombre() + " " + userS.getApellido()%> </label>
                                <span
                                    style="font-size: 12px; color: rgb(192, 193, 194);">(<%= userS.getCorreo()%>)</span>
                                <span style="font-size: 12px; color: rgb(192, 193, 194);"> <%= s.getFechaCreacion()%> </span>
                            </div>
                        </div>
                    </div>
                    <div class="p-2 d-flex align-items-center">
                        <!-- Mostrar Documento -->

                        <div type="button" class="btn btn-danger btnform >
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

                    </div>
                </div>

                <!-- area de comentario -->

                <div class="row" style="margin: 5px 10px;">
                    <textarea name="" id="" disabled style="border-radius: 10px;"> <%= s.getDescripcion()%>
                    </textarea>
                </div>


                <%
                    List<Comentario> listaC = Comentario.comentariosDeSolicitud(s.getId_Solicitud());

                    if (listaC != null || !listaC.isEmpty()) {

                        for (Comentario c : listaC) {

                %>


            
                <div class="d-flex mb-1">
                    <div class="me-auto p-2">
                        <div class=" flex-grow-1">
                            <div>
                                <i class="bi bi-person-circle" style="font-size: 40px;"></i>
                                <label for="" style="font-size: larger; font-weight: bold;"> <%= Usuario.darNombreUsuario(c.getUsuario())%> </label>
                                <span
                                    style="font-size: 12px; color: rgb(192, 193, 194);">(<%= Usuario.darUsuarioPorId(c.getUsuario()).getCorreo()%>)</span>
                                <span style="font-size: 12px; color: rgb(192, 193, 194);"> porner fecha  </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- area de comentario -->

                <div class="row" style="margin: 5px 10px;">
                    <textarea name="" id="" disabled style="border-radius: 10px;"> <%= c.getComentario() %>
                    </textarea>
                </div>


                <%
                        }
                    }
                %>


                <!-- Enviar nuevo comentario -->
                <form action="SvComentario"  method="post" enctype="multipart/form-data">

                    <input type="hidden" id="campoOculto" name="solicitud" value="<%= s.getId_Solicitud()%>">
                    <input type="hidden" id="campoOculto" name="usuario" value="<%= usuario.getId_U()%>">


                    <!-- text area de respuesta -->
                    <div class="col-md-12">
                        <div class="d-flex justify-content-between">
                            <label for="validationTextarea" id="comentario" class="form-label">Comentario</label>

                        </div>
                        
                        <textarea class="form-control" <%= (s.getEstado()==3) ? "disabled" : "" %>  id="comentario" name="comentario" placeholder="Escribe una respuesta" required></textarea>
                        <div class="invalid-feedback">
                            Por favor escriba algo
                        </div>
                        <div class="d-flex justify-content-start">
                            <div style="margin-right: 10px">
                                <label>Solicitud Terminada? </label>
                            </div>
                            
                            <div class="form-check" style="margin-right: 10px">
                                <input class="form-check-input" <%= (s.getEstado()==3) ? "disabled" : "" %>  type="radio" value="3" name="terminado" id="flexRadioDefault1">
                                <label class="form-check-label" for="flexRadioDefault1">
                                    Si
                                </label>
                            </div>
                            <div class="form-check" style="margin-right: 10px">
                                <input class="form-check-input" type="radio"<%= (s.getEstado()==3) ? "disabled" : "" %> value="2" name="terminado" id="flexRadioDefault2" checked>
                                <label class="form-check-label" for="flexRadioDefault2">
                                    No
                                </label>
                            </div>
                        </div>


                    </div>

                    <div class="col-md-12 text-center" style="margin: 10px">


                    </div>



            </div>

            <div class="modal-footer justify-content-center" style=" background-color: rgb(14, 34, 56);">
                <a 
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                    >
                    Cerrar
                </a>
                <button  type="submit" <%= (s.getEstado()==3) ? "disabled" : "" %>  class="btn btn-secondary">Comentar</button>
            </div>
            </form>

        </div>

    </div>
</div>