

<%@page import="Modelo.Comentario"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Estado"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Solicitud"%>
<!-- Ver Solicitudes de usuario -->


<div class="modal fade" id="VerSolcitudes<%=usu.getId_U()%>"aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-lg">

        <div class="modal-content">
            <div class="modal-header" style=" background-color: rgb(14, 34, 56); color: white;">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Infomacion de Usuario</h1>
                <a style="background-color: white"
                   type="button"
                   class="btn-close"
                   href="PanelAdministrarUsuarios.jsp"
                   aria-label="Close"
                   ></a>
            </div>
            <div class="modal-body" style="background-color: rgb(247, 251, 255);">


                <% List<Solicitud> solicitudes = Solicitud.solucitudesDeUsuario(usu.getId_U());

                    if (solicitudes == null || solicitudes.isEmpty()) {

                %>

                <div> El usuario no tiene Solicitudes </div>

                <%                            }
                    for (Solicitud s : solicitudes) {


                %>
                <div class="row text-center" >
                    <!-- Asunto-->
                    <div class="col" id="comluna" style="max-width:  300px; overflow: hidden; text-overflow: ellipsis;text-align:left ; white-space: nowrap;">
                        <span> <b> <%= s.getTitulo()%> </b>  </span>
                    </div>


                    <!-- Descripcion-->
                    <div class="col" 
                         style=" max-width: 350px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                        <span> <%= s.getDescripcion()%>.</span>
                    </div>

                    <!-- Estado-->
                    <div class="col" >
                        <span> <%= Estado.darEstado(s.getEstado())%> </span>
                    </div>

                    <!-- Fecha envio-->
                    <div class="col" >
                        <span> <%= s.getFechaCreacion()%></span>
                    </div>

                    <div class="col">
                        <!-- boton para bloquear usuario -->
                        <div class="d-inline-flex p-2" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Chats" >

                            <button type="button"  class="btn btn-danger btnform" data-bs-toggle="modal"   data-bs-target="#Historial<%=s.getId_Solicitud()%>">
                                <i class="bi bi-arrow-up-right-square-fill"></i>
                            </button>
                        </div>

                    </div>



                </div>






                <%
                    }

                %>



            </div>
            <div class="modal-footer justify-content-center" style=" background-color: rgb(14, 34, 56);">
                <a href="PanelAdministrarUsuarios.jsp"
                   type="button"
                   class="btn btn-secondary"

                   >
                    Cerrar
                </a>

            </div>
        </div>

    </div>
</div>


<%    for (Solicitud so : solicitudes) {


%>
<div class="modal fade" id="Historial<%=so.getId_Solicitud()%>" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-lg">

        <%
            Usuario user = Usuario.darUsuarioPorId(so.getUsuario());
        %>
        <div class="modal-content">
            <div class="modal-header" style=" background-color: rgb(14, 34, 56); color: white;">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Infomacion de Usuario</h1>
                <a style="background-color: white"
                   type="button"
                   class="btn-close"
                   href="PanelAdministrarUsuarios.jsp"
                   aria-label="Close"
                   ></a>
            </div>
            <div class="modal-body" style="background-color: rgb(247, 251, 255);">
                <div class="d-flex mb-1">
                    <div class="me-auto p-2">
                        <div class=" flex-grow-1">
                            <div>
                                <i class="bi bi-person-circle" style="font-size: 40px;"></i>
                                <label for="" style="font-size: larger; font-weight: bold;"> <%= user.getNombre() + " " + user.getApellido()%> </label>
                                <span
                                    style="font-size: 12px; color: rgb(192, 193, 194);">(<%= user.getCorreo()%>)</span>
                                <span style="font-size: 12px; color: rgb(192, 193, 194);"> <%= so.getFechaCreacion()%> </span>
                            </div>
                        </div>
                    </div>
                    <div class="p-2 d-flex align-items-center">
                        <!-- Mostrar Documento -->

                        <div type="button" class="btn btn-danger btnform >
                             <% if (so.getArchivo() == null
                                         || so.getArchivo().isEmpty()) {
                             %>

                             <button type="button"
                             class="btn btn-success">
                            Sin Documentacion
                            </button>


                            <% } else {%>
                            <button type="button"
                                    class="btn btn-success"
                                    data-bs-toggle="modal"
                                    data-bs-target="#Archivo<%= so.getId_Solicitud()%>">
                                <i
                                    class="bi bi-file-earmark-pdf-fill"></i> Documento
                            </button>
                            <% }%>



                        </div>

                    </div>
                </div>

                <!-- area de comentario -->

                <div class="row" style="margin: 5px 10px;">
                    <textarea name="" id="" disabled style="border-radius: 10px;"> <%= so.getDescripcion()%>
                    </textarea>
                </div>


                <%
                    List<Comentario> listaC = Comentario.comentariosDeSolicitud(so.getId_Solicitud());

                    if (listaC != null || !listaC.isEmpty()) {

                        for (Comentario c : listaC) {

                %>


                <div class="row" style="margin: 5px 10px;">
                    <label for="validationTextarea" class="form-label"> <%= Usuario.darNombreUsuario(c.getUsuario())%></label>
                    <textarea class="form-control" id="validationTextarea" name="Descripcion"  disabled style="border-radius: 10px;" ><%= c.getComentario()%></textarea>

                </div>



                <%
                        }
                    }
                %>


                <!-- Enviar nuevo comentario -->
                <form action="SvComentario"  method="post" enctype="multipart/form-data">

                    <input type="hidden" id="campoOculto" name="solicitud" value="<%= so.getId_Solicitud()%>">
                    <input type="hidden" id="campoOculto" name="usuario" value="<%= user.getId_U()%>">


                    <!-- text area de respuesta -->
                    <div class="col-md-12">
                        <div class="d-flex justify-content-between">
                            <label for="validationTextarea" id="comentario" class="form-label">Comentario</label>

                        </div>
                        <textarea class="form-control" id="comentario" name="comentario" placeholder="Escribe una respuesta" required></textarea>
                        <div class="invalid-feedback">
                            Por favor escriba algo
                        </div>
                        <div class="d-flex justify-content-start">
                            <div style="margin-right: 10px">
                                <label>Solicitud Terminada? </label>
                            </div>

                            <div class="form-check" style="margin-right: 10px">
                                <input class="form-check-input" type="radio" value="3" name="terminado" id="flexRadioDefault1">
                                <label class="form-check-label" for="flexRadioDefault1">
                                    Si
                                </label>
                            </div>
                            <div class="form-check" style="margin-right: 10px">
                                <input class="form-check-input" type="radio" value="2" name="terminado" id="flexRadioDefault2" checked>
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
                <a href="PanelAdministrarUsuarios.jsp"
                   type="button"
                   class="btn btn-secondary"

                   >
                    Cerrar
                </a>
                <button  type="submit" class="btn btn-secondary">Comentar</button>
            </div>
            </form>

        </div>

    </div>
</div>

<!-- Modal para archivo -->
<div class="modal modal-xl"
     id="Archivo<%= so.getId_Solicitud()%>"
     tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn" data-bs-toggle="modal"
                        data-bs-target="#Historial<%=so.getId_Solicitud()%>"> <i class="bi bi-arrow-left"></i></button>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <embed
                src="<%=so.getArchivo()%>"
                type="application/pdf"
                width="100%"
                height="700px">
        </div>
    </div>
</div>



<%   }

%>

