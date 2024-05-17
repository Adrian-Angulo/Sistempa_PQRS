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

    private int id_Estado;
    private String nombre;

    public Estado(String nombre) {
        this.nombre = nombre;
    }

    public Estado() {
    }

    public int getId_estado() {
        return id_Estado;
    }

    public void setId_estado(int id_Estado) {
        this.id_Estado = id_Estado;
    }

    public String getNombre_estado() {
        return nombre;
    }

    public void setNombre_estado(String nombre) {
        this.nombre = nombre;
    }

    public static List<Estado> listarEstado() {
        List<Estado> listaEstados = new LinkedList<>();
        Conexion db_connect = new Conexion();
        try (Connection conexion = db_connect.get_connection(); PreparedStatement ps = conexion.prepareStatement("SELECT * FROM estado"); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Estado estado = new Estado(rs.getString("nombre"));
                estado.setId_estado(rs.getInt("id_Estado"));

                listaEstados.add(estado);
                System.out.println("se cargo un estado");
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo traer la información: " + ex.getMessage());
        }
        return listaEstados;
    }
    
    
    public static String darEstado(int id_Estado){
        for (Estado estado : listarEstado()) {
             System.out.println(estado.getId_estado());
            if(estado.getId_estado() == id_Estado){
                return estado.getNombre_estado();
            }
        }
        return null;
    }

}
