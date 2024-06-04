<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
    </head>
    <body>
        <div class="container">
            <h1>Formulario de productos</h1>
            <br>
            <form action="ProductoControlador" method="post">
                <input type="hidden" name="id" value="${producto.id}">
                <div class="mb-3">
                    <label for="" class="form-label">Nombre</label>
                    <input type="text" class="form-control" name="nombre" value="${producto.nombre}" placeholder="Escriba el nombre del producto">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Descripción</label>
                    <input type="text" class="form-control" name="descripcion" value="${producto.descripcion}" placeholder="Escriba una descripción">
                </div>
                <button type="submit">Enviar</button>
            </form>
        </div>
    </body>
</html>
