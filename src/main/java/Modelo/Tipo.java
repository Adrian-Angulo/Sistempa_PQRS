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
public class Tipo {

    private int id_tipoSolicitud;
    private String nombre;

    public Tipo() {
    }

    public Tipo(String nombre) {
        this.nombre= nombre;
    }

    public int getId_tipoSolicitud() {
        return id_tipoSolicitud;
    }

    public void setId_tipoSolicitud(int id_tipoSolicitud) {
        this.id_tipoSolicitud = id_tipoSolicitud;
    }

    public String getNombre_Solicitud() {
        return nombre;
    }

    public void setNombre_Solicitud(String nombre) {
        this.nombre = nombre;
    }

    public static List<Tipo> listarTipo() {
        List<Tipo> tiposDeSolicitud = new LinkedList<>();
        Conexion db_connect = new Conexion();
        try (Connection conexion = db_connect.get_connection(); PreparedStatement ps = conexion.prepareStatement("SELECT * FROM tipo"); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Tipo tipo = new Tipo(rs.getString("nombre"));
                tipo.setId_tipoSolicitud(rs.getInt("ID_Tipo"));
                tiposDeSolicitud.add(tipo);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo traer la información: " + ex.getMessage());
        }
        return tiposDeSolicitud;
    }

    public static String darTipoSolicitud(int idSolicitud) {
        for (Tipo tipo : listarTipo()) {
            if (tipo.getId_tipoSolicitud() == idSolicitud) {
                return tipo.getNombre_Solicitud();
            }
        }
        return null;
    }

    public static int darIdSolicitud(String Solicitud) {
        for (Tipo tipo : listarTipo()) {
            if (tipo.getNombre_Solicitud().equalsIgnoreCase(Solicitud)) {
                return tipo.getId_tipoSolicitud();
            }
        }
        return 0;
    }

}
