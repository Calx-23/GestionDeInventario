package com.emergentes.dao;

import com.emergentes.modelo.Inventario;
import java.util.List;

public interface InventarioDAO {
    public void insert(Inventario inventario) throws Exception;
    public void delete(int id) throws Exception;
    public Inventario getById(int id) throws Exception;
    public List<Inventario> getAll() throws Exception;
}
