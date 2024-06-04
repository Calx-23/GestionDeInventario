package com.emergentes.controlador;

import com.emergentes.dao.InventarioDAO;
import com.emergentes.dao.InventarioDAOimpl;
import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Inventario;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "InventarioControlador", urlPatterns = {"/InventarioControlador"})
public class InventarioControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            InventarioDAO dao = new InventarioDAOimpl();
            ProductoDAO daoProducto = new ProductoDAOimpl();
            int id;
            List<Producto> lista_productos = null;
            Inventario inventario = new Inventario();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch(action){
                case "add":
                    lista_productos = daoProducto.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("inventario", inventario);
                    request.getRequestDispatcher("frminventario.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    inventario = dao.getById(id);
                    lista_productos = daoProducto.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("inventario", inventario);
                    request.getRequestDispatcher("frminventario.jsp").forward(request, response);
                    break;
                case "delete":
                    id =Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("InventarioControlador");
                    break;
                case "view":
                    List<Inventario> lista = dao.getAll();
                    request.setAttribute("inventarios", lista);
                    request.getRequestDispatcher("inventarios.jsp").forward(request, response);
                default:
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error "+ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fechaStr = request.getParameter("fecha");
        Date fecha = Date.valueOf(fechaStr);
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int producto_id = Integer.parseInt(request.getParameter("producto_id"));
        
        
        Inventario mov = new Inventario();
        mov.setId(id);
        mov.setFecha(fecha);
        mov.setCantidad(cantidad);
        mov.setProducto_id(producto_id);
        
        if (id==0) {
            InventarioDAO dao = new InventarioDAOimpl();
            try {
                dao.insert(mov); 
                response.sendRedirect("InventarioControlador");
            } catch (Exception ex) {
                System.out.println("Error "+ex.getMessage());
            }
               
        }

    }
    
}
