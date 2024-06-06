<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            max-width: 800px;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn, .btn-volver {
            display: inline-block;
            padding: 8px 12px;
            margin: 5px;
            border-radius: 4px;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            text-align: center;
            cursor: pointer;
        }
        .btn:hover, .btn-volver:hover {
            background-color: #0056b3;
        }
        .btn-volver {
            background-color: #6c757d;
            text-align: center;
        }
        .btn-volver:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <h1>Usuarios</h1>
    <table>
        <tr>
            <th>Id</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Editar</th>
            <th>Eliminar</th>
        </tr>
        <c:forEach var="item" items="${usuarios}">
            <tr>
                <td>${item.id}</td>
                <td>${item.nombres}</td>
                <td>${item.apellidos}</td>
                <td><a class="btn" href="UsuarioControlador?action=edit&id=${item.id}">Editar</a></td>
                <td><a class="btn" href="UsuarioControlador?action=delete&id=${item.id}" onclick="return confirm('¿Está seguro?')">Eliminar</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="configuracion.jsp" class="btn-volver">Volver</a>
</body>
</html>
