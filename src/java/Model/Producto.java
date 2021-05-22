/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ASUS
 */
import java.io.*;

public class Producto {

    int id;
    String nombre;
    String Descripcion;
    double precio;
    String talla;
    String categoria;
    int catidad;
    String color;
    InputStream imagen;

    public Producto() {
    }

    public Producto(int id, String nombre, String Descripcion, double precio, String talla, String categoria, int catidad, String color, InputStream imagen) {
        this.id = id;
        this.nombre = nombre;
        this.Descripcion = Descripcion;
        this.precio = precio;
        this.talla = talla;
        this.categoria = categoria;
        this.catidad = catidad;
        this.color = color;
        this.imagen = imagen;
    }
        public Producto(int id, String nombre, String Descripcion, double precio, String talla, String categoria, int catidad, String color) {
        this.id = id;
        this.nombre = nombre;
        this.Descripcion = Descripcion;
        this.precio = precio;
        this.talla = talla;
        this.categoria = categoria;
        this.catidad = catidad;
        this.color = color;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getCatidad() {
        return catidad;
    }

    public void setCatidad(int catidad) {
        this.catidad = catidad;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }

}
