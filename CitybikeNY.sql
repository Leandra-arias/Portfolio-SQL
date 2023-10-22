-- VISUALIZAMOS toda nuestra tabla con los datos importados
SELECT * FROM citybikes;

-- BORRADO DE DATOS INCOLCLUSOS, NULOS O VALORE CERO
DELETE FROM citybikes
WHERE age=0 AND season='Season';

-- VISUALIZAMOS NOMBRE DE ESTACIONES DE PARTIDA Y LLEGADA 
SELECT start_station_name, end_station_name FROM citybikes;

-- CONTEO DE LOS DIAS DE LA SEMANA DONDE SE USA EL SERVICIO
SELECT weekday, COUNT(*) AS CONTEO_DIAS
FROM citybikes
GROUP BY weekday
ORDER BY CONTEO_DIAS ASC;

-- CONTEO ESTACIONES DONDE EL SERVICIO ES USADO
SELECT season, COUNT(*) AS CONTEO_SEASON
FROM citybikes
GROUP BY season ASC;

-- PROMEDIO DE LA EDADES DE LAS PERSONAS QUE UTILIZAN EL SERVICIO
SELECT AVG(AGE) AS PROMEDIO
FROM citybikes;

-- DURACION MAXIMO DE VIAJE EN HORAS
SELECT MAX(trip_min/60) AS MAX
FROM citybikes;

-- DURACION MINIMA DE VIAJE EN HORAS
SELECT MIN(trip_min/60)
FROM citybikes;

-- PROMEDIO EDADES SEGUN EL TIPO DE USUARIOS
SELECT user_type, AVG(age) AS PROMEDIO_USER
FROM citybikes
GROUP BY user_type;

-- TOP 10 DE LAS ESTACIONES DE COMIENZO MAS POPULARES
SELECT start_station_name, COUNT(Start_station_id) AS TOP_POPULAR
FROM citybikes
GROUP BY start_station_name
ORDER BY TOP_POPULAR DESC
LIMIT 10;

-- TOP 10 DE LAS ESTACIONES DE COMIENZO MENOS POPULARES
SELECT start_station_name, COUNT(Start_station_id) AS MENOS_POPULAR
FROM citybikes
GROUP BY start_station_name
ORDER BY MENOS_POPULAR ASC
LIMIT 10;

-- PORCENTAJE DE TIPOS DE USUARIOS
SELECT user_type, 
(COUNT(*)*100 / (SELECT COUNT(*) FROM citybikes))
FROM citybikes
GROUP BY user_type DESC;

-- PERSONAS > 60 AÑOS QUE UTIlIZAN EL SERVICIO EN INVIERNO
SELECT count(*) as MAYORES60 
FROM citybikes
WHERE age>= 60 AND season='winter';

-- PERSONAS MENORES DE 30 QUE UTILIZAN EL SERVICIO
SELECT COUNT(*) AS MENORES30
FROM citybikes
WHERE age<30 AND season='winter';

-- CONTEO DE PERSONAS SEGUN EDAD Y DIAS DE LA SEMANA QUE UTILIZAN EL SERVICIO
SELECT weekday, age, COUNT(*) AS CANTIDAD_PEOPLE
FROM citybikes
GROUP BY weekday, age DESC;

-- INFORMACION SOBRE ESTACIONES, TIPO DE USUARIO Y EDADES ENTRE EL RANGO DE 31 Y 45 AÑOS
SELECT * FROM citybikes
WHERE age BETWEEN 31 AND 45;

