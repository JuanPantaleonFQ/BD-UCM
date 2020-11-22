-- Juan Pantaleon Femenia Quevedo Lopez
-- Grupo D Bases de Datos, Prfesor: ALBERTO DE LA ENCINA VARA
-- Curso 2020-2021
--Fecha: 29-10.2020
--Utilizando Oracle SQL:Developer


CREATE TABLE Futbol_Personas(
	dni VARCHAR2(9),
	nombre VARCHAR2(40) NOT NULL,
    CONSTRAINT personas_PK PRIMARY KEY (dni)
);

CREATE TABLE Futbol_Arbitros(
	dni VARCHAR2(9),
	numTemp NUMBER(2) NOT NULL,

    CONSTRAINT arbitros_PK PRIMARY KEY (dni),
    CONSTRAINT arbitros_dni_FK FOREIGN KEY (dni) REFERENCES Futbol_Personas(dni)
        ON DELETE CASCADE
);

CREATE TABLE Futbol_Entrenadores(
	dni VARCHAR2(9),

    CONSTRAINT entrenadores_PK PRIMARY KEY (dni),
    CONSTRAINT entrenador_dni_FK FOREIGN KEY (dni) REFERENCES Futbol_Personas
        ON DELETE CASCADE
);

CREATE TABLE Futbol_Jugadores(
	dni VARCHAR2(9),
	dorsal NUMBER(2) NOT NULL,
	ficha NUMBER(8) NOT NULL,
	demarcacion VARCHAR2(15) NOT NULL,
	nifEquipo VARCHAR2(9) NOT NULL,

    CONSTRAINT jugadores_PK PRIMARY KEY (dni),
    CONSTRAINT jugadores_dni_FK FOREIGN KEY (dni) REFERENCES Futbol_Personas
        ON DELETE CASCADE
);

CREATE TABLE Futbol_Equipos(
	nif VARCHAR2(9),
	nombre VARCHAR2(20) NOT NULL,
	presupuesto VARCHAR2(9) NOT NULL,
	dniEntrenador VARCHAR2(9) NOT NULL,

    CONSTRAINT equipos_PK PRIMARY KEY (nif),
    CONSTRAINT equipos_dniEntrenador_FK FOREIGN KEY (dniEntrenador) REFERENCES Futbol_Entrenadores(dni)
        ON DELETE CASCADE
);

ALTER TABLE Futbol_Jugadores
    ADD CONSTRAINT jugadores_nifEquipo_FK 
        FOREIGN KEY (nifEquipo) 
        REFERENCES Futbol_Equipos(nif)
        ON DELETE CASCADE;

CREATE TABLE Futbol_Partidos(
	jornada NUMBER(2) NOT NULL,
	estadio VARCHAR2(20) NOT NULL,
	fecha DATE NOT NULL,
	nifLocal VARCHAR2(9) NOT NULL, 
	nifVisitante VARCHAR2(9) NOT NULL, 
	dniArbitroPrincipal VARCHAR2(9),
    
	CONSTRAINT partidos_PK PRIMARY KEY (jornada, estadio),
    CONSTRAINT partidos_nifLocal_FK FOREIGN KEY (nifLocal) REFERENCES Futbol_Equipos(nif)
        ON DELETE CASCADE,
    CONSTRAINT partidos_nifVisitante_FK FOREIGN KEY (nifVisitante) REFERENCES Futbol_Equipos(nif)
         ON DELETE CASCADE,
   CONSTRAINT partidos_dniArbPrincipal_FK  FOREIGN KEY (dniArbitroPrincipal) REFERENCES Futbol_Arbitros(dni)
        ON DELETE CASCADE
);

CREATE TABLE Futbol_ArbSecundarios(
	dniArbitro VARCHAR2(9),
	jornada NUMBER(2),
	estadio VARCHAR2(20),
    
	CONSTRAINT arbSecundario_dni_jor_est_PK PRIMARY KEY (dniArbitro, jornada, estadio),
	CONSTRAINT arbSecundario_jor_est_FK FOREIGN KEY (jornada, estadio) REFERENCES Futbol_Partidos(jornada, estadio)
        ON DELETE CASCADE,
    CONSTRAINT arbSecundario_dni_FK FOREIGN KEY (dniArbitro) REFERENCES Futbol_Arbitros(dni)
        ON DELETE CASCADE
);

CREATE TABLE Futbol_Actas(
	idActa NUMBER(4),
	dniArbitro VARCHAR2(9),
	jornada NUMBER(2),
	estadio VARCHAR2(20),
    
	CONSTRAINT actas_PK PRIMARY KEY (idActa),
	CONSTRAINT actas_jornada_estadio_FK  FOREIGN KEY (jornada, estadio) REFERENCES Futbol_Partidos(jornada, estadio)
        ON DELETE CASCADE,
    CONSTRAINT actas_dniArbitro_FK FOREIGN KEY (dniArbitro) REFERENCES Futbol_Arbitros(dni)
        ON DELETE CASCADE
);

CREATE TABLE Futbol_Incidencias(
	idActa NUMBER(4),
	minuto DATE NOT NULL,
	tipo VARCHAR2(20) NOT NULL,
	explicacion VARCHAR2(100),
    
	CONSTRAINT incidencias_PK PRIMARY KEY (idActa, minuto),
    CONSTRAINT indicencias_idActa_FK FOREIGN KEY (idActa) REFERENCES Futbol_Actas(idActa)
        ON DELETE CASCADE
);

