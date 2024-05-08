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
public class Estado {

    private int id_estado;
    private String nombre_estado;

    public Estado(String nombre_estado) {
        this.nombre_estado = nombre_estado;
    }

    public Estado() {
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    public String getNombre_estado() {
        return nombre_estado;
    }

    public void setNombre_estado(String nombre_estado) {
        this.nombre_estado = nombre_estado;
    }

    public static List<Estado> listarEstado() {
        List<Estado> listaEstados = new LinkedList<>();
        Conexion db_connect = new Conexion();
        try (Connection conexion = db_connect.get_connection(); PreparedStatement ps = conexion.prepareStatement("SELECT * FROM estado"); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Estado estado = new Estado(rs.getString("nombre_estado"));
                estado.setId_estado(rs.getInt("id_estado"));

                listaEstados.add(estado);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo traer la información: " + ex.getMessage());
        }
        return listaEstados;
    }
    
    
    public static String darEstado(int id_estado){
        for (Estado estado : listarEstado()) {
            if(estado.getId_estado() == id_estado){
                return estado.getNombre_estado();
            }
        }
        return null;
    }

}
