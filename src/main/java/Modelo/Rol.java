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
public class Rol {

    private int id_R;
    private String nombre;

    public Rol(String nombre) {
        this.nombre = nombre;
    }

    public int getId_R() {
        return id_R;
    }

    public void setId_R(int id_R) {
        this.id_R = id_R;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public static List<Rol> listarRoles() {
        List<Rol> listaRoles = new LinkedList<>();

        Conexion db_connect = new Conexion();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try (Connection conexion = db_connect.get_connection()) {
            String query = "SELECT * FROM roles";
            ps = conexion.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Rol r;
                r = new Rol(rs.getString("nombre"));

                r.setId_R(rs.getInt("id_R"));

                listaRoles.add(r);

            }
        } catch (SQLException ex) {

            System.out.println("no se pudo traer la informacion " + ex);
        }
        return listaRoles;
    }
    
        /**
     * Método estático para obtener el ID de una categoría a partir de su
     * nombre.
     *
     * @param nombreC El nombre de la categoría.
     * @return El ID de la categoría, o 0 si no se encontró la categoría.
     */
    public static int darIdCategoria(String nombreC) {
        for (Rol c : listarRoles()) {
            if (c.getNombre().equalsIgnoreCase(nombreC)) {
                return c.getId_R();
            }
        }
        return 0;
    }

    /**
     * Método estático para obtener el nombre de una categoría a partir de su
     * ID.
     *
     * @param id El ID de la categoría.
     * @return El nombre de la categoría, o null si no se encontró la categoría.
     */
    public static String darNombreCategoria(int id) {
        for (Rol c : listarRoles()) {
            if (c.getId_R()== id) {
                return c.getNombre();
            }
        }
        return null;
    }
}
