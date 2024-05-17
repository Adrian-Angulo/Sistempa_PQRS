<%-- Document : PanelUsuario Created on : 16/05/2024, 10:02:11 p. m. Author : ADRIAN CASTILLO --%>

<%@page import="Modelo.Estado"%>
<%@page import="Modelo.Tipo"%>
<%@page import="Modelo.Solicitud"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sidebar With Bootstrap</title>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilos_Panel.css">


        <!-- iconos boostrap -->
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- dataTable -->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.bootstrap5.css">

        <style>
            .border-left-blue {
                border-left: 6px solid rgb(6, 74, 162);
            }

            .text-primary {
                color: rgb(6, 74, 162);
                font-weight: 900;
            }

            .border-left-pendiente {
                border-left: 6px solid rgb(190, 193, 7);

            }

            .text-2 {
                color: rgb(190, 193, 7);
                font-weight: 900;
            }

            .border-left-vencida {
                border-left: 6px solid rgb(193, 7, 7);
            }

            .text-3 {
                color: rgb(193, 7, 7);
                font-weight: 900;
            }
        </style>
    </head>

    <body>

        <% Usuario usuario = (Usuario) request.getSession(false).getAttribute("usuario");%>
        <div class="wrapper">
            <aside id="sidebar">
                <div class="d-flex">
                    <button class="toggle-btn" type="button">
                        <i class="lni lni-grid-alt"></i>
                    </button>
                    <div class="sidebar-logo">
                        <a href="#">Sistema PQRS</a>
                    </div>
                </div>
                <ul class="sidebar-nav">
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-card-heading"></i>
                            <span>Dashboar</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-send-fill"></i>
                            <span>Nueva Solicitud</span>
                        </a>
                    </li>


                </ul>
                <div class="sidebar-footer">
                    <a href="#" class="sidebar-link">
                        <i class="lni lni-exit"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </aside>


            <!-- panel  -->
            <div class="main p-3">
                <!-- navbar -->
                <nav class="navbar bg-body-tertiary ">

                    <div class="container-fluid ">
                        <button class="btn btn-secondary dropdown-toggle"
                                style="background: none; border: none; color: black" type="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            <%= usuario.getCorreo()%>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Configuraciones</a></li>
                            <li><a class="dropdown-item" href="#">Cerrar Session</a></li>
                        </ul>
                    </div>
                </nav>
                <div class="text-center">
                    <h1>
                        Dashboar
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
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
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
                                        <div class="text-xs font-weight-bold text-2 text-uppercase mb-1">
                                            Pendientes</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="info col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-vencida shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-3 text-uppercase mb-1">
                                            Vencidas</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
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
                                <h6 class="m-0 font-weight-bold text-primary">Solicitudes</h6>

                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-area">
                                    <table id="example" class="table table-striped text-center" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Asunto</th>
                                                <th>Tipo</th>
                                                <th>Fecha</th>
                                                <th>Estado</th>
                                                <th>Documento</th>
                                                <th>Seguimiento</th>
                                            </tr>
                                        </thead>
                                        <tbody >
                                            <%
                                                List<Solicitud> lista = Solicitud.solucitudesDeUsuario(usuario.getId_U());

                                                if (lista == null || lista.isEmpty()) {   %>

                                            <tr>
                                                <td colspan="6" > NO HAY SOLICITUDES</td>
                                            </tr>

                                            <% } else {

                                                for (Solicitud s : lista) {
                                            %>

                                            <tr>
                                                <td><%= s.getTitulo()%> </td>
                                                <td> <%= Tipo.darTipoSolicitud(s.getTipo())%></td>
                                                <td> <%= s.getFechaCreacion()%></td>
                                                <td> <%= Estado.darEstado(s.getEstado())%></td>
                                                <td> 
                                                    <%
                                                        if (s.getArchivo() == null || s.getArchivo().isEmpty()) {
                                                    %>

                                                    Sin Documentacion


                                                    <%
                                                    } else {

                                                    %>
                                                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#Archivo<%= s.getId_Solicitud()%>">
                                                        <i class="bi bi-file-earmark-pdf-fill"></i>
                                                    </button>
                                                    <%    }
                                                    %>

                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-primary">
                                                        <i class="bi bi-eye-fill"></i>
                                                    </button>

                                                </td>
                                            </tr>


                                            <!-- Modal para archivo -->
                                        <div class="modal modal-xl" id="Archivo<%= s.getId_Solicitud()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <embed src="<%=s.getArchivo()%>" type="application/pdf" width="100%" height="700px">
                                                </div>
                                            </div>
                                        </div>















                                        <%
                                                }
                                            }
                                        %>













                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- jQuery para dataTable -->
        <script src="https://code.jquery.com/jquery-3.7.1.js"
                integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.7/js/dataTables.bootstrap5.js"></script>
        <script>
            var table = $('#example').DataTable({
                language: {
                    "decimal": "",
                    "emptyTable": "No hay información",
                    "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                    "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                    "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Mostrar _MENU_ Entradas",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "Sin resultados encontrados",
                    "paginate": {
                        "first": "Primero",
                        "last": "Ultimo",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                },

            });

        </script>
        <script src="scripts/Panel.js"></script>
    </body>

</html>