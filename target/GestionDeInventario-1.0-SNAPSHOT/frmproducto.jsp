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
    <title>Productos</title>
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
        .mb-3 {
            margin-bottom: 15px;
        }
        .form-label {
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
        <h1>Formulario de Productos</h1>
        <br>
        <form action="ProductoControlador" method="post">
            <input type="hidden" name="id" value="${producto.id}">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" id="nombre" class="form-control" name="nombre" value="${producto.nombre}" placeholder="Escriba el nombre del producto">
            </div>
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <input type="text" id="descripcion" class="form-control" name="descripcion" value="${producto.descripcion}" placeholder="Escriba una descripción">
            </div>
            <button type="submit" class="btn-enviar">Enviar</button>
            <a href="ProductoControlador" class="btn-volver">Volver</a>
        </form>
    </div>
</body>
</html>

