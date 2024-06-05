package com.emergentes.dao;

import com.emergentes.modelo.Movimiento;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MovimientoDAOimpl extends ConexionDB implements MovimientoDAO {

    @Override
    public void insert(Movimiento movimiento) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO movimientos_inventario(fecha, cantidad, tipo_movimiento, producto_id, usuario_id) VALUES(?,?,?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setDate(1, movimiento.getFecha());
            ps.setInt(2, movimiento.getCantidad());
            ps.setString(3, movimiento.getTipo_movimiento());
            ps.setInt(4, movimiento.getProducto_id());
            ps.setInt(5, movimiento.getUsuario_id());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Movimiento movimiento) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE movimientos_inventario SET fecha=?, cantidad=?, tipo_movimiento=?, producto_id=?, usuario_id=? WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setDate(1, movimiento.getFecha());
            ps.setInt(2, movimiento.getCantidad());
            ps.setString(3, movimiento.getTipo_movimiento());
            ps.setInt(4, movimiento.getProducto_id());
            ps.setInt(5, movimiento.getUsuario_id());
            ps.setInt(6, movimiento.getId());
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
            String sql = "DELETE FROM movimientos_inventario WHERE id = ?";
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
    public Movimiento getById(int id) throws Exception {
        Movimiento m = new Movimiento();
        try {
            this.conectar();
            String sql = "SELECT * FROM movimientos_inventario WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                m.setId(rs.getInt("id"));
                m.setFecha(rs.getDate("fecha"));
                m.setCantidad(rs.getInt("cantidad"));
                m.setTipo_movimiento(rs.getString("tipo_movimiento"));
                m.setProducto_id(rs.getInt("producto_id"));
                m.setUsuario_id(rs.getInt("usuario_id"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return m;
    }

    @Override
    public List<Movimiento> getAll() throws Exception {
        List<Movimiento> lista = null;
        try {
            this.conectar();
            String sql = "SELECT m.*, p.nombre AS producto, ";
            sql += "CONCAT(u.nombres, ' ', u.apellidos) AS usuario ";
            sql += "FROM movimientos_inventario AS m ";
            sql += "LEFT JOIN productos AS p ON m.producto_id = p.id ";
            sql += "LEFT JOIN usuarios AS u ON m.usuario_id = u.id";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Movimiento>();
            while (rs.next()) {
                Movimiento m = new Movimiento();
                m.setId(rs.getInt("id"));
                m.setFecha(rs.getDate("fecha"));
                m.setCantidad(rs.getInt("cantidad"));
                m.setTipo_movimiento(rs.getString("tipo_movimiento"));
                m.setProducto_id(rs.getInt("producto_id"));
                m.setUsuario_id(rs.getInt("usuario_id"));
                m.setProducto(rs.getString("producto"));
                m.setUsuario(rs.getString("usuario"));
                lista.add(m);
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
