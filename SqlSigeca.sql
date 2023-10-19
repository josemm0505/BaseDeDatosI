create database SIGECA;
use SIGECA;

create table sexo(
        idsexo int not null primary key  auto_increment,
        nombre varchar (100),
        eliminado tinyint default 0
  );

create table estadocivil(
        idestadocivil int not null primary key  auto_increment,
        nombre varchar (100),
        eliminado tinyint default 0);

create table tiposangre(
        idtiposangre int not null primary key  auto_increment,
        nombre varchar (100),
        eliminado tinyint default 0);

create table repositorio(
        idrepositorio int not null primary key auto_increment,
        nombre varchar (100),
        eliminado tinyint default 0);

create table directorio(
        iddirectorio int not null primary key auto_increment,
        nombre varchar (100),
        idrepositorio int,
        eliminado tinyint default 0,
        foreign key (idrepositorio) references repositorio(idrepositorio));

create table permiso(
        idpermiso int not null primary key  auto_increment,
        nombre varchar (100),
        eliminado tinyint default 0);

create table tipodocumento(
        idtipodocumento int not null primary key auto_increment,
        nombre varchar(100),
        eliminado tinyint default 0);

create table persona(
        idpersona int not null primary key auto_increment,
        nombres varchar (200),
        apellidos varchar (200),
        fechanacimiento varchar (100),
        fechadefuncion varchar (100),
        idsexo int,
        idestadocivil int,
        idtiposangre int,
        eliminado tinyint default 0,
        foreign key (idsexo) references sexo(idsexo),
        foreign key (idestadocivil) references estadocivil(idestadocivil),
        foreign key (idtiposangre) references tiposangre(idtiposangre));

create table documento(
        iddocumento int not null primary key auto_increment,
        nombre varchar (200),
        titulo varchar (200),
        descripcion varchar (300),
        fechacreacion varchar (100),
        iddirectorio int,
        idpermiso int,
        idtipodocumento int,
        eliminado tinyint default 0,
        foreign key (iddirectorio) references directorio(iddirectorio),
        foreign key (idpermiso) references permiso(idpermiso),
        foreign key (idtipodocumento) references tipodocumento(idtipodocumento));

create table propietario(
        idpropietario int not null primary key auto_increment,
        iddocumento int,
        idpersona int,
        eliminado tinyint default 0,
        foreign key (iddocumento) references documento(iddocumento),
        foreign key (idpersona) references persona(idpersona));

create table receptor(
        idreceptor int not null primary key  auto_increment,
        iddocumento int,
        idpersona int,
        eliminado tinyint default 0,
        foreign key (iddocumento) references documento(iddocumento),
        foreign key (idpersona) references persona(idpersona));

create view vista_sexo as select idsexo, nombre where sexo.eliminado=0;
create view vista_estadocivil as select idestadocivil, nombre where estadocivil.eliminado=0;
create view vista_tiposangre as select idtiposangre, nombre where tiposangre.eliminado=0;
create view vista_repositorio as select idrepositorio, nombre where repositorio.eliminado=0;
create view vista_directorio as select iddirectorio, nombre, idrepositorio where directorio.eliminado=0;
create view vista_permiso as select idpermiso, nombre where permiso.eliminado=0;
create view vista_tipodocumento as select idtipodocumento, nombre where tipodocumento.eliminado=0;
create view vista_persona as select persona* where persona.eliminado=0;
create view vista_documento as select documento* where documento.eliminado=0;
create view vista_propietario as select propietario* where propietario.eliminado=0;
create view vista_receptor as select receptor where receptor.eliminado=0;
