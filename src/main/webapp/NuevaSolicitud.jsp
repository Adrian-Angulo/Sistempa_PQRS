<%@include  file="Templates/head.jsp" %>
<style>
    #formulario{
        padding: 30px 40px;
    }
    #formulario label{
        font-weight: bold;
    }
</style>
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
                    Nueva solicitud
                </h1>
            </div>




            <div class="row">
                <div class="form-div">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Formulario para enviar una solicitud
                            </h6>

                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-area">


                                <!-- Formulario -->

                                <form class="row g-3 needs-validation" method="post" action="SvSolicitudes" id="formulario" enctype="multipart/form-data" novalidate>
                                    <div class="col-md-6">
                                        <label for="validationCustom01" class="form-label">Asunto</label>
                                        <input type="text" class="form-control" id="validationCustom01" name="Asunto" required>
                                        <div class="invalid-feedback">
                                            Debes darle un nombre a tu asunto
                                        </div>
                                    </div>



                                    <div class="col-md-3">
                                        <label for="validationCustom04" class="form-label">Tipo</label>
                                        <select class="form-select" name="tipo" id="validationCustom04" required>
                                            <option selected disabled value="">mas...</option>
                                            <%  List<Tipo> listaT = Tipo.listarTipo();
                                                if (listaT != null && !listaT.isEmpty()) {
                                                    for (Tipo t : listaT) {


                                            %>

                                            <option value="<%= t.getId_tipoSolicitud() %>"> <%= t.getNombre_Solicitud()  %></option>

                                            <%
                                                    }
                                                }
                                            %>

                                        </select>
                                        <div class="invalid-feedback">
                                            Seleccionar un tipo
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="validationCustom05" class="form-label">Documento</label>
                                        <input type="file" class="form-control" name="documento" id="validationCustom05" >

                                    </div>
                                    <div class="col-md-12">
                                        <label for="validationTextarea" class="form-label">Descripcion</label>
                                        <textarea class="form-control" id="validationTextarea" name="Descripcion" placeholder="Escribe una descripcion" required></textarea>
                                        <div class="invalid-feedback">
                                            Por favor escriba algo
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit" >Enviar</button>
                                    </div>
                                </form>
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