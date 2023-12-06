# MODELO RELACIONAL

<image src="./project_initial_r.png" alt="modelo relacional inicial">

# MODELO ENTIDAD RELACION

<image src="./project_initial_er.png" alt="modelo entidad relacion incial">

# MODIFICACIONES
**Desde el inciso 1 hasta el inciso 3**

1. Agregue un campo Estado_Matrícula a la tabla Matrícula que indique si el estudiante se encuentra “En Ejecución”, “Terminado” o “Cancelado” .

    Teniendo en cuenta el primer modelo relacional se nota que tuvimos que crear la tabla ***REGISTER***. Y introducirla en nuestra base de datos.

    <image src="./project_regitser_r.png" alt="Modelo relacional con registro">

    ```sql
    // Como primero elminimano la relación que hay entre la tabla ROUTE y la tabla TRAINEE
    ALTER TABLE Trainee DROP fk_trainee_id_route;
    
    // Ahora creamos la tabla que necesitamos con sus respectivas relaciones
    CREATE TABLE IF NOT EXISTS Register (
        id_trainee INT NOT NULL,
        id_route INT NOT NULL,
        state ENUM('Activo', 'Terminado', 'Cancelado'),
        FOREIGN KEY (id_route) REFERENCES ROUTE(id),
        FOREIGN KEY (id_trainee) REFERENCES TRAINEE(id)
    );
    ```

2. Agregue el campo edad a la tabla de Aprendices.

    <image src="./project_age_r.png" alt="Modelo relacional con edad en aprendiz">

    ```sql
    // Agregamos la columna age a la tabla TRAINEE
    ALTER TABLE Trainee ADD COLUMN age INT NOT NULL;
    ```

3. Si suponemos que los cursos tienen una duración diferente dependiendo de la ruta que lo contenga ¿qué modificación haría a la estructura de datos ya planteada?

    <image src="./project_duration_r.png" alt="Modelo relacion con duracion en COURSExROUTE">

    ```sql
    // Agregamos la columna duration a la tabla ROUTE_COURSE
    ALTER TABLE ROUTE_COURSE ADD COLUMN duration INT NOT NULL;
    ```

# CONSULTAS
**Desde el inciso 4 hasta el inciso 10**

4. Seleccionar los nombres y edades de aprendices que están cursando la carrera de electrónica.

    ```sql
    SELECT
        CONCAT(first_name,' ',last_name) as Nombre,
        age AS Edad
    FROM Trainee
    INNER JOIN sena.Register R on Trainee.id = R.id_trainee
    INNER JOIN sena.Route R2 on R.id_route = R2.id
    LEFT JOIN sena.Career C on R2.id_career = C.id
    WHERE C.name = "Electrónica" AND R.state="Activo";
    ```

5. Seleccionar Nombres de Aprendices junto al nombre de la ruta de aprendizaje que cancelaron.

    ```sql
    SELECT
        CONCAT(first_name,' ',last_name) as Nombre,
        C.name as Carrera
    FROM Trainee
    INNER JOIN sena.Register R on Trainee.id = R.id_trainee
    INNER JOIN sena.Route R2 on R.id_route = R2.id
    LEFT JOIN sena.Career C on R2.id_career = C.id
    WHERE R.state="Cancelado";
    ```

6. Seleccionar Nombre de los cursos que no tienen un instructor asignado.

    ```sql
    SELECT
        name as Curso
    FROM Course
    LEFT JOIN sena.CourseTrainer CT ON Course.id = CT.id_course
    WHERE CT.id_trainer IS NULL;
    ```

7. Seleccionar Nombres de los instructores que dictan cursos en la ruta de aprendizaje “Sistemas de Información Empresariales”.

    ```sql
    SELECT DISTINCT 
        T.name as Instructor
    FROM Trainer T
    INNER JOIN sena.CourseTrainer CT on T.id = CT.id_trainer
    INNER JOIN sena.CourseRoute CR on CT.id_course = CR.id_course
    INNER JOIN sena.Route R on CR.id_route = R.id
    WHERE R.name = "Sistemas de Información Empresariales";

    ```

8. Genere un listado de todos los aprendices que terminaron una Carrera mostrando el nombre del profesional, el nombre de la carrera y el énfasis de la carrera (Nombre de la Ruta de aprendizaje)

    ```sql
    SELECT
        CONCAT(first_name, ' ', last_name) as Profesional,
        C.name as Carrera,
        R.name as Enfasis
    FROM Trainee T
    INNER JOIN sena.Register Re on T.id = Re.id_trainee
    INNER JOIN sena.Route R on Re.id_route = R.id
    INNER JOIN sena.Career C on R.id_career = C.id
    WHERE Re.state = "Terminado";
    ```

9. Genere un listado de los aprendices matriculados en el curso “Bases de Datos Relacionales”.

    ```sql
    SELECT
        CONCAT(first_name, ' ', last_name) AS Nombre
    FROM Trainee
    INNER JOIN sena.GroupTrainee GT on Trainee.id = GT.id_trainee
    INNER JOIN sena.CourseTrainer CT on GT.id_group = CT.id
    INNER JOIN sena.Course C on CT.id_course = C.id
    WHERE C.name = "Bases de Datos Relacionales";
    ```

