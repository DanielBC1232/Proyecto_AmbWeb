create DATABASE proyectoSQL;
use proyectoSQL;

create table usuario
(
    id_usuario INT AUTO_INCREMENT NOT NULL, 
    nombre VARCHAR(50) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    tipo_suscripcion VARCHAR(50) NOT NULL,
    rol VARCHAR(15) NOT NULL, --
    password VARCHAR(255),
    PRIMARY KEY(id_usuario)
);

create table detalles_usuario
(
    id_detalle INT AUTO_INCREMENT NOT NULL, 
    fecha_nacimiento DATE,
    altura_persona FLOAT(10),
    peso_persona FLOAT(10),
    lesiones VARCHAR(50),
    medicamentos VARCHAR(100),
    embarazo VARCHAR(50),
    cirugia VARCHAR(200),
    objetivos TEXT,
    id_usuario int(3) NOT NULL,
    PRIMARY KEY(id_detalle),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario)
);

-- Crear la tabla "rutinas"         --una rutina puede tener varios ejercicios y un usuario puede tener varias rutinas
CREATE TABLE IF NOT EXISTS rutina (
    id_rutina INT AUTO_INCREMENT NOT NULL,
    nombre_rutina VARCHAR(50) NOT NULL,
    dia_rutina VARCHAR(30) NOT NULL,
    id_usuario int(3),
    PRIMARY KEY(id_rutina),
    foreign key(id_usuario) references usuario(id_usuario)
);

--crea tabla ejercicio               --muchos ejercicios pertenecen a una rutina
CREATE TABLE IF NOT EXISTS ejercicio (
    id_ejercicio INT AUTO_INCREMENT,
    nombre_ejercicio VARCHAR(100) NOT NULL,
    setsE VARCHAR(30) NOT NULL,
    maquina VARCHAR(50) NOT NULL,
    observaciones TEXT,
    id_rutina int(3),
    PRIMARY KEY(id_ejercicio),
    foreign key(id_rutina) references rutina(id_rutina) 
);


-- Crear la tabla checkIn (fotos de progreso mensual)
CREATE TABLE IF NOT EXISTS check_in (
    id_check INT AUTO_INCREMENT NOT NULL,
    mes VARCHAR(50) NOT NULL,
    anno DATE NOT NULL,
    nota_mensual TEXT NOT NULL,
    id_usuario int(3),
    PRIMARY KEY(id_check),
    foreign key(id_usuario) references usuario(id_usuario) 
);

-- Crear la tabla fotos (foto vinculado a un mes especifico) --varias fotos se guardan en un check-in (mes y año especifico)
CREATE TABLE IF NOT EXISTS fotos (
    id_foto INT AUTO_INCREMENT NOT NULL,
    ruta_foto VARCHAR (200),                                 
    id_check int(3),
    PRIMARY KEY(id_foto),
    foreign key(id_check) references check_in(id_check) 
);
