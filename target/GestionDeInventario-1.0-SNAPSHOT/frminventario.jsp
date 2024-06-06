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
    <title>Formulario de inventarios</title>
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
            max-width: 600px;
            box-sizing: border-box;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
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
            font-size: 14px;
            border: none;
            transition: background-color 0.3s ease;
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
        <h1>Formulario de inventarios</h1>
        <form action="InventarioControlador" method="post">
            <input type="hidden" name="id" value="${inventario.id}">
            <div class="form-group">
                <label for="fecha" class="form-label">Fecha</label>
                <input type="date" id="fecha" class="form-control" name="fecha" value="${inventario.fecha}">
            </div>
            <div class="form-group">
                <label for="cantidad" class="form-label">Cantidad</label>
                <input type="text" id="cantidad" class="form-control" name="cantidad" value="${inventario.cantidad}">
            </div>
            <div class="form-group">
                <label for="producto" class="form-label">Producto</label>
                <select id="producto" name="producto_id" class="form-control">
                    <option value="">-- Seleccione --</option>
                    <c:forEach var="item" items="${lista_productos}">
                        <option value="${item.id}"
                                data-descripcion="${item.descripcion}"
                                <c:if test="${inventario.producto_id==item.id}">
                                    selected
                                </c:if>
                        >${item.nombre}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="descripcion" class="form-label">Descripción</label>
                <input type="text" id="descripcion" class="form-control" readonly>
            </div>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('#producto').change(function () {
                        var descripcion = $('#producto option:selected').data('descripcion');
                        $('#descripcion').val(descripcion);
                    });
                    $('#producto').change(); // Trigger change event on page load
                });
            </script>
            <button type="submit" class="btn-enviar">Enviar</button>
            <a href="InventarioControlador" class="btn-volver">Volver</a>
        </form>
    </div>
</body>
</html>

