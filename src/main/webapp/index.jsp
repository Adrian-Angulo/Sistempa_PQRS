<%-- 
    Document   : index
    Created on : 3/05/2024, 12:20:11 a. m.
    Author     : ADRIAN CASTILLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Modelo.Rol"%>
<!DOCTYPE html>

<%

%>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="estilos/estilos.css">
  <!-- iconos boostrap 5 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body>
  <!-- navbar -->
  <div class="navbar">
    <a href="inde.html" class="Logo">Atencion al usuario</a>
    <a class="btn-navbar" id="btn-navbar" type="button">Iniciar Session</a>
  </div>


  <section class="container-index">
    <div class="row">

      <!-- informacion de la pagina -->
      <div class="col row info">
        <div class="text-center">

          <h1 class="col titulo-info">Sistema de Atencion al usuario</h1>
          <p class="col">
            ¡Bienvenido a nuestro servicio de atención al cliente en línea! Estamos comprometidos en ofrecer una
            experiencia excepcional y nos alegra que estés aquí. Regístrate para acceder a tu cuenta personal donde
            podrás realizar peticiones, reclamos y sugerencias. Tu voz es importante para nosotros y estamos aquí para
            escucharte. ¡Comienza ahora y juntos mejoraremos cada día!
          </p>
        </div>
        <div>

        </div>
      </div>

      <!-- Registrar nuevo usuario -->
      <div id="formResgistro" class="col registro">
        <label class="titulo" for="">
          Registro
        </label>

        <!-- Formulario de registro -->
        <form class="row g-3 needs-validation form" method="post" action="SvUsuarios?accion=Agregar" novalidate>
          <!-- Nombre -->
          <div class="col-md-6">
            
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
            <div class="invalid-feedback">
              Por favor ingresa tu nombre.
            </div>
          </div>

          <!-- Apellido -->
          <div class="col-md-6">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" class="form-control" name="apellido" id="apellido" required>
            <div class="invalid-feedback">
              Por favor ingresa tu apellido.
            </div>
          </div>

          <!-- Identificacion -->
          <div class="col-md-12">
            <label for="identificacion" class="form-label">Identificacion</label>
            <input type="text" class="form-control" name="identificacion" id="identificacion" required>
            <div class="invalid-feedback">
              Por favor ingresa tu número de identificación.
            </div>
          </div>
         
          <!-- Correo -->
          <div class="col-md-12">
            <label for="correo" class="form-label">Correo</label>
            <input type="email" class="form-control" name="correo" id="correo" required>
            <div class="invalid-feedback">
              Por favor ingresa una dirección de correo válida.
            </div>
          </div>

          <!-- Contraseña -->
          <div class="col-md-12">
            <label for="contrasena" class="form-label">Contraseña</label>
            <input type="password" class="form-control"name="contrasena" id="contrasena" required>
            <div class="invalid-feedback">
              Por favor ingresa una contraseña.
            </div>
          </div>

          <div class="col-md-12 text-center">
            <button class="btn-navbar" type="submit">Registrarse</button>
          </div>
        </form>
      </div>

      <!-- Logear usuario -->
      <div style="display: none;" id="formInicioSession" class="col registro">
        <label class="titulo" for="">
          Iniciar Session
        </label>

        <!-- Formulario de iniciar session -->
        <form class="row g-3 needs-validation form" method="post" action="SvUsuarios?accion=Session" novalidate>

          <!-- Correo -->
          <div class="col-md-12">
            <label for="correo" class="form-label" >Correo</label>
            
            <input type="email" class="form-control" name="correo" id="correo" required>
            <div class="invalid-feedback">
              Por favor ingresa una dirección de correo válida.
            </div>
          </div>

          <!-- Contraseña -->
          <div class="col-md-12">
            <label for="contrasena" class="form-label">Contraseña</label>
            <input type="password" class="form-control" name="contrasena" id="contrasena" required>
            <div class="invalid-feedback">
              Por favor ingresa una contraseña.
            </div>
          </div>

          <div class="col-md-12 text-center">
            <button class="btn-navbar" type="submit">iniciar seccion</button>
          </div>
        </form>
      </div>
    </div>


  </section>

  <footer>
    <ul class="footer-contacto">
      <li>Contacto</li>
      <li>Adrian Camilo Castillo Angulo</li>
      <li>Accastillo222@umariana.edu.co</li>
    </ul>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>

    <script src="JS/js.js"></script>
</body>

</html>
