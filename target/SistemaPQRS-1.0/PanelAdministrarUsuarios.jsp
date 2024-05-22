<%@include file="Templates/head.jsp" %>

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
                    Administrar usuarios
                </h1>
            </div>

            



            <div class="row">
                <div class="form-div">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Usuarios
                            </h6>
                            cantidad usuarios:
                            <%= Usuario.listarUsuarios().size()%>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-area">
                                <table id="example"
                                       class="table table-striped text-center"
                                       style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Correo Electronico</th>
                                            <th>Fecha de Registro</th>
                                            <th>Acciones</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Usuario> lista
                                                    = Usuario.listarUsuarios();

                                            if (lista == null || lista.isEmpty()) { %>

                                        <tr>
                                            <td colspan="6"> NO HAY SOLICITUDES</td>
                                        </tr>

                                        <% } else {
                                            for (Usuario usu : lista) {
                                                if (usu.getRol() != 2) {
                                        %>

                                        <tr>
                                            <td>
                                                <%= usu.getId_U()%>
                                            </td>
                                            <td>
                                                <%= usu.getNombre()%>
                                            </td>
                                            <td>
                                                <%= usu.getApellido()%>
                                            </td>

                                            <td>
                                                <%= usu.getCorreo()%>
                                            </td>
                                            <td>
                                                <%= usu.getFechaCreacion()%>
                                            </td>
                                            <td>
                                                <div class="d-inline-flex p-0" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Ver # Solicitudes" >


                                                    <!-- boton para editar el rol del usuario -->
                                                    <button type="button"  class="btn btn-primary btnform" data-bs-toggle="modal"  data-bs-target="#EditarRol<%= usu.getId_U()%>">
                                                        <i class="bi bi-eye-fill"></i>
                                                    </button>
                                                </div>

                                                <div class="d-inline-flex p-0" data-bs-toggle="tooltip" data-bs-placement="top  " data-bs-title="bloquer usuario" >

                                                <!-- boton para bloquear usuario -->
                                                <button type="button"  class="btn btn-danger btnform" data-bs-toggle="modal"  data-bs-target="#Bloquear<%= usu.getId_U()%>">
                                                    <i class="bi bi-lock-fill"></i>
                                                </button>

                                                </div>



                                            </td>




                                        </tr>


                                        <%@include file="Templates/ModalEditarElUsuario.jsp" %>

                                        <%@include file="Templates/ModalParaBloquearUsuario.jsp" %>

                                        <%@include file="Templates/VerSolicitudesUsuario.jsp" %>







                                        <% }
                                                }
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
    <script >


    </script>
    <%@include file="Templates/scripts.jsp" %>
</body>

</html>