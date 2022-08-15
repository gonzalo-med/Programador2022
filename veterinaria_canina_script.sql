DROP DATABASE IF EXISTS veterinaria_canina;
CREATE DATABASE veterinaria_canina CHARACTER SET utf8mb4;
USE veterinaria_canina;

CREATE TABLE IF NOT EXISTS dueno (
    dni int NOT NULL UNIQUE,
    nombre varchar(25),
    apellido varchar(25),
    telefono varchar(20),
    direccion varchar(50),
    PRIMARY KEY (dni)
);

CREATE TABLE IF NOT EXISTS perro (
    id_perro int AUTO_INCREMENT primary key,
    nombre varchar(25),
    fecha_nac date,
    sexo varchar(25),
    dni_dueno int,
    FOREIGN KEY (dni_dueno) REFERENCES dueno(dni)
);

CREATE TABLE IF NOT EXISTS historial (
    id_historial int AUTO_INCREMENT primary key,
    fecha date,
    descripcion varchar(50),
    monto double,
    id_perro int,
    FOREIGN KEY(id_perro) REFERENCES perro(id_perro)
);

insert into dueno values(12345678, "Enzo", "Perez", 499886, "Argentina 123"); 
insert into perro (nombre, fecha_nac, sexo, dni_dueno) values("homero", "2012-05-29", "Macho", 12345678);
insert into historial (fecha, descripcion, monto, id_perro) values("2022-08-10", "Desparacitacion", 2000, 1);

insert into dueno values(23456718, "Pedro", "Saviola", 455782, "Brasil 710");
insert into perro (nombre, fecha_nac, sexo, dni_dueno) values("irundi", "2016-07-25", "Hembra", 23456718);
insert into historial (fecha, descripcion, monto, id_perro) values("2022-08-11", "Baño y corte", 2500, 2); 

insert into dueno values(34567892, "Sandra", "Rossi", 454821, "Uruguay 321"); 
insert into perro (nombre, fecha_nac, sexo, dni_dueno) values("pity", "2018-12-09", "Macho", 34567892);
insert into historial (fecha, descripcion, monto, id_perro) values("2022-08-12", "Vacunacion", 1500, 3);

insert into dueno values(29852637, "Pedro", "Hansing", 412885, "Chile 560");
insert into perro (nombre, fecha_nac, sexo, dni_dueno) values("aria", "2020-02-10", "Hembra", 29852637);
insert into historial (fecha, descripcion, monto, id_perro) values("2022-08-13", "Baño y corte", 2500, 4); 

#Realice una consulta multitabla que arroje el nombre de todos los perros cuyos dueños se llaman Pedro
select * 
from dueno, perro 
where dueno.nombre = "Pedro" and dueno.dni = perro.dni_dueno;