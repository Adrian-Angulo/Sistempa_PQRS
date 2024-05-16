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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.LocalDateTime;

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
    private Timestamp fechaEliminacion;
    private int rol;

    public Usuario() {
    }

    public Usuario(String identificacion, String nombre, String apellido, String correo, String contrasena) {

        this.identificacion = identificacion;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.contrasena = contrasena;
        this.fechaCreacion = Timestamp.valueOf(LocalDateTime.now());
        this.rol = 1;
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
    
    //metodos estaticos para el menejo de los usuarios

    public static boolean crearUsuario(Usuario usu) {
        if (!verificarExistencia(usu)) {
            Conexion db_connect = new Conexion();
            try (Connection conexion = db_connect.get_connection()) {
                String query = "INSERT INTO usuario (identificacion, nombre, apellido, correo, contrasena, fechaCreacion, fechaEliminacion, rol) VALUES (?,?,?,?,?,?,?,?)";
                try (PreparedStatement ps = conexion.prepareStatement(query)) {
                    ps.setString(1, usu.getIdentificacion());
                    ps.setString(2, usu.getNombre());
                    ps.setString(3, usu.getApellido());
                    ps.setString(4, usu.getCorreo());
                    ps.setString(5, usu.getContrasena());
                    ps.setTimestamp(6, usu.getFechaCreacion());     
                    ps.setTimestamp(7, usu.getFechaEliminacion());
                    ps.setInt(8, usu.getRol());
                    ps.executeUpdate();
                    System.out.println("Usuario Agregado");

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
            if (usuario.getId_U() == usu.getId_U() || usuario.getCorreo().equalsIgnoreCase(usu.getCorreo()) || usuario.getIdentificacion().equalsIgnoreCase(usu.getIdentificacion())) {
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
                Usuario usu = new Usuario(rs.getString("identificacion"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("correo"), rs.getString("contrasena"));
                usu.setRol( rs.getInt("rol"));
                usu.setId_U(rs.getInt("ID_Usuario"));
                usu.setFechaCreacion(rs.getTimestamp("fechaCreacion"));              
                usu.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
                listaUsuarios.add(usu);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo traer la información: " + ex.getMessage());
        }
        return listaUsuarios;
    }



    public static String darNombreUsuario(int id_U) {
        for (Usuario user : listarUsuarios()) {
            if (user.getId_U() == id_U) {
                return user.getNombre();
            }
        }
        return null;
    }



    public static Usuario validarUsuario(String correo, String pass) {
        for (Usuario usuario : listarUsuarios()) {
            if (usuario.getCorreo().equalsIgnoreCase(correo) && usuario.getContrasena().equalsIgnoreCase(pass)) {
                return usuario;
            }
        }
        return null;
    }

    public static String hashPass(String passwordToHash) {
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            // Add password bytes to digest
            md.update(passwordToHash.getBytes());
            // Get the hash's bytes
            byte[] bytes = md.digest();
            // Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            // Get complete hashed password in hex format
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            System.out.println("error en contraseñaHash: "+e);
        }
        return generatedPassword;
    }

}
