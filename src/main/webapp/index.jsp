


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/estilos.css">
        <title>Ludiflex | Login & Registration</title>
        <style>
            .nav-button .btn{
                width: 150px;
                height: 40px;
                font-weight: 500;
                background: rgba(255, 255, 255, 0.4);
                border: none;
                border-radius: 30px;
                cursor: pointer;
                transition: .3s ease;
            }
        </style>
        <!-- boostrap estilos-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>

    <body>
        <div class="wrapper">
            <nav class="nav">
                <div class="nav-logo">
                    <p>Sistema PQRS</p>
                </div>

                <div class="nav-button">
                    <button class="btn white-btn" id="loginBtn" onclick="login()"> Iniciar Sesion </button>
                    <button class="btn" id="registerBtn" onclick="register()">Registrarse</button>
                </div>
                <div class="nav-menu-btn">
                    <i class="bx bx-menu" onclick="myMenuFunction()"></i>
                </div>
            </nav>


            <!-- menejo de alertar -->
            <%  String alerta = (String) request.getAttribute("alerta");
            %>
            <%@include file="Alertas/alertaDeIndex.jsp" %>




            <!----------------------------- Form box ----------------------------------->
            <div class="form-box">

                <!------------------- login form -------------------------->

                <div class="login-container" id="login">
                    <div class="top">
                        <span>No tienes cuenta? <a href="#" onclick="register()">Registrate</a></span>
                        <header>Iniciar Sesion</header>
                    </div>
                    <form action="SvUsuarios?accion=IniciarSesion" id="registro" method="post">
                        <div class="input-box">
                            <input type="text" class="input-field" name="correo" placeholder="Email">
                            <i class="bx bx-user"></i>
                        </div>
                        <div class="input-box">
                            <input type="password" class="input-field" name="contrasena" placeholder="*********">
                            <i class="bx bx-lock-alt"></i>
                        </div>
                        <div class="input-box">
                            <input type="submit" class="submit" value="Iniciar Sesion">
                        </div>
                        <div class="two-col">

                            <div class="two">
                                <label><a href="#">Se te olvido la contraseña?</a></label>
                            </div>
                        </div>
                    </form>

                </div>

                <!------------------- registration form -------------------------->
                <div class="register-container" id="register">
                    <div class="top">
                        <span>Have an account? <a href="#" onclick="login()">Iniciar Sesion</a></span>
                        <header>Registro</header>
                    </div>
                    <form action="SvUsuarios?accion=Agregar"  method="post">
                        <div class="two-forms">
                            <div class="input-box">
                                <input type="text" class="input-field" name="nombre" placeholder="Nombre" required>
                                <i class="bx bx-user"></i>
                            </div>
                            <div class="input-box">
                                <input type="text" class="input-field" name="apellido" placeholder="Apellido" required>
                                <i class="bx bx-user"></i>
                            </div>
                        </div>
                        <div class="input-box">
                            <input type="number" class="input-field" name="identificacion" placeholder="identificación"
                                   required pattern="\d{6,10}" title="La cédula debe tener entre 6 y 10 dígitos.">
                            <i class="bx bx-envelope"></i>
                        </div>
                        <div class="input-box">
                            <input type="text" class="input-field" name="correo" placeholder="Email" required>
                            <i class="bx bx-envelope"></i>
                        </div>
                        <div class="input-box">
                            <input type="password" class="input-field" name="contrasena" placeholder="Password" required>
                            <i class="bx bx-lock-alt"></i>
                        </div>
                        <div class="input-box">
                            <input type="submit" class="submit" value="Register">
                        </div>
                        <div class="two-col">
                            <div class="one">
                                <input type="checkbox" id="register-check">
                                <label for="register-check"> Remember Me</label>
                            </div>

                        </div>

                    </form>

                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="scripts/index.js">

        </script>



    </body>

</html>
