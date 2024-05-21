

<%@page import="Modelo.Estado"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Solicitud"%>
<!-- Ver Solicitudes de usuario -->


<div class="modal fade" id="VerSolcitudes<%=usu.getId_U()%>" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">

        <div class="modal-content">
            <div class="modal-header" style=" background-color: rgb(14, 34, 56); color: white;">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Infomacion de Usuario</h1>
                <button style="background-color: white"
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                        ></button>
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
                        <button type="button"  class="btn btn-danger btnform" data-bs-toggle="modal"  data-bs-target="#Ver<%= s.getId_Solicitud()%>">
                            <i class="bi bi-arrow-up-right-square-fill"></i>
                        </button>
                    </div>

                            <%@include file="Modal_Seguimiento.jsp" %>

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





