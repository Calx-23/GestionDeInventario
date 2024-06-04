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
        <title>Página principal</title>
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
            }
            button:hover {
                background-color: #45a049;
            }
            .btn-cerrar {
                display: inline-block;
                padding: 10px 20px;
                background-color: #ff0000;
                color: #fff;
                text-decoration: none;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn-cerrar:hover {
                background-color: #cc0000;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>Principal</h1>
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
                <button type="submit" class="button">Registro de movimientos</button>
            </form>
            <form action="configuracion.jsp" method="post">
                <button type="submit">Configuración de usuario</button>
            </form>
            <a href="Logout" class="btn-cerrar">Cerrar sesión</a>
        </div>
    </body>
</html>
