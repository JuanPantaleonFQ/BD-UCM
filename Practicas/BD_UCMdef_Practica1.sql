CREATE TABLE personas(
    DNI VARCHAR2(9) PRIMARY KEY,
    nombre VARCHAR2(20) NOT NULL
    
);

CREATE TABLE arbitros(
    numTemp int NOT NULL,
    DNI VARCHAR2(9) REFERENCES PERSONAS(DNI)
        
);

CREATE TABLE entrenadores(
    DNI VARCHAR2(9) REFERENCES PERSONAS(DNI)
);

CREATE TABLE jugadores(
    DNI VARCHAR2(9) REFERENCES PERSONAS(DNI),
    dorsal int NOT NULL,
    ficha int NOT NULL,
    demarcaciones VARCHAR2(20) NOT NULL,
    nifEquipo VARCHAR2(20) NOT NULL
);

CREATE TABLE equipos(
    nif VARCHAR2(9) PRIMARY KEY,
    nombreEquipo VARCHAR(20) NOT NULL,
    presupuesto int NOT NULL,
    dniEntrenador VARCHAR2(9) REFERENCES ENTRENADORES(DNI)
    
);

CREATE TABLE partidos(
    jornada int NOT NULL,
    estadio VARCHAR2(20) NOT NULL,
    diaYhora datetime NOT NULL,
    dniArbitro VARCHAR2(9) REFERENCES arbitros(DNI),
    nifVisitante VARCHAR2(9) REFERENCES equipos(DNI),
    nifLocal VARCHAR2(9) REFERENCES equipos(DNI)

);

CREATE TABLE actas(
    idacta int NOT NULL,
    dniArbitro VARCHAR2(9) REFERENCES arbitros(DNI),
    jornada int REFERENCES partidos(jornada,estadio),
    estadio int REFERENCES partidos(jornada,estadio)

);

CREATE TABLE incidencias(
    idActa  
    minuto int PRIMARY KEY,
    tipo VARCHAR2(20),
    explicacion VARCHAR(200)
    
);

CREATE TABLE ArbSecundario(
    dniArb
    jornada
    estadio
    
);

CREATE TABLE IntervienenSanciones(
    dnijugador
    idActaSancion
    minuto

);





