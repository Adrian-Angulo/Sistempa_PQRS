<%@include  file="Templates/head.jsp" %>


</head>

<body>

    <% Usuario usuario = (Usuario) request.getSession(false).getAttribute("usuario");%>

    <div class="wrapper">

        <!-- menu lateral -->
        <%@include file="Templates/sidebar.jsp" %>

        <!-- panel  -->
        <div class="main p-3">
            <!-- navbar -->
            <%@include file="Templates/nav.jsp" %>
            <div class="text-center">
                <h1>
                    Panel Administrador
                </h1>
            </div>

            <!---cartas para noficar-->
            <div class="row  justify-content-center">

                <div class="info col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-blue shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Solicitudes</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <%= Solicitud.listarSolicitudes().size()%> </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="info col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-pendiente shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class="text-xs font-weight-bold text-2 text-uppercase mb-1">
                                        En Proceso</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <%= Solicitud.solucitudesEnProceso(usuario)%> </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="info col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-azul shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class="text-xs font-weight-bold text-3 text-uppercase mb-1">
                                        Realizadas</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <%= Solicitud.solucitudesFinalizadas(usuario)%> </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </div>



            <div class="row">
                <div class="form-div">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Solicitudes
                            </h6>

                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-area">
                                <table id="example"
                                       class="table table-striped text-center"
                                       style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>Asunto</th>
                                            <th>Usuario</th>
                                            <th>Tipo</th>

                                            <th>Estado</th>

                                            <th>Seguimiento</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Solicitud> lista
                                                    = Solicitud.listarSolicitudes();

                                            if (lista == null || lista.isEmpty()) { %>

                                        <tr>
                                            <td colspan="6"> NO HAY SOLICITUDES</td>
                                        </tr>

                                        <% } else {
                                            for (Solicitud s : lista) {%>

                                        <tr>
                                            <td>
                                                <%= s.getTitulo()%>
                                            </td>
                                            <td>
                                                <%= Usuario.darNombreUsuario(s.getUsuario())%>
                                            </td>
                                            <td>
                                                <%=Tipo.darTipoSolicitud(s.getTipo())%>
                                            </td>

                                            <td>
                                                <%=Estado.darEstado(s.getEstado())%>
                                            </td>



                                            <td>
                                                <button type="button"
                                                        class="btn btn-primary"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#Ver<%= s.getId_Solicitud()%>">
                                                    <i class="bi bi-chat-left-text-fill"></i>
                                                </button>

                                            </td>
                                        </tr>


                                        <%@include file="Templates/Modal_Seguimiento.jsp" %>


                                        <%@include file="Templates/Modal_Archivo.jsp" %>


                                        <% }
                                            }%>


                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>
    <%@include file="Templates/scripts.jsp" %>
</body>

</html>