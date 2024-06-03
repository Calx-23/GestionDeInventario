<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuración de usuario</title>
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
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 400px;
                width: 100%;
            }

            h1 {
                color: #333333;
            }

            form {
                margin: 10px 0;
            }

            button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
                margin-bottom: 10px;
                display: block;
                width: 100%;
            }

            button:hover {
                background-color: #45a049;
            }

            .btn-enviar,
            .btn-volver {
                padding: 10px 20px;
                font-size: 16px;
                text-decoration: none;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                display: inline-block;
                width: calc(50% - 5px);
            }

            .btn-enviar {
                background-color: #28a745;
                margin-right: 10px;
            }

            .btn-volver {
                background-color: #dc3545;
            }

            .btn-volver {
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Configuración de usuario</h1>
            <form action="UsuarioControlador" method="get">
                <input type="hidden" name="action" value="view">
                <button type="submit" class="button">Ajuste de usuario</button>
            </form>
            <form action="UsuarioControlador" method="get">
                <input type="hidden" name="action" value="add">
                <button type="submit" class="btn-enviar">Nuevo</button>
            </form>
            <a href="principal.jsp" class="btn-volver">Volver</a>
        </div>
    </body>
</html>

