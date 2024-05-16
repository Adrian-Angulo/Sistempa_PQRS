<%-- 
    Document   : HomeAdministrador
    Created on : 3/05/2024, 8:10:33 a.�m.
    Author     : ADRIAN CASTILLO
--%>


<%@include file="Templates/head.jsp" %>
</head>

<body class="with-side-menu">
    <%

        Usuario usuario = (Usuario) session.getAttribute("usuario");


    %>
    <%@include file="Templates/Header.jsp" %>

    <%@include file="Templates/nav.jsp" %>

    <!-- Contenido -->
    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12">
                    <div class="row">
                        <div class="col-sm-3">
                            <article class="statistic-box " style="background-color: rgba(90, 90, 255, 0.789);">
                                <div>
                                    <div class="number" id="lbltotal"></div>
                                    <div class="caption"><div>Total de Solicitudes</div></div>
                                    <div class="caption"><div><%= Solicitud.solucitudesDeUsuario(usuario.getId_U()).size() %> </div></div>
                                </div>
                            </article>
                        </div>

                        <div class="col-sm-3">
                            <article class="statistic-box yellow">
                                <div>
                                    <div class="number" id="lbltotalabierto"></div>
                                    <div class="caption"><div>Solicitudes en proceso</div></div>
                                    <div class="caption"><div>0</div></div>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-3">
                            <article class="statistic-box green" >
                                <div>
                                    <div class="number" id="lbltotalcerrado"></div>
                                    <div class="caption"><div>Solicitudes finalizadas</div></div>
                                    <div class="caption"><div>0</div></div>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-3">
                            <article class="statistic-box red">
                                <div>
                                    <div class="number" id="lbltotalcerrado"></div>
                                    <div class="caption"><div>Solicitudes vencidas</div></div>
                                    <div class="caption"><div>0</div></div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>


            <section id="seccionPrincipal">
                <header class="card-header">
                    Solicitudes
                </header>
                <div class="card-block">
                    <div id="divgrafico" style="height: 250px;">
                        <table class="table">
                            <thead>
                                <tr>
                                    
                                    <th scope="col">Asunto</th>
                                    <th scope="col">Tipo</th>
                                    <th scope="col">estado</th>
                                    <th scope="col">Fecha de Envio</th>
                                    <th scope="col">Fecha de vencimiento</th>

                                </tr>
                            </thead>
                            <tbody>

                                <%                                        List<Solicitud> listaDeSolicitudes = Solicitud.solucitudesDeUsuario(usuario.getId_U());

                                    if (listaDeSolicitudes == null || listaDeSolicitudes.isEmpty()) {

                                %>
                                <tr>
                                    <td colspan="5">No hay solicitudes</td>
                                    
                                </tr>




                                <%                                    } else {
                                    for (Solicitud solicitud : listaDeSolicitudes) {

                                        


                                %>

                                <tr>
                                    
                                    <td><%= solicitud.getTitulo() %></td>
                                    <td><%= Tipo.darTipoSolicitud(solicitud.getTipo())%></td>
                                    <td><%= Estado.darEstado(solicitud.getEstado())%></td>
                                    <td><%= solicitud.getFechaCreacion()%></td>
                                    <td><%= solicitud.getFechaDeRespuesta() %></td>
                                </tr>




                                <%    

                                        }
                                    }
                                %>


                            </tbody>
                        </table>

                    </div>
                </div>
            </section>

        </div>
    </div>
    <!-- Contenido -->


   
    <script src="public/js/lib/jquery/jquery.min.js"></script>
    <script src="public/js/lib/tether/tether.min.js"></script>
    <script src="public/js/lib/bootstrap/bootstrap.min.js"></script>
    <script src="public/js/plugins.js"></script>
    <script src="public/js/app.js"></script>

    <script src="public/js/lib/datatables-net/datatables.min.js"></script>

    <script src="public/js/lib/bootstrap-sweetalert/sweetalert.min.js"></script>

    <script src="public/js/lib/summernote/summernote.min.js"></script>

    <script src="public/js/lib/fancybox/jquery.fancybox.pack.js"></script>

    <script src="public/js/summernote-ES.js"></script>

    <script src="public/js/lib/select2/select2.full.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script type="text/javascript" src="home.js"></script>

</body>
</body>
</html>
