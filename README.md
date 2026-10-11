# Auditor-a-de-Datos-en-EduTrack-Tablas-Relacionadas-INES

# Auditoría de datos en EduTrack

Este es mi proyecto del curso sobre bases de datos relacionales.

## De qué va

EduTrack tenía sus datos en una sola tabla y ahora están separados en tres:
estudiantes (`students`), cursos (`courses`) e inscripciones (`enrollments`).
Mi trabajo ha sido responder preguntas de la responsable de operaciones
usando consultas SQL en Supabase.

## Qué hay en el repositorio

- `diagram.png`: el diagrama con las tres tablas y cómo se relacionan.
- `queries.sql`: las 10 consultas que he hecho.
- `analysis_report.md`: el informe con los resultados de cada consulta.

## Qué he aprendido

- A usar INNER JOIN y LEFT JOIN para unir tablas.
- A usar GROUP BY y HAVING para contar y filtrar resultados agrupados.
- A comprobar que no hay datos huérfanos en la base de datos.
- Que leer los mensajes de error ayuda mucho a encontrar el fallo.

## Lo que más me costó a mi

Al principio me costó entender cómo se unían las tablas y cuándo usar
LEFT JOIN en vez de INNER JOIN. Poco a poco, haciendo las consultas
una a una, se fue entendiendo mejor.
