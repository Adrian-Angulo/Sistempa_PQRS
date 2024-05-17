<nav class="navbar bg-body-tertiary ">

    <div class="container-fluid ">
        <button class="btn btn-secondary dropdown-toggle"
                style="background: none; border: none; color: black"
                type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <%= usuario.getCorreo()%>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Configuraciones</a></li>
            <li><a class="dropdown-item" href="#">Cerrar Session</a></li>
        </ul>
    </div>
</nav>