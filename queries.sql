-- ============ INNER JOIN ============

-- Consulta 1: inscripciones con estudiante, curso y porcentaje
SELECT students.name, courses.title, enrollments.completion_percentage
FROM enrollments
INNER JOIN students ON enrollments.student_id = students.id
INNER JOIN courses ON enrollments.course_id = courses.id;

-- Consulta 2: estudiantes que han aprobado al menos un curso
SELECT students.name, students.email, courses.title
FROM enrollments
INNER JOIN students ON enrollments.student_id = students.id
INNER JOIN courses ON enrollments.course_id = courses.id
WHERE enrollments.passed = true;

-- Consulta 3: porcentaje de completado medio por instructor
SELECT courses.instructor_name, AVG(enrollments.completion_percentage)
FROM enrollments
INNER JOIN courses ON enrollments.course_id = courses.id
GROUP BY courses.instructor_name
ORDER BY AVG(enrollments.completion_percentage) DESC;

-- ============ LEFT JOIN ============

-- Consulta 4: estudiantes sin ninguna inscripción
SELECT students.name, students.email
FROM students
LEFT JOIN enrollments ON students.id = enrollments.student_id
WHERE enrollments.id IS NULL;

-- Consulta 5: cursos sin ninguna inscripción
SELECT courses.title, courses.category
FROM courses
LEFT JOIN enrollments ON courses.id = enrollments.course_id
WHERE enrollments.id IS NULL;

-- ============ AGREGACIÓN ============

-- Consulta 6: estudiantes inscritos en más de un curso
SELECT students.name, COUNT(enrollments.id) AS total_cursos
FROM students
INNER JOIN enrollments ON students.id = enrollments.student_id
GROUP BY students.name
HAVING COUNT(enrollments.id) > 1;

-- Consulta 7: ingresos totales por categoría (precio actual del curso)
SELECT courses.category, SUM(courses.monthly_fee) AS ingresos_totales
FROM enrollments
INNER JOIN courses ON enrollments.course_id = courses.id
GROUP BY courses.category
ORDER BY ingresos_totales DESC;

-- Consulta 8: estudiantes inscritos por instructor
SELECT courses.instructor_name, COUNT(DISTINCT enrollments.student_id) AS total_estudiantes
FROM courses
LEFT JOIN enrollments ON courses.id = enrollments.course_id
GROUP BY courses.instructor_name
ORDER BY total_estudiantes DESC;

-- ============ INTEGRIDAD DE DATOS ============

-- Consulta 9: inscripciones con student_id huérfano
SELECT enrollments.id, enrollments.student_id
FROM enrollments
LEFT JOIN students ON enrollments.student_id = students.id
WHERE students.id IS NULL;

-- Consulta 10: inscripciones con course_id huérfano
SELECT enrollments.id, enrollments.course_id
FROM enrollments
LEFT JOIN courses ON enrollments.course_id = courses.id
WHERE courses.id IS NULL;
