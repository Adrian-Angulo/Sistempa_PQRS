/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedList;
import java.util.List;

public class Solicitud {

    private int id_Solicitud;
    private String titulo;
    private int usuario;
    private int tipo;
    private String descripcion;
    private Timestamp fechaCreacion;
    private Timestamp fechaCierre;
    private LocalDate fechaDeRespuesta;
    private int estado;
    private String archivo;

    public Solicitud() {
    }

    public Solicitud(String titulo, int usuario, int tipo, String descripcion) {

        this.titulo = titulo;
        this.usuario = usuario;
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.fechaCreacion = Timestamp.valueOf(LocalDateTime.now());
        this.fechaDeRespuesta = LocalDate.now().plusDays(15);
        this.estado = 1;
        
    }

    public String getArchivo() {
        return archivo;
    }

    public Timestamp getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(Timestamp fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public LocalDate getFechaDeRespuesta() {
        return fechaDeRespuesta;
    }

    public void setFechaDeRespuesta(LocalDate fechaDeRespuesta) {
        this.fechaDeRespuesta = fechaDeRespuesta;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getId_pqrs() {
        return id_Solicitud;
    }

    public void setId_pqrs(int id_Solicitud) {
        this.id_Solicitud = id_Solicitud;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    // guardar soliciutd
    public static boolean registrarSolicitud(Solicitud p) {
        Conexion con = new Conexion();
        PreparedStatement ps = null;
        String sql = "INSERT INTO solicitud(titulo, usuario, tipo, descripcion, fechaCreacion, fechaCierre, fechaRespuesta, estado, documento) VALUES (?,?,?,?,?,?,?,?,?)";

        try (Connection conexion = con.get_connection()) {
            ps = conexion.prepareStatement(sql);
            ps.setString(1, p.getTitulo());
            ps.setInt(2, p.getUsuario());
            ps.setInt(3, p.getTipo());
            ps.setString(4, p.getDescripcion());
            ps.setTimestamp(5, p.getFechaCreacion());
            ps.setTimestamp(6, p.getFechaCierre());
            ps.setString(7, String.valueOf(p.getFechaDeRespuesta()) );
            ps.setInt(8, p.getEstado());
            ps.setString(9, p.getArchivo());
            ps.executeUpdate();
            System.out.println("Se envió la solicitud con éxito.");
            return true;
        } catch (SQLException e) {
            System.out.println("SQL error al registrar la solicitud: " + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.out.println("SQL error al cerrar PreparedStatement: " + e.getMessage());
                }
            }
        }
        return false;
    }

    public static List<Solicitud> listarSolicitudes() {
        List<Solicitud> listaPQRS = new LinkedList<>();
        Conexion db_connect = new Conexion();
        try (Connection conexion = db_connect.get_connection(); PreparedStatement ps = conexion.prepareStatement("SELECT * FROM solicitud"); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Solicitud solicitud = new Solicitud(rs.getString("titulo"), rs.getInt("usuario"), rs.getInt("tipo"), rs.getString("descripcion"));
                solicitud.setId_pqrs(rs.getInt("ID_Solicitud"));

                solicitud.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
                solicitud.setFechaDeRespuesta(LocalDate.parse(rs.getString("fechaRespuesta")));
                solicitud.setArchivo(rs.getString("documento"));
                listaPQRS.add(solicitud);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo traer la información: " + ex.getMessage());
        }
        return listaPQRS;
    }

    public static List<Solicitud> solucitudesDeUsuario(int id_U) {
        List<Solicitud> lista = new LinkedList<>();
        for (Solicitud solicitud : listarSolicitudes()) {
            if (solicitud.getUsuario() == id_U) {
                lista.add(solicitud);
            }
        }
        return lista;
    }

}
