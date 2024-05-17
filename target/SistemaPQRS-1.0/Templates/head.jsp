<%-- Document : PanelUsuario Created on : 16/05/2024, 10:02:11 p. m. Author : ADRIAN CASTILLO --%>

<%@page import="Modelo.Estado" %>
<%@page import="Modelo.Tipo" %>
<%@page import="Modelo.Solicitud" %>
<%@page import="java.util.List" %>
<%@page import="Modelo.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sidebar With Bootstrap</title>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilos_Panel.css">


        <!-- iconos boostrap -->
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- dataTable -->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://cdn.datatables.net/2.0.7/css/dataTables.bootstrap5.css">

        <style>
            a {
                text-decoration: none;
            }

            .border-left-blue {
                border-left: 6px solid rgb(6, 74, 162);
            }

            .text-primary {
                color: rgb(6, 74, 162);
                font-weight: 900;
            }

            .border-left-pendiente {
                border-left: 6px solid rgb(190, 193, 7);

            }

            .text-2 {
                color: rgb(190, 193, 7);
                font-weight: 900;
            }

            .border-left-vencida {
                border-left: 6px solid rgb(193, 7, 7);
            }

            .text-3 {
                color: rgb(193, 7, 7);
                font-weight: 900;
            }
        </style>