10. Nombres de Instructores que no tienen curso asignado.

    ```sql
    SELECT
        T.name as Instructor
    FROM Trainer T
    LEFT JOIN sena.CourseTrainer CT on T.id = CT.id_trainer
    WHERE CT.id_course IS NULL;
    ```

# EXTRA

Para un mejor manejo de los datos en la siguiente imagen se verá el diseño final del modelo relacional de nuestra base de datos, en el cual se observara una ***VIEW*** creada para una mejor visualización de los datos y una tabla mas la cual es ***CourseTrainer*** en la cual se relacionan **cursos** e **instructores** ya que un **instructor** puede dicatar varios **cursos**.

Tambien al llegar a la consulta 9 se presento otro inconveniente con el modelo construido para esta base de datos, para la solución de este inconveniente se creo una nueva tabla y para restringir la insercion de ciertos datos que despues de ciertas pruebas generaban inconsitencias con los resultados que se querian.


## VIEW

Esta vista me permite ver todos los datos como el informe general de matricula

    ```sql
    CREATE OR REPLACE VIEW general_information_cursos_ruta AS
    SELECT
        R.state AS Estado,
        CONCAT(A.first_name, ' ', A.last_name) as Nombre,
        C2.name AS Carrera,
        R2.name AS Ruta,
        C.name AS Curso,
        T.name AS Instructor
    FROM Trainee A
    INNER JOIN sena.GroupTrainee GT on A.id = GT.id_trainee
    JOIN sena.CourseTrainer CT on CT.id = GT.id_group
    JOIN sena.Course C on C.id = CT.id_course
    JOIN sena.Trainer T on CT.id_trainer = T.id
    JOIN sena.Register R on A.id = R.id_trainee
    JOIN sena.Route R2 on R2.id = R.id_route
    JOIN sena.Career C2 on C2.id = R2.id_career
    ORDER BY A.id, C.id;
    ```

## FUNCTIONS

Se crearon dos funciones para una optimizacion en consultas la primera me valida si el curso a ingresar no se enncuentra ya dentro de mi tabla y la segunda valida que el curso a ingresar si corresponda a la rura del estudiante al que se le esta asignando

1. ```sql
    CREATE FUNCTION validate_course_trainee (id_group varchar(5), id_trainee int)
    RETURNS BOOLEAN DETERMINISTIC
    BEGIN
    RETURN (id_group IN (SELECT GT.id_group
                            FROM GroupTrainee GT
                            WHERE GT.id_trainee=id_trainee);
    END;
    ```

2. ```sql
    CREATE FUNCTION validate_course_route (id_group varchar(5), id_trainee int)
    RETURNS BOOLEAN DETERMINISTIC
    BEGIN
    SET @route_trainee = (SELECT R.id FROM Route R
                            INNER JOIN sena.Register R2 on R.id = R2.id_route
                            WHERE R2.id_trainee = id_trainee);

    RETURN (@route_trainee IN (SELECT R.id FROM Route R
                        INNER JOIN sena.CourseRoute CR on R.id = CR.id_route
                            INNER JOIN sena.CourseTrainer CT on CR.id_course = CT.id_course
                            WHERE CT.id = id_group));
    END;
    ```

## TRIGGERS

Los trigger me permitieron en esta ocasión hacer las respectivas validaciones antes y despues de los insert.

1. ```sql
    CREATE TRIGGER validate_course_for_trainee
    BEFORE INSERT ON GroupTrainee
    FOR EACH ROW
    BEGIN

        SET @group = NEW.id_group;
        SET @trainee = NEW.id_trainee;

        IF validate_course_trainee(@group, @trainee) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT  = "El curso ya fue asignado al estudiante";
        end if;

    end;
    ```

2. ```sql
    CREATE TRIGGER validate_course_for_trainee
    AFTER INSERT ON GroupTrainee
    FOR EACH ROW
    BEGIN

        SET @group = NEW.id_group;
        SET @trainee = NEW.id_trainee;

        IF NOT validate_course_route(@group, @trainee) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT  = "El curso no pertenece a la ruta del estudiante";
        end if;

    end;
    ```

## MODELO RELACIONAL

<image src="./sena.png" alt="Modelo relacional final">

# BANCO DE PREGUNTAS

La respuesta se vera marcada con negrilla y cursiva la opción que sea correcta.

1. ¿Cúal de las siguientes cláusulas se utiliza para filtrar filas en una consulta SQL?

    A. GROUP BY

    B. ORDER BY
    
    ***C. WHERE***
    
    D. HAVING
2. En SQL, ¿cúal es la función de la sentencia JOIN?
    
    A. Agregar nuevos datos a una tabla existente
    
    ***B. Combinar filas de dos o más tablas basadas en una condición***
    
    C. Eliminar datos de una tabla
    
    D. Actualizar registros en una tabla
3. ¿Qué comando se utiliza para agregar una nueva columna a una tabla existente en SQL?

    A. INSERT COLUMN
    
    B. MODIFY TABLE
    
    ***C. ADD COLUMN***
    
    D. UPDATE
4. En SQL, ¿cuál es el propósito de la cláusula GROUP BY?

    A. Ordenar los resultados de las consulta
    
    B. Filtrar filas basabas en el valor de una o más columnas
    
    **C. Agrupar filas basadas en el valor de una o más columnas**
    
    D. Limitar el número de filas devueltas por la consulta