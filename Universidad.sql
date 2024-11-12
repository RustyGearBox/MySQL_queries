USE universidad;
-- 1. 
SELECT apellido1, apellido2, nombre 
FROM persona 
WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;

-- 2.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3. 
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 4.
SELECT nombre, apellido1, apellido2
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
WHERE telefono IS NULL AND nif LIKE '%K';

-- 5.
SELECT nombre 
FROM asignatura 
WHERE curso = 3 AND semestre = 1 AND id_grado = 7;

-- 6.
SELECT apellido1, apellido2, nombre, d.nombre AS departamento 
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor 
JOIN departamento d ON pr.id_departamento = d.id 
ORDER BY apellido1, apellido2, nombre;

-- 7.
SELECT a.nombre AS asignatura, ma.anio_inicio, ma.anio_fin 
FROM asignatura a 
JOIN matricula ma ON a.id = ma.id_asignatura 
JOIN persona p ON ma.id_alumno = p.id 
WHERE p.nif = '26902806M';

-- 8.
SELECT DISTINCT d.nombre 
FROM departamento d 
JOIN profesor pr ON d.id = pr.id_departamento 
JOIN asignatura a ON pr.id_profesor = a.id_profesor 
JOIN grado g ON a.id_grado = g.id 
WHERE g.nombre = 'Grau en Enginyeria Informàtica' AND g.plan = 2015;

-- 9.
SELECT DISTINCT nombre, apellido1, apellido2 
FROM persona p 
JOIN matricula m ON p.id = m.id_alumno 
WHERE tipo = 'alumno' AND m.anio_inicio = 2018;

-- 10.
SELECT d.nombre AS departamento, apellido1, apellido2, p.nombre 
FROM departamento d 
LEFT JOIN profesor pr ON d.id = pr.id_departamento 
LEFT JOIN persona p ON pr.id_profesor = p.id 
WHERE p.tipo = 'profesor' 
ORDER BY d.nombre, apellido1, apellido2, p.nombre;

-- 11.
SELECT apellido1, apellido2, nombre 
FROM persona p 
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL;

-- 12.
SELECT nombre 
FROM departamento d 
LEFT JOIN profesor pr ON d.id = pr.id_departamento 
WHERE pr.id_profesor IS NULL;

-- 13.
SELECT nombre 
FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento 
WHERE pr.id_profesor IS NULL;

-- 14.
SELECT nombre 
FROM asignatura a 
LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor 
WHERE pr.id_profesor IS NULL;

-- 15.
SELECT nombre 
FROM departamento d 
LEFT JOIN asignatura a ON d.id = a.id_departamento 
WHERE a.id IS NULL;

-- 16.
SELECT COUNT(*) AS total_students 
FROM persona 
WHERE tipo = 'alumno';

-- 17.
SELECT COUNT(*) AS students_born_1999 
FROM persona 
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 18.
SELECT d.nombre AS departamento, COUNT(pr.id_profesor) AS total_profesores 
FROM departamento d 
JOIN profesor pr ON d.id = pr.id_departamento 
GROUP BY d.nombre ORDER BY total_profesores DESC;

-- 19.
SELECT d.nombre AS departamento, COUNT(pr.id_profesor) AS total_profesores 
FROM departamento d 
LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre;

-- 20.
SELECT g.nombre AS grado, COUNT(a.id) AS total_asignaturas 
FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado 
GROUP BY g.nombre ORDER BY total_asignaturas DESC;
