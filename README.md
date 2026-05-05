# Clinic Database

Repositorio de documentación de la base de datos del sistema de clínica.

Este repositorio contiene la estructura SQL, el diccionario de datos y la explicación general de las tablas usadas por el backend.

## Tecnologías

- PostgreSQL
- Liquibase
- Spring Boot
- Render PostgreSQL

## Tablas principales

- patients
- doctors
- appointments

## Relaciones

- Un paciente puede tener muchas citas médicas.
- Un doctor puede atender muchas citas médicas.
- Una cita médica pertenece a un paciente y a un doctor.

## Archivos del repositorio

| Archivo | Descripción |
|---|---|
| schema.sql | Script SQL con la estructura de la base de datos |
| diccionario-datos.md | Explicación de tablas, campos y relaciones |
| README.md | Documentación principal del repositorio |

## Nota importante

La creación real de las tablas en el backend se realiza con Liquibase desde el proyecto `clinic-back-end`.

Este repositorio sirve como documentación de la base de datos y como referencia para entender su estructura.
