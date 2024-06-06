<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Usuarios</title>
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
            width: 100%;
            max-width: 500px;
            box-sizing: border-box;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .btn-enviar, .btn-volver {
            display: inline-block;
            padding: 10px 15px;
            margin: 10px 5px 0 0;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            text-align: center;
            cursor: pointer;
            border: none;
            font-size: 16px;
        }
        .btn-enviar:hover, .btn-volver:hover {
            background-color: #0056b3;
        }
        .btn-volver {
            background-color: #6c757d;
        }
        .btn-volver:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Formulario de Usuarios</h1>
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


