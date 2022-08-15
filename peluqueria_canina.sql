DROP DATABASE IF EXISTS peluqueria_canina;
CREATE DATABASE peluqueria_canina CHARACTER SET utf8mb4;
USE peluqueria_canina;

CREATE TABLE IF NOT EXISTS dueno (
  dni INT UNSIGNED PRIMARY KEY NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  apellido VARCHAR(25) NOT NULL,
  telefono INT,
  direccion VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS perro (
  id_perro INT UNSIGNED PRIMARY KEY NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  fecha_nac DATE,
  sexo VARCHAR(25),
  dni_dueno INT UNSIGNED NOT NULL,
  FOREIGN KEY (dni_dueno) REFERENCES dueno(dni)
);

CREATE TABLE IF NOT EXISTS historial (
  id_historial INT UNSIGNED PRIMARY KEY NOT NULL,
  fecha DATE,
  descripcion VARCHAR(50),
  monto DOUBLE,
  id_perro INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_perro) REFERENCES perro(id_perro)
);

INSERT INTO dueno VALUES(39732406, 'Ariel', 'Frutos', 1138843939, 'Iclama 5565');
INSERT INTO perro VALUES(1, 'Bobby', '2012-05-22', 'Macho', 39732406);
INSERT INTO historial VALUES(1, '2014-06-30', 'Primeras vacunas', 2500, 1);

#EJERCICIO N°3 - ARIEL FRUTOS
#Borre un animal que ya no va a ser atendido. Para ello consulte antes en el historial, 
#algún animal que ya no sea atendido desde hace mucho tiempo.
SELECT * FROM historial WHERE fecha BETWEEN '2010-01-01' AND '2015-01-01';
SET FOREIGN_KEY_CHECKS=0; 
DELETE FROM perro WHERE id_perro = 1;
SET FOREIGN_KEY_CHECKS=1; 


 



