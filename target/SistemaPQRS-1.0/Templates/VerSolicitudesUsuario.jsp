

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
                        <button type="button"  class="btn btn-danger btnform" data-bs-toggle="modal"   data-bs-target="#Historial<%=s.getId_Solicitud()%>">
                            <i class="bi bi-arrow-up-right-square-fill"></i>
                        </button>
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
                        <button type="button" class="btn btn-danger btnform"> </button>
                    </div>
                </div>


                <div class="row" style="margin: 5px 10px;">
                    <textarea name="" id="" disabled style="border-radius: 10px;"> <%= so.getDescripcion()%>
                    </textarea>
                </div>



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



<%   }

%>

