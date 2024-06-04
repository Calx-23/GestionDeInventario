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
            <h1>Productos</h1>
            <br>
            <a href="ProductoControlador?action=add" class="btn btn-primary btn-sm"><i class="fa-solid fa-square-plus"></i> Nuevo </a>
            <br><br>
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${productos}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.nombre}</td>
                        <td>${item.descripcion}</td>
                        <td><a href="ProductoControlador?action=edit&id=${item.id}">Editar</a></td>
                        <td><a href="ProductoControlador?action=delete&id=${item.id}" onclick="return(confirm('Esta seguro?'))">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
