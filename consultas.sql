/*Inciso 4*/
SELECT
    CONCAT(first_name,' ',last_name) as Nombre,
    age AS Edad
FROM Trainee
INNER JOIN sena.Register R on Trainee.id = R.id_trainee
INNER JOIN sena.Route R2 on R.id_route = R2.id
LEFT JOIN sena.Career C on R2.id_career = C.id
WHERE C.name = "Electrónica" AND R.state="Activo";

/*Inciso 5*/
SELECT
    CONCAT(first_name,' ',last_name) as Nombre,
    C.name as Carrera
FROM Trainee
INNER JOIN sena.Register R on Trainee.id = R.id_trainee
INNER JOIN sena.Route R2 on R.id_route = R2.id
LEFT JOIN sena.Career C on R2.id_career = C.id
WHERE R.state="Cancelado";

/*Inciso 6*/
SELECT
    name as Curso
FROM Course
LEFT JOIN sena.CourseTrainer CT ON Course.id = CT.id_course
WHERE CT.id_trainer IS NULL;

/*Inciso 7*/
SELECT DISTINCT
    T.name as Instructor
FROM Trainer T
INNER JOIN sena.CourseTrainer CT on T.id = CT.id_trainer
INNER JOIN sena.CourseRoute CR on CT.id_course = CR.id_course
INNER JOIN sena.Route R on CR.id_route = R.id
WHERE R.name = "Sistemas de Información Empresariales";

/*Inciso 8*/
SELECT
    CONCAT(first_name, ' ', last_name) as Profesional,
    C.name as Carrera,
    R.name as Enfasis
FROM Trainee T
INNER JOIN sena.Register Re on T.id = Re.id_trainee
INNER JOIN sena.Route R on Re.id_route = R.id
INNER JOIN sena.Career C on R.id_career = C.id
WHERE Re.state = "Terminado";

/*Inciso 9*/
SELECT
    CONCAT(first_name, ' ', last_name) AS Nombre
FROM Trainee
INNER JOIN sena.GroupTrainee GT on Trainee.id = GT.id_trainee
INNER JOIN sena.CourseTrainer CT on GT.id_group = CT.id
INNER JOIN sena.Course C on CT.id_course = C.id
WHERE C.name = "Bases de Datos Relacionales";

/*Inciso 10*/
SELECT
    T.name as Instructor
FROM Trainer T
LEFT JOIN sena.CourseTrainer CT on T.id = CT.id_trainer
WHERE CT.id_course IS NULL;
