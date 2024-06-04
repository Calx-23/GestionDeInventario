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
        <title>Inventarios</title>
    </head>
    <body>
        <div class="container">
            <h1>Inventarios</h1>
            <br>
            <a href="InventarioControlador?action=add" class="button"> Nuevo </a>
            <br><br>
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Cantidad</th>
                    <th>Producto</th>
                    <th>Descripcion</th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${inventarios}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.fecha}</td>
                        <td>${item.cantidad}</td>
                        <td>${item.producto}</td>
                        <td>${item.descripcion}</td>
                        <td><a href="InventarioControlador?action=delete&id=${item.id}" onclick="return(confirm('Esta seguro?'))">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

