# Informe de análisis: EduTrack (esquema normalizado)

## 1. Diagrama E/R

El diagrama está en `diagram.png`. El esquema tiene tres tablas:

- `students` (PK `id`)
- `courses` (PK `id`)
- `enrollments` (PK `id`, FK `student_id` → `students.id`, FK `course_id` → `courses.id`)

Relaciones: `students` 1:N `enrollments` y `courses` 1:N `enrollments`. Entre `students` y `courses` hay una relación N:M, que se resuelve con `enrollments` como tabla puente.

## 2. Consultas INNER JOIN

### Consulta 1: inscripciones con estudiante, curso y porcentaje de completado

| name | title | completion_percentage |
|---|---|---|
| Emily Watson | Intro to Python | 85 |
| Emily Watson | Web Design Basics | 60 |
| Klaus Weber | Intro to Python | 92 |
| Klaus Weber | Data Analysis with SQL | 78 |
| Lucia Fernandes | Web Design Basics | 5 |
| Lucia Fernandes | Digital Marketing 101 | 3 |
| Marco Rossi | Advanced Python | 95 |
| Marco Rossi | Intro to Python | 88 |
| Yuki Nakamura | Data Analysis with SQL | 45 |
| Yuki Nakamura | UI/UX Fundamentals | 0 |
| Pierre Dubois | UI/UX Fundamentals | 0 |
| Priya Sharma | Digital Marketing 101 | 70 |
| Priya Sharma | Intro to Python | 55 |
| Pierre Dubois | Data Analysis with SQL | 20 |
| Emily Watson | Advanced Python | 40 |
| Lucia Fernandes | Advanced Python | 0 |


### Consulta 2: estudiantes que han aprobado al menos un curso

| name | email | title |
|---|---|---|
| Emily Watson | emily.watson@student.edutrack.com | Intro to Python |
| Klaus Weber | klaus.weber@student.edutrack.com | Intro to Python |
| Klaus Weber | klaus.weber@student.edutrack.com | Data Analysis with SQL |
| Marco Rossi | marco.rossi@student.edutrack.com | Advanced Python |
| Marco Rossi | marco.rossi@student.edutrack.com | Intro to Python |
| Priya Sharma | priya.sharma@student.edutrack.com | Digital Marketing 101 |

### Consulta 3: porcentaje de completado medio por instructor

| instructor_name | media |
|---|---|
| Marta López | 66.14 |
| Carlos Vega | 40.00 |
| Lucia Prades | 36.50 |
| Pending assignment | 0.00 |

Nota: "Pending assignment" corresponde a cursos sin instructor asignado.

## 3. Consultas LEFT JOIN (datos faltantes)

### Consulta 4: estudiantes sin ninguna inscripción

| name | email |
|---|---|
| Giulia Romano | giulia.romano@student.edutrack.com |

### Consulta 5: cursos sin ninguna inscripción

| title | category |
|---|---|
| Email Campaigns | Marketing |

## 4. Consultas de agregación

### Consulta 6: estudiantes inscritos en más de un curso

| name | total_cursos |
|---|---|
| Pierre Dubois | 2 |
| Marco Rossi | 2 |
| Priya Sharma | 2 |
| Yuki Nakamura | 2 |
| Lucia Fernandes | 3 |
| Emily Watson | 3 |
| Klaus Weber | 2 |

### Consulta 7: ingresos totales por categoría (con `courses.monthly_fee`)

| category | ingresos_totales |
|---|---|
| Programming | 409.93 |
| Data | 179.97 |
| Design | 169.96 |
| Marketing | 59.98 |

La categoría que más ingresa es Programming.

### Consulta 8: estudiantes inscritos por instructor

| instructor_name | total_estudiantes |
|---|---|
| Marta López | 6 |
| Carlos Vega | 3 |
| Lucia Prades | 2 |
| Pending assignment | 2 |

## 5. Integridad de datos

### Consulta 9: inscripciones con `student_id` huérfano

0 filas. No hay inscripciones vinculadas a estudiantes inexistentes.

### Consulta 10: inscripciones con `course_id` huérfano

0 filas. No hay inscripciones vinculadas a cursos inexistentes.

## 6. Conclusiones

- Hay 1 estudiante registrado que nunca se ha inscrito a un curso (Giulia Romano).
- Hay 1 curso sin inscripciones (Email Campaigns), candidato a archivarse.
- 7 de los 8 estudiantes están inscritos en más de un curso.
- Marta López es la instructora con mejor porcentaje medio de completado (66.14).
- Hay cursos sin instructor asignado ("Pending assignment").
- Programming es la categoría que genera más ingresos con el precio actual de los cursos.
- La integridad referencial es correcta: no hay registros huérfanos.
