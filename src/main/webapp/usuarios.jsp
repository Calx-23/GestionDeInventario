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
    <title>Usuarios</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .btn {
            padding: 8px 16px;
            margin: 4px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            text-align: center;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .btn-enviar,
        .btn-volver {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        .btn-enviar {
            background-color: #28a745;
            margin-right: 10px;
        }

        .btn-volver {
            background-color: #dc3545;
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
        <th></th>
        <th></th>
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
<button type="submit" class="btn-enviar">Enviar</button>
<a href="configuracion.jsp" class="btn-volver">Volver</a>
</body>
</html>

