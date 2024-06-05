package com.emergentes.modelo;

import java.sql.Date;

public class Movimiento {

    private int id;
    private Date fecha;
    private int cantidad;
    private String tipo_movimiento;
    private int producto_id;
    private int usuario_id;
    private String producto;
    private String usuario;

    public Movimiento() {
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

    public String getTipo_movimiento() {
        return tipo_movimiento;
    }

    public void setTipo_movimiento(String tipo_movimiento) {
        this.tipo_movimiento = tipo_movimiento;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    @Override
    public String toString() {
        return "Movimiento{" + "id=" + id + ", fecha=" + fecha + ", cantidad=" + cantidad + ", tipo_movimiento=" + tipo_movimiento + ", producto_id=" + producto_id + ", usuario_id=" + usuario_id + ", producto=" + producto + ", usuario=" + usuario + '}';
    }
    
}
