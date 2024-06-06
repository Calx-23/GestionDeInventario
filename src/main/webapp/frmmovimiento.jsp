<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formulario de movimientos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
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
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        .btn-enviar, .btn-volver {
            display: inline-block;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
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
        <h1>Formulario de movimientos</h1>
        <br>
        <form action="MovimientoControlador" method="post">
            <input type="hidden" name="id" value="${movimiento.id}">
            <div class="mb-3">
                <label for="" class="form-label">Fecha</label>
                <input type="date" class="form-control" name="fecha" value="${movimiento.fecha}">
            </div>
            <div class="mb-3">
                <label for="" class="form-label">Cantidad</label>
                <input type="text" class="form-control" name="cantidad" value="${movimiento.cantidad}">
            </div>
            <div class="mb-3">
                <label for="" class="form-label">Tipo de movimiento</label>
                <input type="text" class="form-control" name="tipo_movimiento" value="${movimiento.tipo_movimiento}">
            </div>
            <div class="mb-3">
                <label for="" class="form-label">Producto</label>
                <select name="producto_id" class="form-control">
                    <option value="">-- Seleccione --</option>
                    <c:forEach var="item" items="${lista_productos}">
                        <option value="${item.id}"
                                <c:if test="${movimiento.producto_id==item.id}">
                                    selected
                                </c:if>
                                >${item.nombre}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="" class="form-label">Usuario</label>
                <select name="usuario_id" class="form-control">
                    <option value="">-- Seleccione --</option>
                    <c:forEach var="item" items="${lista_usuarios}">
                        <option value="${item.id}" 
                                <c:if test="${movimiento.usuario_id==item.id}">
                                    selected
                                </c:if>
                                >${item.nombres}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn-enviar">Enviar</button>
            <a href="MovimientoControlador" class="btn-volver">Volver</a>
        </form>
    </div>
</body>
</html>
