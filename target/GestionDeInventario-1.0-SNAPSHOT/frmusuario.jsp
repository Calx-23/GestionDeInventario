<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Formulario de usuarios</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }
            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border-radius: 4px;
                border: 1px solid #ccc;
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
        <div class="container">
            <h1>Formulario de usuarios</h1>
            <form action="UsuarioControlador" method="post">
                <input type="hidden" name="id" value="${usuario.id}">
                <div class="form-group">
                    <label for="nombres">Nombres</label>
                    <input type="text" id="nombres" class="form-control" name="nombres" value="${usuario.nombres}" placeholder="Escriba su nombre">
                </div>
                <div class="form-group">
                    <label for="apellidos">Apellidos</label>
                    <input type="text" id="apellidos" class="form-control" name="apellidos" value="${usuario.apellidos}" placeholder="Escriba su apellido">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" class="form-control" name="password" value="${usuario.password}">
                </div>
                <button type="submit" class="btn-enviar">Enviar</button>
                <a href="configuracion.jsp" class="btn-volver">Volver</a>
            </form>
        </div>
    </body>
</html>

