/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author ADRIAN CASTILLO
 */
public class Usuario {

    private int id_U;
    private String identificacion;
    private String nombre;
    private String apellido;

    private String fechaNacimiento;
    private String genero;
    private String correo;
    private String contrasena;
    private int rol;
    private static List<Usuario> listaUsuarios = new LinkedList<>();

    public Usuario() {
    }

    public Usuario(String identificacion, String nombre, String apellido, String fechaNacimiento, String genero, String correo, String contrasena, int rol) {
        this.identificacion = identificacion;
        this.nombre = nombre;
        this.apellido = apellido;
        
        this.fechaNacimiento = fechaNacimiento;
        this.genero = genero;
        this.correo = correo;
        this.contrasena = contrasena;
        this.rol = rol;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public static List<Usuario> getListaUsuarios() {
        return listaUsuarios;
    }

    public static void setListaUsuarios(List<Usuario> listaUsuarios) {
        Usuario.listaUsuarios = listaUsuarios;
    }

    public int getId_U() {
        return id_U;
    }

    public void setId_U(int id_U) {
        this.id_U = id_U;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public static boolean crearUsuario(Usuario usu) {

        if (verificarExistencia(usu) == false) {
            Conexion db_connect = new Conexion();
            boolean bol = false;
            try (Connection conexion = db_connect.get_connection()) {
                PreparedStatement ps = null;
                try {
                    String query = "INSERT INTO usuarios ( nombre,  apellido,  fechaNacimiento,  genero,  correo,  contrasena,  rol) VALUES (?,?,?,?,?,?,?)";
                    ps = conexion.prepareStatement(query);
                    ps.setString(1, usu.getNombre());
                    ps.setString(2, usu.getApellido());
                    ps.setString(3, usu.getFechaNacimiento());
                    ps.setString(4, usu.getGenero());
                    ps.setString(5, usu.getCorreo());
                    ps.setString(5, usu.getContrasena());

                    ps.executeUpdate();
                    System.out.println("Tutorial Agregado");
                    bol = true;
                } catch (SQLIntegrityConstraintViolationException e) {
                    System.out.println(" \nError: el numero que desea resgistrar ya se encuentra registrado " + e);
                } catch (SQLException ex) {
                    System.out.println(ex + "el Tutorial no se puedo agregar");
                }
            } catch (SQLException e) {
                System.out.println(e);
            }

            listaUsuarios.add(usu);
            return true;
        }
        return false;
    }

    public static boolean verificarExistencia(Usuario usu) {
        for (Usuario usuario : listarUsuarios()) {
            if (usuario.getId_U() == usu.getId_U()) {
                return true;
            }
        }
        return false;
    }
    
    
        public static List<Usuario> listarUsuarios() {
        List<Usuario> listaUsuarios = new LinkedList<>();

        Conexion db_connect = new Conexion();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try (Connection conexion = db_connect.get_connection()) {
            String query = "SELECT * FROM usuarios";
            ps = conexion.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Usuario usu;
                usu = new Usuario(rs.getString("identificacion"),rs.getString("nombre"), rs.getString("apellido"),rs.getString("FechaNacimiento"), rs.getString("genero"), rs.getString("correo"),rs.getString("contrasena"), rs.getInt("Rol") );

                usu.setId_U(rs.getInt("Id_U"));

                listaUsuarios.add(usu);

            }
        } catch (SQLException ex) {

            System.out.println("no se pudo traer la informacion " + ex);
        }
        return listaUsuarios;
    }
}
