/* -Insertar, Actualizar y Borrar un Contacto*/

/*Insertar un registro, tomando en cuenta que el IdContacto es Auto incrementable*/
INSERT INTO c_contactos (IdContacto, NombreContacto, TelefonoContacto) 
VALUES (''.'Luis Villalobos','8714353747');

INSERT INTO c_eventos (IdEvento, DescripcionEvento, LugarEvento, FechaHoraEvento) 
VALUES (''.'Navidad','Casa', '2021-12-24 11:54:05');

INSERT INTO k_citas (IdCita, IdContacto, IdEvento, NotaCita, EstadoCancelarCita) 
VALUES (''.'1','1', 'Llegar puntual','false');

/*Update basado en el id, si fuera nombre solo se cambia WHERE NombreContacto = 'nombre_a_editar'*/

UPDATE c_contactos
SET NombreContacto = 'Alfred Schmidt', TelefonoContacto= '123456789'
WHERE IdContacto = 1;

UPDATE c_eventos
SET DescripcionEvento = 'Noche buena', LugarEvento= 'casa abues', FechaHoraEvento = '2021-12-24 11:54:05'
WHERE IdEvento = 1;

UPDATE k_citas
SET IdContacto = '@id_contacto', IdEvento = '@id_evento' NotaCita= 'llevar cena', EstadoCancelarCita = 'false'
WHERE IdEvento = 1;

/*DELETE basado en id, si fuera nombre solo se cambia WHERE NombreContacto = 'nombre_a_eliminar' y asi para cada atributo por el cual eliminar*/

DELETE FROM c_contactos WHERE IdContacto = 1;

DELETE FROM c_eventos WHERE IdEvento = 1;

DELETE FROM k_citas WHERE IdCita = 1;

/* Consultar todas las citas que se den en México. */

SELECT * FROM k_citas WHERE LugarEvento = 'México'

/*Consultar todas citas de personas llamadas Luis*/

SELECT k_citas.idCita
FROM k_citas
INNER JOIN c_contactos ON k_citas.IdContacto = c_contactos.IdContacto
WHERE c_contactos.NombreContacto = 'Luis'

/*-Consultar todas las citas de ayer.*/
SELECT k_citas.IdCita, c_eventos.FechaHoraEvento
FROM k_citas
INNER JOIN c_eventos ON k_citas.IdEvento=c_eventos.IdEvento
WHERE c_eventos.FechaHoraEvento = DATEADD(day,-1,'17-11-2021'); /*En lugar de la fecha especifica (3 parámetro) podemos pasar también la fecha del día de hoy automatica con NOW() o utilizando GETDATE()*/

/*-Consultar todas las citas que tengan alguna Nota.*/

SELECT * FROM k_citas
WHERE NotaCita IS NOT NULL;

/*-Borrar las citas de mañana.*/
DELETE FROM k_citas
INNER JOIN c_eventos ON k_citas.IdEvento=c_eventos.IdEvento
WHERE c_eventos.FechaHoraEvento = DATEADD(day,1,'17-11-2021'); /*En lugar de la fecha especifica (3 parámetro) podemos pasar también la fecha del día de hoy automatica con NOW() o utilizando GETDATE()*/

/*-Cancelar todas las citas de "Rosario Robles".*/
DELETE FROM k_citas
INNER JOIN c_contactos ON k_citas.IdContacto=c_contactos.IdContacto
WHERE c_contactos.NombreContacto="Rosario Robles"