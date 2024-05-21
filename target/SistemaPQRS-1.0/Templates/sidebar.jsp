<%
    if (usuario.getRol() == 1) {
%>
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
            <a href="PanelUsuario.jsp" class="sidebar-link">
                <i class="bi bi-card-heading"></i>
                <span>Inicio</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="NuevaSolicitud.jsp" class="sidebar-link">
                <i class="bi bi-send-fill"></i>
                <span>Nueva Solicitud</span>
            </a>
        </li>


    </ul>
    <div class="sidebar-footer">
        <a href="SvUsuarios" class="sidebar-link">
            <i class="lni lni-exit"></i>
            <span>Logout</span>
        </a>
    </div>
</aside>

<%
} else {
%>

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
            <a href="PanelAdministrador.jsp" class="sidebar-link">
                <i class="bi bi-card-heading"></i>
                <span>Inicio</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="PanelAdministrarUsuarios.jsp" class="sidebar-link">
                <i class="bi bi-person-lines-fill"></i>
                <span>Administrar Usuarios</span>
            </a>
        </li>
    </ul>
    <div class="sidebar-footer">
        <a href="SvUsuarios" class="sidebar-link">
            <i class="lni lni-exit"></i>
            <span>Logout</span>
        </a>
    </div>
</aside>
<%
    }

%>

