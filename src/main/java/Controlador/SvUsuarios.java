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
                    
                    if(session !=null){
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

                if (Usuario.crearUsuario(new Usuario(identificacion, nombre, apellido, correo, contrasena, 1))) {
                    System.out.println("se ha registrado exitosamente");

                    
                    response.sendRedirect("index.jsp");
                } else {
                    System.out.println("El usuario ya existe en la base de datos");
                }

                break;
            case "Session":
                correo = request.getParameter("correo");
                contrasena = request.getParameter("contrasena");

                // Es importante validar los datos de entrada para evitar ataques como la inyección de SQL.
                if (correo == null || contrasena == null) {
                    // Redirigir al usuario a la página de inicio de sesión con un mensaje de error.
                    response.sendRedirect("index.jsp?error=Por favor ingrese correo y contraseña");
                    return;
                }

                for (Usuario usuario : Usuario.listarUsuarios()) {
                    // Utilizar equals en lugar de equalsIgnoreCase para la contraseña mejora la seguridad.
                    if (usuario.getCorreo().equalsIgnoreCase(correo) && usuario.getContrasena().equals(contrasena)) {
                        //crear session para el usuario
                        
                        HttpSession session = request.getSession();
                        session.setAttribute("usuario", usuario);
                        
                        if (usuario.getRol() == 1) {
                            // Redirigir al administrador a su página de inicio.
                            response.sendRedirect("HomeUsuario.jsp");
                            return; // Es importante terminar el método después de enviar una redirección.
                        } else if (usuario.getRol() == 2) {
                            // Redirigir al usuario a su página de inicio.
                            response.sendRedirect("HomeAdministrador.jsp");
                            return;
                        }
                    }
                }

                // Si no se encuentra el usuario, redirigir a la página de inicio de sesión con un mensaje de error.
                response.sendRedirect("index.jsp?error=Usuario o contraseña incorrectos");

                break;

            default:
                throw new AssertionError();
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
