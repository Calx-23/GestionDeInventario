package com.emergentes.controlador;

import com.emergentes.utiles.Validate;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombres = request.getParameter("nombres");
        String password = request.getParameter("password");

        Validate v = new Validate();

        if (v.checkUser(nombres, password)) {
            HttpSession ses = request.getSession();
            ses.setAttribute("login","OK");
            response.sendRedirect("principal.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

}
