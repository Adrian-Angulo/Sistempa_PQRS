

<%
    if (usuario.getRol() == 2) {
%>


<div class="mobile-menu-left-overlay"></div>

<nav class="side-menu">
    <ul class="side-menu-list">
        <li class="blue-dirty">
            <a href="HomeAdministrador.jsp">
                <span class="glyphicon glyphicon-th"></span>
                <span class="lbl">Inicio</span>
            </a>
        </li>


        <li class="blue-dirty">
            <a href="#">
                <span class="glyphicon glyphicon-th"></span>
                <span class="lbl">Usuarios</span>
            </a>
        </li>

    </ul>
</nav>
<%
} else {

%>
<div class="mobile-menu-left-overlay"></div>

<nav class="side-menu">
    <ul class="side-menu-list">
        <li class="blue-dirty">
            <a href="../HomeUsuario.jsp">
                <span class="glyphicon glyphicon-th"></span>
                <span class="lbl">Inicio</span>
            </a>
        </li>

        <li class="blue-dirty">
            <a href="solicitud.jsp" id="crearSolicitud" >
                <span class="glyphicon glyphicon-th"></span>
                <span class="lbl">Crear una nueva solicitud</span>
            </a>
        </li>

        <li class="blue-dirty">
            <a href="#">
                <span class="glyphicon glyphicon-th"></span>
                <span class="lbl">ver estado de la solucitud</span>
            </a>
        </li>
        <li class="blue-dirty">
            <a href="#">
                <span class="glyphicon glyphicon-th"></span>
                <span class="lbl">ver estado de la solucitud</span>
            </a>
        </li>

    </ul>
</nav>
<%    }
%>
