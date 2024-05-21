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
    private String fechaDeRespuesta;
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
        this.fechaDeRespuesta = String.valueOf(LocalDate.now().plusDays(15));
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

    public int getId_Solicitud() {
        return id_Solicitud;
    }

    public void setId_Solicitud(int id_Solicitud) {
        this.id_Solicitud = id_Solicitud;
    }

    public String getFechaDeRespuesta() {
        return fechaDeRespuesta;
    }

    public void setFechaDeRespuesta(String fechaDeRespuesta) {
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
            ps.setString(7, String.valueOf(p.getFechaDeRespuesta()));
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

    public static boolean actualizarSolicitud(int estado, int solicitud) {
        Conexion con = new Conexion();
        PreparedStatement ps = null;
        String sql = "UPDATE solicitud SET estado = ? WHERE ID_Solicitud = ?";
        try (Connection conexion = con.get_connection()) {
            ps = conexion.prepareStatement(sql);
            ps.setInt(1, estado);
            ps.setInt(2, solicitud);

            ps.executeUpdate();
            System.out.println("Se actualizo el estado de la solicitud.");
            return true;
        } catch (SQLException e) {
            System.out.println("SQL error al actualizar el estado de la solicitud " + e.getMessage());
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
                solicitud.setId_Solicitud(rs.getInt("ID_Solicitud"));
                solicitud.setEstado(rs.getInt("estado"));
                solicitud.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
                solicitud.setFechaDeRespuesta(rs.getString("fechaRespuesta"));
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

    /**
     * metodo para dar solicitudes en proceso del usuario
     *
     * @param id_U
     * @return int
     */
    public static int solucitudesEnProceso(Usuario s) {
        int contador = 0;
        for (Solicitud solicitud : listarSolicitudes()) {
            // Verificar si la solicitud está en proceso y pertenece al usuario o si el usuario tiene un ID especial (2)
            if (solicitud.getEstado() == 2 && (s.getId_U() == 2 || s.getId_U() == solicitud.getUsuario())) {
                contador++;
            }
        }
        return contador;
    }

    /**
     * metodo para ver el numero de solicitudes finalizadas
     *
     * @param id_U
     * @return int
     */
    public static int solucitudesFinalizadas(Usuario s) {
        int contador = 0;
        for (Solicitud solicitud : listarSolicitudes()) {
            // Verificar si la solicitud está en proceso y pertenece al usuario o si el usuario tiene un ID especial (2)
            if (solicitud.getEstado() == 3 && (s.getId_U() == 2 || s.getId_U() == solicitud.getUsuario())) {
                contador++;
            }
        }
        return contador;
    }

    public static List<Solicitud> reportesCercaDeFechaRespuesta() {
        List<Solicitud> lista = new LinkedList<>();
        LocalDate now = LocalDate.now();
        for (Solicitud solicitud : listarSolicitudes()) {
            LocalDate fechaRespuesta = LocalDate.parse(solicitud.getFechaDeRespuesta());
            if (fechaRespuesta.minusDays(2).isEqual(now)) {
                lista.add(solicitud);
            }
        }
        return lista;
    }
    public static double estadistica(Usuario s){
        return (solucitudesFinalizadas(s)*100) / listarSolicitudes().size();
    }

}
