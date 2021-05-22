/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class ProductoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Producto p = new Producto();

    public List Listar() {
        List<Producto> list = new ArrayList<>();
        String sql = "SELECT * FROM productos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("Descripcion"));
                p.setPrecio(rs.getDouble("precio"));
                p.setTalla(rs.getString("talla"));
                p.setCategoria(rs.getString("categoria"));
                p.setCatidad(rs.getInt("cantidad"));
                p.setColor(rs.getString("color"));
                p.setImagen(rs.getBinaryStream("imagen"));
                list.add(p);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return list;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "SELECT * FROM productos WHERE id =" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                inputStream = rs.getBinaryStream("imagen");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
            e.getMessage();
        }
    }

    public void Agregar(Producto p) {
        String sql = "INSERT INTO productos (nombre, Descripcion, precio, talla, categoria, cantidad, color, imagen) VALUES(?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, p.getNombre());
            ps.setString(2, p.getDescripcion());
            ps.setDouble(3, p.getPrecio());
            ps.setString(4, p.getTalla());
            ps.setString(5, p.getCategoria());
            ps.setInt(6, p.getCatidad());
            ps.setString(7, p.getColor());
            ps.setBlob(8, p.getImagen());

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Producto list(int id) {
        String sql = "SELECT * FROM productos WHERE id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("Descripcion"));
                p.setPrecio(rs.getDouble("precio"));
                p.setTalla(rs.getString("talla"));
                p.setCategoria(rs.getString("categoria"));
                p.setCatidad(rs.getInt("cantidad"));
                p.setColor(rs.getString("color"));
                p.setImagen(rs.getBinaryStream("imagen"));

            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return p;
    }

    public boolean editSinImg(Producto p) {

        String sql = "UPDATE productos SET nombre = ?, Descripcion = ?, precio = ?, talla= ?, categoria = ?, cantidad = ?, color = ?, imagen = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, p.getNombre());
            ps.setString(2, p.getDescripcion());
            ps.setDouble(3, p.getPrecio());
            ps.setString(4, p.getTalla());
            ps.setString(5, p.getCategoria());
            ps.setInt(6, p.getCatidad());
            ps.setString(7, p.getColor());
            ps.setBlob(8, p.getImagen());
            ps.setInt(9, p.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;

    }
    
    public boolean eliminar(int id){
        String sql="DELETE FROM productos WHERE id="+id;
        try {
            con= cn.getConnection();
            ps= con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return false;
    }
}
