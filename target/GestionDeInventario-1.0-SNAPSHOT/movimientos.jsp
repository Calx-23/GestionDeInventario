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
    <title>Movimientos</title>
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
            max-width: 1000px;
            box-sizing: border-box;
            overflow-x: auto;
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
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
            white-space: nowrap; /* Evita el salto de línea para el contenido largo */
        }
        th {
            background-color: #007BFF;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Movimientos</h1>
        <a href="MovimientoControlador?action=add" class="btn-nuevo">Nuevo</a>
        <table>
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
                    <td style="min-width: 150px;">${item.fecha}</td> <!-- Establece un ancho mínimo para la columna de fecha -->
                    <td>${item.cantidad}</td>
                    <td>${item.tipo_movimiento}</td>
                    <td>${item.producto}</td>
                    <td style="min-width: 150px;">${item.usuario}</td> <!-- Establece un ancho mínimo para la columna de usuario -->
                    <td><a class="btn" href="MovimientoControlador?action=edit&id=${item.id}">Editar</a></td>
                    <td><a class="btn" href="MovimientoControlador?action=delete&id=${item.id}" onclick="return confirm('¿Está seguro?')">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
        <a href="principal.jsp" class="btn-volver">Volver</a>
    </div>
</body>
</html>
