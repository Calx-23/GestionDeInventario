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
    <title>Página Principal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin: 10px 0;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .btn-cerrar {
            display: inline-block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
            font-size: 16px;
        }
        .btn-cerrar:hover {
            text-decoration: underline;
        }
        form {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Página Principal</h1>
        <form action="InventarioControlador" method="get">
            <input type="hidden" name="action" value="view">
            <button type="submit" class="button">Inventario</button>
        </form>
        <form action="ProductoControlador" method="get">
            <input type="hidden" name="action" value="view">
            <button type="submit" class="button">Productos</button>
        </form>
        <form action="MovimientoControlador" method="get">
            <input type="hidden" name="action" value="view">
            <button type="submit" class="button">Registro de Movimientos</button>
        </form>
        <form action="configuracion.jsp" method="post">
            <button type="submit" class="button">Configuración de Usuario</button>
        </form>
        <a href="Logout" class="btn-cerrar">Cerrar sesión</a>
    </div>
</body>
</html>

