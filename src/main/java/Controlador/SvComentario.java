/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Comentario;
import Modelo.Solicitud;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "SvComentario", urlPatterns = {"/SvComentario"})
@MultipartConfig
public class SvComentario extends HttpServlet {

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
        // Obtener parámetros de la solicitud
        int estadoSolicitud = Integer.parseInt(request.getParameter("terminado"));
        String comentario = request.getParameter("comentario");
        int idSolicitud = Integer.parseInt(request.getParameter("solicitud"));
        int idUsuario = Integer.parseInt(request.getParameter("usuario"));

        // Imprimir parámetros para depuración
        System.out.println("Comentario: " + comentario);
        System.out.println("Solicitud: " + idSolicitud);
        System.out.println("Usuario: " + idUsuario);

        // Registrar comentario
        if (Comentario.registrarComentario(new Comentario(idSolicitud, idUsuario, comentario))) {
            // Actualizar estado de la solicitud según la opción seleccionada
            switch (estadoSolicitud) {
                case 2:
                    Solicitud.actualizarSolicitud(2, idSolicitud);
                    break;
                case 3:
                    Solicitud.actualizarSolicitud(3, idSolicitud);
                    break;
                default:
                    System.out.println("Estado de solicitud no válido");
                    return;
            }

            // Redirigir al panel correspondiente según el tipo de usuario
            if (idUsuario == 1) {
                request.getRequestDispatcher("PanelUsuario.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("PanelAdministrador.jsp").forward(request, response);
            }
        } else {
            System.out.println("Error al registrar comentario");
        }
    }

    //metodo para envio de alerta en caso de error
    private void setAlertAndRedirect(String alertType, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("alerta", alertType);
        request.getRequestDispatcher("PanelUsuario.jsp").forward(request, response);

    }

}
