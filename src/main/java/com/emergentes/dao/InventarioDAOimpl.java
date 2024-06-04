package com.emergentes.dao;

import com.emergentes.modelo.Inventario;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InventarioDAOimpl extends ConexionDB implements InventarioDAO {

    @Override
    public void insert(Inventario inventario) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO inventario (fecha, cantidad, producto_id) VALUES(?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setDate(1, inventario.getFecha());
            ps.setInt(2, inventario.getCantidad());
            ps.setInt(3, inventario.getProducto_id());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            String sql = "DELETE FROM inventario WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Inventario getById(int id) throws Exception {
        Inventario i = new Inventario();
        try {
            this.conectar();
            String sql = "SELECT * FROM inventario WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                i.setId(rs.getInt("id"));
                i.setFecha(rs.getDate("fecha"));
                i.setCantidad(rs.getInt("cantidad"));
                i.setProducto_id(rs.getInt("producto_id"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return i;
    }

    @Override
    public List<Inventario> getAll() throws Exception {
        List<Inventario> lista = null;
        try {
            this.conectar();
            String sql = "SELECT i.*, p.nombre AS producto, ";
            sql += "p.descripcion AS descripcion ";
            sql += "FROM inventario AS i ";
            sql += "LEFT JOIN productos AS p ON i.producto_id = p.id ";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Inventario>();
            while (rs.next()) {
                Inventario i = new Inventario();
                i.setId(rs.getInt("id"));
                i.setFecha(rs.getDate("fecha"));
                i.setCantidad(rs.getInt("cantidad"));
                i.setProducto_id(rs.getInt("producto_id"));
                i.setProducto(rs.getString("producto"));
                i.setDescripcion(rs.getString("descripcion"));
                lista.add(i);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }

}
