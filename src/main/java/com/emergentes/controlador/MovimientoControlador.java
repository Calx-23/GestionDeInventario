package com.emergentes.controlador;

import com.emergentes.dao.MovimientoDAO;
import com.emergentes.dao.MovimientoDAOimpl;
import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Movimiento;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MovimientoControlador", urlPatterns = {"/MovimientoControlador"})
public class MovimientoControlador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            MovimientoDAO dao = new MovimientoDAOimpl();
            ProductoDAO daoProducto = new ProductoDAOimpl();
            UsuarioDAO daoUsuario = new UsuarioDAOimpl();
            int id;
            List<Producto> lista_productos = null;
            List<Usuario> lista_usuarios = null;
            Movimiento movimiento = new Movimiento();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch(action){
                case "add":
                    lista_productos = daoProducto.getAll();
                    lista_usuarios = daoUsuario.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("lista_usuarios", lista_usuarios);
                    request.setAttribute("movimiento", movimiento);
                    request.getRequestDispatcher("frmmovimiento.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    movimiento = dao.getById(id);
                    lista_productos = daoProducto.getAll();
                    lista_usuarios = daoUsuario.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("lista_usuarios", lista_usuarios);
                    request.setAttribute("movimiento", movimiento);
                    request.getRequestDispatcher("frmmovimiento.jsp").forward(request, response);
                    break;
                case "delete":
                    id =Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("MovimientoControlador");
                    break;
                case "view":
                    List<Movimiento> lista = dao.getAll();
                    request.setAttribute("movimientos", lista);
                    request.getRequestDispatcher("movimientos.jsp").forward(request, response);
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
        String tipo_movimiento = request.getParameter("tipo_movimiento");
        int producto_id = Integer.parseInt(request.getParameter("producto_id"));
        int usuario_id = Integer.parseInt(request.getParameter("usuario_id"));
        
        
        Movimiento mov = new Movimiento();
        mov.setId(id);
        mov.setFecha(fecha);
        mov.setCantidad(cantidad);
        mov.setTipo_movimiento(tipo_movimiento);
        mov.setProducto_id(producto_id);
        mov.setUsuario_id(usuario_id);
        
        if (id==0) {
            MovimientoDAO dao = new MovimientoDAOimpl();
            try {
                dao.insert(mov); 
                response.sendRedirect("MovimientoControlador");
            } catch (Exception ex) {
                System.out.println("Error "+ex.getMessage());
            }
               
        } else {
            try {
                MovimientoDAO dao = new MovimientoDAOimpl();
                dao.update(mov);
                response.sendRedirect("MovimientoControlador");
            } catch (Exception ex) {
                System.out.println("Error "+ex.getMessage());
            }
        }

    }
    
}
