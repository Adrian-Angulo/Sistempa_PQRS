


<%@page import="Modelo.Usuario"%>
<!-- Modal para ver datos del usuario por parte del administrador -->
<div class="modal fade" id="EditarRol<%= usu.getId_U()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-dialog">
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


                    <div class="text-center">
                        <h1 id="TituloEnModalVerInformacion"> <%= usu.getNombre() + " " + usu.getApellido()%>   </h1>
                        <p id="CorreoEnModalVerInformacion"> <%= usu.getCorreo()%></p>
                    </div>


                    <div class="text-center">
                        <div class="row">
                            <div class="col">
                                <label class="labelDeVerInfromacionUsu">Peticiones</label>
                                <input class="inputUsu" type="text" value="<%= Usuario.darCantidadEspecificaDeSolicitudes(usu.getId_U(), "Petición")%> " disabled>
                            </div>
                            <div class="col">
                                <label class="labelDeVerInfromacionUsu"># Quejas</label>
                                <input  class="inputUsu" type="text" value="<%= Usuario.darCantidadEspecificaDeSolicitudes(usu.getId_U(), "Queja")%>" disabled>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label class="labelDeVerInfromacionUsu"># Sugerencias</label>
                                <input  class="inputUsu" type="text" value="<%= Usuario.darCantidadEspecificaDeSolicitudes(usu.getId_U(), "Sugerencia")%>" disabled>
                            </div>
                            <div class="col">
                                <label class="labelDeVerInfromacionUsu"># Reclamos</label>
                                <input  class="inputUsu" type="text" value="<%= Usuario.darCantidadEspecificaDeSolicitudes(usu.getId_U(), "Reclamo")%>" disabled>
                            </div>
                        </div>

                        <br>
                        
                        <!-- boton para ver las solicitudes -->
                        <div>
                            <button id="verSolicitudes"  data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#VerSolcitudes<%=usu.getId_U()%>"> ver solicitudes</button>
                        </div>


                    </div>

                </div>
                <div class="modal-footer justify-content-center" style=" background-color: rgb(14, 34, 56);">
                    <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                        >
                        Cerrar
                    </button>

                </div>
            </div>
        </div>
    </div>
</div>



