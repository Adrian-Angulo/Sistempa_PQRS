/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import static Modelo.Solicitud.listarSolicitudes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author ADRIAN CASTILLO
 */
public class Comentario {
    private int id_Comentario;
    private int solicitud;
    private int usuario;
    private String comentario;

    public Comentario() {
    }

    public Comentario( int solicitud, int usuario, String comentario) {
        
        this.solicitud = solicitud;
        this.usuario = usuario;
        this.comentario = comentario;
    }

    public int getId_Comentario() {
        return id_Comentario;
    }

    public void setId_Comentario(int id_Comentario) {
        this.id_Comentario = id_Comentario;
    }

    public int getSolicitud() {
        return solicitud;
    }

    public void setSolicitud(int solicitud) {
        this.solicitud = solicitud;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    
    public static boolean registrarComentario(Comentario c) {
        Conexion con = new Conexion();
        PreparedStatement ps = null;
        String sql = "INSERT INTO comentarios(solicitud, usuario, comentario) VALUES (?,?,?)";

        try (Connection conexion = con.get_connection()) {
            ps = conexion.prepareStatement(sql);
            ps.setInt(1, c.solicitud);
            ps.setInt(2, c.usuario);
            ps.setString(3, c.getComentario());
         
            ps.executeUpdate();
            System.out.println("Se agrego un comentario");
            return true;
        } catch (SQLException e) {
            System.out.println("SQL error al agregar un comentario: " + e.getMessage());
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
    
    
    public static List<Comentario> leerComentarios() {
        List<Comentario> listaC = new LinkedList<>();
        Conexion db_connect = new Conexion();
        try (Connection conexion = db_connect.get_connection(); PreparedStatement ps = conexion.prepareStatement("SELECT * FROM comentarios"); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Comentario c = new Comentario(rs.getInt("solicitud"), rs.getInt("usuario"), rs.getString("comentario"));
                c.setId_Comentario(rs.getInt("ID_Comentario"));
                listaC.add(c);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo traer la información: " + ex.getMessage());
        }
        return listaC;
    }
    
        public static List<Comentario> comentariosDeSolicitud(int id_solicitud) {
        List<Comentario> lista = new LinkedList<>();
        for (Comentario c : leerComentarios()) {
            if (c.getSolicitud() == id_solicitud) {
                lista.add(c);
            }
        }
        return lista;
    }
    
}
