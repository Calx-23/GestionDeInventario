<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }
            form {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
            }
            .form-floating {
                margin-bottom: 15px;
            }
            .form-control {
                width: calc(100% - 22px);
                padding: 10px;
                margin-top: 5px;
            }
            button {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                color: white;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <form action="Login" method="post">
            <h1>Inicio de sesión</h1>
            <div class="form-floating">
                <label for="floatingInput">Nombre de usuario:</label>
                <input type="text" name="nombres" class="form-control" id="floatingInput" placeholder="Nombre">
            </div>
            <div class="form-floating">
                <label for="floatingPassword">Password:</label>
                <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
            </div>
            <button class="btn btn-primary w-100 py-2" type="submit">Ingresar</button>
        </form>
    </body>
</html>
