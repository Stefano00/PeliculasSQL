DROP TABLE reparto;
DROP TABLE peliculas;

CREATE TABLE peliculas (id INT, nombre_pelicula VARCHAR(100), director VARCHAR(100), año_estreno VARCHAR(100), PRIMARY KEY (id));
CREATE TABLE reparto (id_reparto INT, actor VARCHAR(100), FOREIGN KEY (id_reparto) REFERENCES peliculas(id));

SELECT * FROM peliculas;
SELECT * FROM reparto;

SELECT peliculas.nombre_pelicula, peliculas.año_estreno, peliculas.director, reparto.actor FROM peliculas JOIN reparto ON peliculas.id = reparto.id_reparto WHERE peliculas.nombre_pelicula='Titanic';
SELECT peliculas.nombre_pelicula, reparto.actor FROM peliculas JOIN reparto ON peliculas.id = reparto.id_reparto WHERE reparto.actor='Harrison Ford';
--Ordenar
SELECT director, COUNT(*) FROM peliculas GROUP BY director  ORDER BY COUNT(*) DESC ;
--Ordenar tabla  de la tabla
SELECT * FROM (SELECT director, COUNT(*) FROM peliculas GROUP BY director  ORDER BY COUNT(*) DESC)  WHERE ROWNUM <= 10;
--Actores distintos
SELECT DISTINCT actor FROM reparto;
--Dos maneras de contar
SELECT COUNT (DISTINCT actor) FROM reparto;
SELECT COUNT (*) FROM (SELECT DISTINCT actor FROM reparto);
-- Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente.
SELECT * FROM peliculas WHERE "AÑO_ESTRENO">=1990 AND "AÑO_ESTRENO"<=1999  ORDER BY nombre_pelicula ASC;
-- Listar el reparto de las películas lanzadas el año 2001 .
SELECT * FROM reparto JOIN peliculas ON peliculas.id = reparto.id_reparto WHERE "AÑO_ESTRENO"=2001;
-- Listar los actores de la película más nueva.
SELECT nombre_pelicula, ("AÑO_ESTRENO") FROM peliculas ORDER BY año_estreno DESC;
SELECT * FROM (SELECT id, nombre_pelicula, ("AÑO_ESTRENO") FROM peliculas ORDER BY año_estreno DESC) WHERE ROWNUM = 1;
SELECT x.nombre_pelicula, x."AÑO_ESTRENO", reparto.actor FROM (SELECT * FROM (SELECT id, nombre_pelicula, ("AÑO_ESTRENO") FROM peliculas ORDER BY año_estreno DESC) WHERE ROWNUM = 1) x JOIN reparto ON x.id = reparto.id_reparto; 
