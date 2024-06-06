-- Creación de las tablas
CREATE TABLE productos
(
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE usuarios
(
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE movimientos_inventario
(
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    cantidad INT(11) NOT NULL,
    tipo_movimiento VARCHAR(20) NOT NULL,
    producto_id INT(11) NOT NULL,
    usuario_id INT(11) NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE inventario
(
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    cantidad INT(11) NOT NULL,
    producto_id INT(11) NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Creación del TRIGGER
DELIMITER //
CREATE TRIGGER actualizar_inventario_after_insert AFTER INSERT ON movimientos_inventario
FOR EACH ROW
BEGIN
    IF NEW.tipo_movimiento = 'Entrada' THEN
        UPDATE inventario
        SET cantidad = cantidad + NEW.cantidad,
            fecha = NEW.fecha
        WHERE producto_id = NEW.producto_id;
    ELSEIF NEW.tipo_movimiento = 'Salida' THEN
        UPDATE inventario
        SET cantidad = cantidad - NEW.cantidad,
            fecha = NEW.fecha
        WHERE producto_id = NEW.producto_id;
    END IF;
END;
//
DELIMITER ;

-- Llenar la tabla de productos
INSERT INTO productos (nombre, descripcion) VALUES 
('Camiseta de algodon', 'Camiseta basica de algodon en varios colores'),
('Pantalones vaqueros', 'Pantalones vaqueros clasicos de corte recto'),
('Zapatillas deportivas', 'Zapatillas deportivas para correr con tecnologia de amortiguacion'),
('Telefono inteligente', 'Telefono inteligente con pantalla tactil y camara de alta resolucion'),
('Portatil', 'Ordenador portatil ligero con procesador de ultima generacion'),
('Gafas de sol', 'Gafas de sol polarizadas con montura de acetato'),
('Bolso de cuero', 'Bolso de cuero genuino con multiples compartimentos'),
('Reloj de pulsera', 'Reloj de pulsera analogico con correa de acero inoxidable'),
('Auriculares inalambricos', 'Auriculares inalambricos con cancelacion de ruido'),
('Tableta', 'Tableta con pantalla tactil de alta resolucion y capacidad de almacenamiento ampliable');

-- Llenar la tabla de usuarios
INSERT INTO usuarios (nombres, apellidos, password) VALUES
('Admin', 'Istrador', SHA1('123456')),
('Claudio', 'Apaza', SHA1('Apaza23'));

-- Llenar la tabla de inventario
INSERT INTO inventario (fecha, cantidad, producto_id) VALUES 
('2024-06-05', 100, 1),
('2024-06-05', 80, 2),
('2024-06-05', 120, 3),
('2024-06-05', 150, 4),
('2024-06-05', 60, 5),
('2024-06-05', 90, 6),
('2024-06-05', 70, 7),
('2024-06-05', 100, 8),
('2024-06-05', 110, 9),
('2024-06-05', 130, 10);

-- Insertar algunos movimientos de entrada y salida
INSERT INTO movimientos_inventario (fecha, cantidad, tipo_movimiento, producto_id, usuario_id) VALUES 
('2024-06-05', 50, 'Entrada', 1, 1),
('2024-06-05', 20, 'Salida', 2, 1),
('2024-06-05', 30, 'Entrada', 3, 2),
('2024-06-05', 25, 'Salida', 4, 2),
('2024-06-05', 10, 'Entrada', 5, 1),
('2024-06-05', 15, 'Salida', 6, 1);















