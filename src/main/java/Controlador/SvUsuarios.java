/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // obtener la accion del formulario
        String accion = request.getParameter("accion");

        // obtener los parametros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String identificacion = request.getParameter("identificacion");
        String correo = request.getParameter("correo");
        String contrasena = Usuario.hashPass(request.getParameter("contrasena"));

        Usuario usuario;

        // evular la accion
        switch (accion) {
            case "Agregar":
                //se crea un nuevo usuario
                usuario = new Usuario(identificacion, nombre, apellido, correo, contrasena);

                //verificar si el usuario ya se encuetra registrado
                if (!Usuario.verificarExistencia(usuario)) {

                    // registrar el usuario en la base de datos
                    String registro = (Usuario.crearUsuario(usuario)) ? "RegistroExitoso" : "RegistroNoExitoso";

                    //enviar mensaje de alerta
                    setAlertAndRedirect(registro, request, response);
                } else {
                    setAlertAndRedirect("UsuarioRegistrado", request, response);
                }

                break;

            case "IniciarSesion":

                usuario = Usuario.validarUsuario(correo, contrasena);
                //validar el inicio de session
                if (usuario != null) {

                    //creamos una session para el usuario en el proyecto
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", usuario);

                    //verificar el rol del usuario
                    if (usuario.getRol() == 1) {
                        response.sendRedirect("PanelUsuario.jsp");
                    } else {
                        response.sendRedirect("PanelAdministrador.jsp");
                    }

                } else {
                    setAlertAndRedirect("UsuarioNoAutenticado", request, response);
                }

                break;

            default:
                throw new AssertionError();
        }

    }

    //metodo para envio de alerta en caso de error
    private void setAlertAndRedirect(String alertType, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("alerta", alertType);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        

    }
}
