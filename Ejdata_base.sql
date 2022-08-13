use historial2;


CREATE TABLE IF NOT EXISTS dueno (
    dni int NOT NULL UNIQUE,
    nombre varchar(255),
    apellido varchar(255),
    telefono varchar(20),
    direccion varchar(255),
    PRIMARY KEY (dni)
);

CREATE TABLE IF NOT EXISTS perro (
    id_perro int AUTO_INCREMENT primarY key,
    nombre varchar(25),
    fecha_nac date,
    sexo varchar(25),
    dni_dueno int,
    FOREIGN KEY (dni_dueno) REFERENCES dueno(dni)
);

CREATE TABLE IF NOT EXISTS historial (
    id_historial int AUTO_INCREMENT primary key,
    fecha date,
    descripcion varchar(255),
    monto double,
    id_perro int,
    FOREIGN KEY(id_perro) REFERENCES perro(id_perro)
);

insert into dueno values(123412, "Pablo", "Sierra", 38123412, "Tucuman-Argentina"); 
insert into perro (nombre, fecha_nac, sexo, dni_dueno) values("reyna", "2015-03-12", "Hembra", 123412);
insert into historial (fecha, descripcion, monto, id_perro) values("2022-08-13", "Se rompio la pierna", 1200, 1);

insert into dueno values(123421, "Pedro", "Messi", 38123412, "Tucuman-Argentina");
insert into perro (nombre, fecha_nac, sexo, dni_dueno) values("linda", "2014-03-12", "Hembra", 123421);
insert into historial (fecha, descripcion, monto, id_perro) values("2022-08-15", "Mordida", 1500, 2); 

#EJERCICIO 5
select * 
from dueno, perro 
where dueno.nombre = "Pedro" and dueno.dni = perro.dni_dueno;