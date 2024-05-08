/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

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
public class TipoSolicitud {
    
    
    private int id_tipoSolicitud;
    private String nombre_Solicitud;

    public TipoSolicitud() {
    }

    public TipoSolicitud(String nombre_Solicitud) {
        this.nombre_Solicitud = nombre_Solicitud;
    }

    public int getId_tipoSolicitud() {
        return id_tipoSolicitud;
    }

    public void setId_tipoSolicitud(int id_tipoSolicitud) {
        this.id_tipoSolicitud = id_tipoSolicitud;
    }

    public String getNombre_Solicitud() {
        return nombre_Solicitud;
    }

    public void setNombre_Solicitud(String nombre_Solicitud) {
        this.nombre_Solicitud = nombre_Solicitud;
    }
    
        public static List<TipoSolicitud> listarTipoSolicitud() {
        List<TipoSolicitud> tiposDeSolicitud = new LinkedList<>();
        Conexion db_connect = new Conexion();
        try (Connection conexion = db_connect.get_connection(); PreparedStatement ps = conexion.prepareStatement("SELECT * FROM tipoSolicitud"); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                TipoSolicitud tipoSolicitud = new TipoSolicitud(rs.getString("nombre_solicitud"));
                tipoSolicitud.setId_tipoSolicitud(rs.getInt("id_tipoSolicitud"));

                tiposDeSolicitud.add(tipoSolicitud);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo traer la información: " + ex.getMessage());
        }
        return tiposDeSolicitud;
    }
        
     public static String darTipoSolicitud(int idSolicitud){
         for (TipoSolicitud tipoSolicitud : listarTipoSolicitud()) {
             if(tipoSolicitud.getId_tipoSolicitud() == idSolicitud){
                 return tipoSolicitud.getNombre_Solicitud();
             }
         }
         return null;
     }
        
        
    
}
