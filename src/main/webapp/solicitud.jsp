<%-- 
    Document   : HomeAdministrador
    Created on : 3/05/2024, 8:10:33 a.ï¿½m.
    Author     : ADRIAN CASTILLO
--%>


<%@include file="Templates/head.jsp" %>
<!-- CKEditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
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

            <header class="section-header">
                <div class="tbl">
                    <div class="tbl-row">
                        <div class="tbl-cell">
                            <h3>Nuevo Ticket</h3>
                            <ol class="breadcrumb breadcrumb-simple">
                                <li><a href="#">Home</a></li>
                                <li class="active">Nuevo Ticket</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </header>

            <div class="box-typical box-typical-padding">
                <p>
                    Desde esta ventana puedes crear una solicitud.
                </p>

                <h5 class="m-t-lg with-border">Ingresar Información</h5>

                <div class="row">
                    <form method="post" id="ticket_form" class="needs-validation">

                        <input type="hidden" id="usu_id" name="usu_id" value="<%= usuario.getNombre()%>">

                        <div class="col-lg-12">
                            <label class="form-label semibold" for="exampleInput">Titulo</label>
                            <input type="text" class="form-control" id="validationCustom01" value="Mark" required>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <fieldset class="form-group">
                                <label class="form-label semibold" for="exampleInput">Tipo</label>
                                <select id="cat_id" name="cat_id" class="form-control">

                                    <%
                                        for (TipoSolicitud tipo : TipoSolicitud.listarTipoSolicitud()) {
                                    %>
                                    <option><%= tipo.getNombre_Solicitud()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                                <div class="invalid-feedback">
                                    escojer Tipo
                                </div>

                        </div>

                        <div class="col-lg-6">
                            <fieldset class="form-group">
                                <label class="form-label semibold" for="exampleInput">Documentos Adicionales</label>
                                <input type="file" name="fileElem" id="fileElem" class="form-control" multiple>
                                <div class="invalid-feedback">
                                    Cargar un documento
                                </div>
                            </fieldset>
                        </div>

                        <div class="col-lg-12">
                            <fieldset class="form-group">
                                <label class="form-label semibold" for="tick_descrip">Descripción</label>
                                <div class="summernote-theme-1">
                                    <textarea id="tick_descrip" cols="120" name="tick_descrip" class="summernote" name="name"></textarea>
                                    <div class="invalid-feedback">
                                        Por favor escribir algo
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="col-lg-12">
                            <button type="submit" name="action" value="add" class="btn btn-rounded btn-inline btn-primary">Guardar</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <!-- Contenido -->



    <!-- ckEditor -->

    <script>
        ClassicEditor
                .create(document.querySelector('#tick_descrip'), )
                .catch(error => {
                    console.error(error);
                });

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="public/js/lib/jquery/jquery.min.js"></script>
    <script src="public/js/lib/tether/tether.min.js"></script>  
    <script src="public/js/plugins.js"></script>
    <script src="public/js/app.js"></script>
    <script type="text/javascript" src="home.js"></script>
    <script >
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (() => {
            'use strict';

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            const forms = document.querySelectorAll('.needs-validation');

            // Loop over them and prevent submission
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>


</body>
</body>
</html>
