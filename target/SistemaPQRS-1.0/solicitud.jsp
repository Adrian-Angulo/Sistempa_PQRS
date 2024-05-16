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




                <!-- formulario para enviar la peticion -->

                <div class="row">



                    <form method="POST" action="SvSolicitudes?" onsubmit="return validarFormulario()" id="ticket_form" enctype="multipart/form-data" class="needs-validation">

                        <div class="col-lg-12">
                            <label class="form-label semibold" for="titulo">Título</label>
                            <input type="text" class="form-control" name="Titulo"  required>
                            <div class="invalid-feedback">
                                Por favor ingresa un título.
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <fieldset class="form-group">
                                <label class="form-label semibold" for="tipo">Tipo</label>
                                <select id="tipo" name="tipo" class="form-control" required>
                                    <% for (Tipo tipo : Tipo.listarTipo()) {%>
                                    <option value="<%= tipo.getId_tipoSolicitud()%>"><%= tipo.getNombre_Solicitud()%></option>
                                    <% }%>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor escoge un tipo.
                                </div>
                            </fieldset>    
                        </div>

                        <div class="col-lg-6">
                            <fieldset class="form-group">
                                <label class="form-label semibold" for="documento">Documentos Adicionales</label>
                                <input type="file" name="documento" id="documento" accept="application/pdf" class="form-control" multiple >
                                <div class="invalid-feedback">
                                    Por favor carga un documento.
                                </div>
                            </fieldset>
                        </div>

                        <div class="col-lg-12">
                            <fieldset class="form-group">
                                <label class="form-label semibold" for="descripcion">Descripción</label>
                                <textarea id="descripcion" name="descripcion" class="form-control summernote" required></textarea>
                                <div class="invalid-feedback">
                                    Por favor escribe una descripción.
                                </div>
                            </fieldset>
                        </div>

                        <div class="col-lg-12">
                            <button type="submit" class="btn btn-rounded btn-inline btn-primary">Guardar</button>
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
                .create(document.querySelector('#descripcion'), )
                .catch(error => {
                    console.error(error);
                });

    </script>

    <script>
        function validarFormulario() {
            var descripcion = document.getElementById('descripcion').value;
            var documento = document.getElementById('documento').files.length;

            if (descripcion === '' && documento === 0) {
                alert('Por favor, completa la descripción o carga un documento.');
                return false;
            }
            return true;
        }
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
    <script>
        function enviarFormulario() {
            var formData = new FormData(document.getElementById('usu_id'));

            fetch('SvSolicitudes', {
                method: 'POST',
                body: formData
            })
                    .then(function (response) {
                        return response.text();
                    })
                    .then(function (textoDelServidor) {
                        console.log(textoDelServidor);
                    })
                    .catch(function (error) {
                        console.error('Error:', error);
                    });
        }
    </script>

</body>
</body>
</html>
