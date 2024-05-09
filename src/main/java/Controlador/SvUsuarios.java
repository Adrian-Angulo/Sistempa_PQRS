/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Usuario;
import Modelo.Rol;
import java.io.IOException;

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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        switch (accion) {
            case "CerrarSesion":
                HttpSession session = request.getSession(false);

                if (session != null) {
                    session.invalidate();
                    response.sendRedirect("index.jsp");
                }
                break;
            default:
                throw new AssertionError();
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String identificacion;
        String nombre;
        String apellido;
        String correo;
        String contrasena;

        switch (accion) {
            case "Agregar":

                identificacion = request.getParameter("identificacion");
                nombre = request.getParameter("nombre");
                apellido = request.getParameter("apellido");
                correo = request.getParameter("correo");
                contrasena = request.getParameter("contrasena");

                if (Usuario.crearUsuario(new Usuario(identificacion, nombre, apellido, correo, Usuario.hashPass(contrasena), 1))) {
                    System.out.println("se ha registrado exitosamente");

                    response.sendRedirect("index.jsp");
                } else {

                    // Si no se encuentra el usuario, redirigir a la página de inicio de sesión con un mensaje de error.                    
                    setAlertAndRedirect("UsuarioYaRegistrado", request, response);
                }

                break;
            case "Session":
                //recibir parametros de login
                correo = request.getParameter("correo");
                contrasena = Usuario.hashPass(request.getParameter("contrasena")) ;
                System.out.println(contrasena);
                // verificamos si el usuario existe en la base de datos, si existe lo traer y lo almacena en la varialbe usuario
                Usuario usuario = Usuario.validarUsuario(correo, contrasena);

                // si el usuario es diferente de null osea que si existe en la base de datos
                if (usuario != null) {

                    //crear session para el usuario
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", usuario);

                    // verificamos los el rol que tiene el usuario
                    if (usuario.getRol() == 1) {
                        // si el usuarioa es una persona natural redirecionar al HomeUsuairo
                        response.sendRedirect("HomeUsuario.jsp");

                    } else if (usuario.getRol() == 2) {

                        // si el usuario es una administrador redirigir al HomeAdministrador
                        response.sendRedirect("HomeAdministrador.jsp");

                    }
                } else {
                    // si el usuario no existe enviar un mensaje de que el usuarioa no esta registrado
                    setAlertAndRedirect("UsuarioNoRegistrado", request, response);
                }
                break;

            default:
                throw new AssertionError();
        }

    }

    private void setAlertAndRedirect(String alertType, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("alerta", alertType);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
