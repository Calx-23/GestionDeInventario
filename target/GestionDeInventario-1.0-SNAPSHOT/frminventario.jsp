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
        <title>Formulario de inventarios</title>
    </head>
    <body>
        <div class="container">
            <h1>Formulario de inventarios</h1>
            <br>
            <form action="InventarioControlador" method="post">
                <input type="hidden" name="id" value="${inventario.id}">
                <div class="mb-3">
                    <label for="" class="form-label">Fecha</label>
                    <input type="date" class="form-control" name="fecha" value="${inventario.fecha}">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Cantidad</label>
                    <input type="text" class="form-control" name="cantidad" value="${inventario.cantidad}">
                </div>
                <div class="mb-3">
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
                <div class="mb-3">
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
                        $('#producto').change();
                    });
                </script>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>
