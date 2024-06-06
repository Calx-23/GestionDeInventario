<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
            box-sizing: border-box;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .btn-nuevo, .btn-volver, .btn {
            display: inline-block;
            padding: 10px 15px;
            margin: 5px 0;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            text-align: center;
            cursor: pointer;
            font-size: 14px;
            border: none;
            transition: background-color 0.3s ease;
        }
        .btn-nuevo:hover, .btn-volver:hover, .btn:hover {
            background-color: #0056b3;
        }
        .btn-volver {
            background-color: #6c757d;
        }
        .btn-volver:hover {
            background-color: #5a6268;
        }
        table {
            width: 100%;
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Productos</h1>
        <br>
        <a href="ProductoControlador?action=add" class="btn-nuevo">Nuevo</a>
        <br><br>
        <table>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
            <c:forEach var="item" items="${productos}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.descripcion}</td>
                    <td><a class="btn" href="ProductoControlador?action=edit&id=${item.id}">Editar</a></td>
                    <td><a class="btn" href="ProductoControlador?action=delete&id=${item.id}" onclick="return confirm('¿Está seguro?')">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
        <a href="principal.jsp" class="btn-volver">Volver</a>
    </div>
</body>
</html>
