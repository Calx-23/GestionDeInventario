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
    <title>Configuración de Usuario</title>
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
        .button, .btn-enviar {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin: 10px 0;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .button:hover, .btn-enviar:hover {
            background-color: #0056b3;
        }
        .btn-volver {
            display: inline-block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
            font-size: 16px;
        }
        .btn-volver:hover {
            text-decoration: underline;
        }
        form {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Configuración de Usuario</h1>
        <form action="UsuarioControlador" method="get">
            <input type="hidden" name="action" value="view">
            <button type="submit" class="button">Ajuste de Usuario</button>
        </form>
        <form action="UsuarioControlador" method="get">
            <input type="hidden" name="action" value="add">
            <button type="submit" class="btn-enviar">Nuevo</button>
        </form>
        <a href="principal.jsp" class="btn-volver">Volver</a>
    </div>
</body>
</html>


