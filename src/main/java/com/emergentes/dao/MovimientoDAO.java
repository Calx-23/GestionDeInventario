package com.emergentes.dao;

import com.emergentes.modelo.Movimiento;
import java.util.List;

public interface MovimientoDAO {
    public void insert(Movimiento movimiento) throws Exception;
    public void update(Movimiento movimiento) throws Exception;
    public void delete(int id) throws Exception;
    public Movimiento getById(int id) throws Exception;
    public List<Movimiento> getAll() throws Exception;
}
