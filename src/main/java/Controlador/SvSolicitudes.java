/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Solicitud;
import Modelo.Usuario;
import Modelo.Tipo;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "SvSolicitudes", urlPatterns = {"/SvSolicitudes"})
@MultipartConfig
public class SvSolicitudes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        String titulo = request.getParameter("Titulo");
        String tipo = request.getParameter("tipo");
        String descripcion = request.getParameter("descripcion");
        Part filePart = request.getPart("documento");

        System.out.println(titulo + "," + tipo + "," + descripcion + "," + filePart);
        
        System.out.println(tipo);
        //creamo una solicitud
        Solicitud solicitud = new Solicitud(titulo, usuario.getId_U(),1 , descripcion);;
        
        // si se carga un documento se lo guarda
        if (filePart != null) {
            String fileName = getSubmittedFileName(filePart);
            String uploadPath = getServletContext().getRealPath("/") + "documentos/" +usuario.getId_U() + fileName  ;
            guardarArchivo(filePart, uploadPath);
            String documento = "documentos/" + fileName + usuario.getId_U();

            solicitud.setArchivo(documento);

        }
        //guardar la solicitud en la base de datos
        if (Solicitud.registrarSolicitud(solicitud)) {
            setAlertAndRedirect("SolicitudRegistrada", request, response);
        }

    }

    private void guardarArchivo(Part filePart, String uploadPath) throws IOException {
        try (InputStream input = filePart.getInputStream(); OutputStream output = new FileOutputStream(uploadPath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }
    }

    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
    //metodo para envio de alerta en caso de error

    private void setAlertAndRedirect(String alertType, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("alerta", alertType);
        request.getRequestDispatcher("solicitud.jsp").forward(request, response);
    }
}