CREATE TABLE Futbol_IntervienenSanciones(
	idActa NUMBER(4),
	minuto DATE,
	dniJugador VARCHAR2(9),
	sancion VARCHAR2(8) NOT NULL,
    
	CONSTRAINT intervienenSanciones_PK PRIMARY KEY (idActa, minuto, dniJugador),
    CONSTRAINT sanciones_dniJugador_FK FOREIGN KEY (dniJugador) REFERENCES Futbol_Jugadores(dni),
	CONSTRAINT sanciones_acta_minuto_FK  FOREIGN KEY (idActa, minuto) REFERENCES Futbol_Incidencias(idActa, minuto)
        ON DELETE CASCADE
);

INSERT INTO Futbol_ArbSecundarios (dniArbitro, jornada, estadio)
VALUES ('11111111A','14','Camp Nou');

INSERT INTO Futbol_Personas (dni,nombre)VALUES ('11111111A','David Pérez Pallas');
INSERT INTO futbol_personas(dni,nombre)VALUES('22222222B','Alexandre Alemán Pérez');
INSERT INTO futbol_personas(dni,nombre)VALUES('33333333C',' Moisés Mateo Montañés');
INSERT INTO futbol_personas(dni,nombre)VALUES('44444444D','Adrián Díaz González');
INSERT INTO futbol_personas(dni,nombre)VALUES('55555555E','Juan Manuel López Amaya');
INSERT INTO futbol_personas(dni,nombre)VALUES('66666666F','Iván González González');
INSERT INTO futbol_personas(dni,nombre)VALUES('77777777G','Jorge Figueroa Vázquez');
INSERT INTO futbol_personas(dni,nombre)VALUES('11111110A ','Cristiano Ronaldo');
INSERT INTO futbol_personas(dni,nombre)VALUES('22222221B','Achraf Hakimi');
INSERT INTO futbol_personas(dni,nombre)VALUES('33333332C','Carvajal');
INSERT INTO futbol_personas(dni,nombre)VALUES('44444443D','Piqué');
INSERT INTO futbol_personas(dni,nombre)VALUES('55555554E',' Arda Turan');
INSERT INTO futbol_personas(dni,nombre)VALUES('66666665F','Lucas');
INSERT INTO futbol_personas(dni,nombre)VALUES('77777779G','Moya');
INSERT INTO futbol_personas(dni,nombre)VALUES('01111110A','Zinedine Zidane');
INSERT INTO futbol_personas(dni,nombre)VALUES('02222221B','Luis Enrique Martinez García');
INSERT INTO futbol_personas(dni,nombre)VALUES('03333332C','Diego Simeone');


SELECT DNI ,NOMBRE  FROM Futbol_Personas; 




INSERT INTO futbol_arbitros(dni,numTemp)VALUES('11111111A',10);
INSERT INTO futbol_arbitros(dni,numTemp)VALUES('22222222B','2 ');
INSERT INTO futbol_arbitros(dni,numTemp)VALUES('33333333C','5 ');
INSERT INTO futbol_arbitros(dni,numTemp)VALUES('44444444D','1 ');
INSERT INTO futbol_arbitros(dni,numTemp)VALUES('55555555E',' 23');
INSERT INTO futbol_arbitros(dni,numTemp)VALUES('66666666F','15 ');
INSERT INTO futbol_arbitros(dni,numTemp)VALUES('77777777G','3 ');

SELECT dni,numtemp  FROM futbol_arbitros;


INSERT INTO Futbol_Entrenadores(dni)VALUES('01111110A');
INSERT INTO Futbol_Entrenadores(dni)VALUES('02222221B');
INSERT INTO Futbol_Entrenadores(dni)VALUES('03333332C');

SELECT dni FROM Futbol_Entrenadores;

INSERT INTO futbol_jugadores(dni,dorsal,ficha,demarcacion,nifequipo)VALUES('11111111A',7,32000000,'Delantero','B84030576');
INSERT INTO futbol_jugadores(dni,dorsal,ficha,demarcacion,nifequipo)VALUES('22222221B',19,67600000,'CentroCampista','B84030576');
INSERT INTO futbol_jugadores(dni,dorsal,ficha,demarcacion,nifequipo)VALUES('33333332C',2,40000000,'Defensa','B84030576');

INSERT INTO Futbol_Jugadores(dni,dorsal,ficha,demarcacion,nifequipo)VALUES('55555554E',7,40000000,'CentroCampista','G8266298');
INSERT INTO futbol_jugadores(dni,dorsal,ficha,demarcacion,nifequipo)VALUES('66666665F',19,10000000,'Defensa','A80373764');
INSERT INTO futbol_jugadores(dni,dorsal,ficha,demarcacion,nifequipo)VALUES('77777779G',1,35000000,'Portero','A80373764');
INSERT INTO futbol_jugadores(dni,dorsal,ficha,demarcacion,nifequipo)VALUES('44444443D',3,5800000,'Defensa','G8266298');


SELECT dni,dorsal,demarcacion,nifequipo FROM Futbol_Jugadores;

INSERT INTO Futbol_Equipos(nif,nombre,presupuesto,dniEntrenador)VALUES('B84030576','Real Madrid C.F.','453,000','01111110A');
INSERT INTO Futbol_Equipos(nif,nombre,presupuesto,dniEntrenador)VALUES('G8266298','F.C. Barcelona','157,000','02222221B');
INSERT INTO Futbol_Equipos(nif,nombre,presupuesto,dniEntrenador)VALUES('A80373764','Atlético de Madrid','140,000','03333332C');


SELECT nif,nombre,presupuesto,dniEntrenador FROM Futbol_Equipos ;


