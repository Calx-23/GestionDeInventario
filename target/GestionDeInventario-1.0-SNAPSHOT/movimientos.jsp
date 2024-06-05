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
        <title>Movimientos</title>
    </head>
    <body>
        <div class="container">
            <h1>Movimientos</h1>
            <br>
            <a href="MovimientoControlador?action=add" class="button"> Nuevo </a>
            <br><br>
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Cantidad</th>
                    <th>Tipo de movimiento</th>
                    <th>Producto</th>
                    <th>Usuario</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${movimientos}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.fecha}</td>
                        <td>${item.cantidad}</td>
                        <td>${item.tipo_movimiento}</td>
                        <td>${item.producto}</td>
                        <td>${item.usuario}</td>
                        <td><a href="MovimientoControlador?action=edit&id=${item.id}">Editar</td>
                        <td><a href="MovimientoControlador?action=delete&id=${item.id}" onclick="return(confirm('Esta seguro?'))">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
