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
import java.sql.Timestamp;
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
    private String correo;
    private String contrasena;
    private Timestamp fechaCreacion;
    private Timestamp fehcaModificacion;
    private Timestamp fechaEliminacion;
    private int rol;
    private static List<Usuario> listaUsuarios = new LinkedList<>();

    public Usuario() {
    }

    public Usuario(String identificacion, String nombre, String apellido, String correo, String contrasena, int rol) {

        this.identificacion = identificacion;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.contrasena = contrasena;
        this.rol = rol;
    }

    public int getId_U() {
        return id_U;
    }

    public void setId_U(int id_U) {
        this.id_U = id_U;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
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

    public Timestamp getFechaCreacion() {

        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Timestamp getFechaModificacion() {
        return fehcaModificacion;
    }

    public void setFechaModificacion(Timestamp fechaModificacion) {
        this.fehcaModificacion = fechaModificacion;
    }

    public Timestamp getFechaEliminacion() {
        return fechaEliminacion;
    }

    public void setFechaEliminacion(Timestamp fechaEliminacion) {
        this.fechaEliminacion = fechaEliminacion;
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

    public static boolean crearUsuario(Usuario usu) {
        if (!verificarExistencia(usu)) {
            Conexion db_connect = new Conexion();
            try (Connection conexion = db_connect.get_connection()) {
                String query = "INSERT INTO usuario (identificacion, nombre, apellido, correo, contrasena, fechaCreacion, fehcaModificacion, fechaEliminacion, rol) VALUES (?,?,?,?,?,?,?,?,?)";
                try (PreparedStatement ps = conexion.prepareStatement(query)) {
                    ps.setString(1, usu.getIdentificacion());
                    ps.setString(2, usu.getNombre());
                    ps.setString(3, usu.getApellido());
                    ps.setString(4, usu.getCorreo());
                    ps.setString(5, usu.getContrasena());
                    ps.setTimestamp(6, usu.getFechaCreacion());
                    ps.setTimestamp(7, usu.getFechaModificacion());
                    ps.setTimestamp(8, usu.getFechaEliminacion());
                    ps.setInt(9, usu.getRol());

                    ps.executeUpdate();
                    System.out.println("Usuario Agregado");
                    listaUsuarios.add(usu);
                    return true;
                } catch (SQLIntegrityConstraintViolationException e) {
                    System.out.println("Error: el número que desea registrar ya se encuentra registrado " + e);
                } catch (SQLException ex) {
                    System.out.println("El usuario no se pudo agregar: " + ex.getMessage());
                }
            } catch (SQLException e) {
                System.out.println("Error de conexión: " + e.getMessage());
            }
        }
        return false;
    }

    public static String verficarRol(Usuario usu) {
        for (Rol rol : Rol.listarRoles()) {

            if (usu.getRol() == rol.getId_R()) {
                return "Administrador";
            }
        }
        return "Persona natural";
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
        try (Connection conexion = db_connect.get_connection(); PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuario"); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Usuario usu = new Usuario(rs.getString("identificacion"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("correo"), rs.getString("contrasena"), rs.getInt("rol"));
                usu.setId_U(rs.getInt("Id_U"));
                usu.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
                usu.setFechaModificacion(rs.getTimestamp("fehcaModificacion"));
                usu.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
                listaUsuarios.add(usu);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo traer la información: " + ex.getMessage());
        }
        return listaUsuarios;
    }

    public static List<PQRS> listarPQRS() {
        List<PQRS> listaPQRS = new LinkedList<>();
        Conexion db_connect = new Conexion();
        try (Connection conexion = db_connect.get_connection(); PreparedStatement ps = conexion.prepareStatement("SELECT * FROM pqrs"); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                PQRS pqrs = new PQRS(rs.getString("titulo"),rs.getInt("usuario"), rs.getInt("tipo"), rs.getString("descripcion"), rs.getTimestamp("fechaCreacion"), rs.getInt("estado"));
                pqrs.setId_pqrs(rs.getInt("id_pqrs"));
                listaPQRS.add(pqrs);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo traer la información: " + ex.getMessage());
        }
        return listaPQRS;
    }
    
    public static String darNombreUsuario(int id_U){
        for (Usuario user : listarUsuarios()) {
            if(user.getId_U() == id_U){
                return user.getNombre();
            }
        }
        return null;
    }
    
    public static List<PQRS> solucitudesDeUsuario( int id_U){
        List<PQRS> lista = new LinkedList<>();
        for (PQRS pqrs : listarPQRS()) {
            if(pqrs.getUsuario() == id_U){
                lista.add(pqrs);
            }
        }
        return lista;
    }

}
