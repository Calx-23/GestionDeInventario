package com.emergentes.modelo;

import java.sql.Date;

public class Inventario {

    private int id;
    private Date fecha;
    private int cantidad;
    private int producto_id;
    private String producto;
    private String descripcion;

    public Inventario() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Inventario{" + "id=" + id + ", fecha=" + fecha + ", cantidad=" + cantidad + ", producto_id=" + producto_id + ", producto=" + producto + ", descripcion=" + descripcion + '}';
    }

}
