<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>Formulario de movimientos</title>
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
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>
