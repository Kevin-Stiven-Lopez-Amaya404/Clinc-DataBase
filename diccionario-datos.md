# Diccionario de Datos

## Tabla: patients

Tabla encargada de almacenar la información de los pacientes registrados en la clínica.

| Campo | Tipo | Restricciones | Descripción |
|---|---|---|---|
| id | BIGSERIAL | PRIMARY KEY | Identificador único del paciente |
| first_name | VARCHAR(100) | NOT NULL | Nombre del paciente |
| last_name | VARCHAR(100) | NOT NULL | Apellido del paciente |
| document_number | VARCHAR(50) | NOT NULL, UNIQUE | Número de documento del paciente |
| phone | VARCHAR(30) | NOT NULL | Teléfono de contacto |
| email | VARCHAR(150) | NOT NULL, UNIQUE | Correo electrónico del paciente |
| created_at | TIMESTAMP | NULL | Fecha de creación del registro |
| updated_at | TIMESTAMP | NULL | Fecha de última actualización |

---

## Tabla: doctors

Tabla encargada de almacenar la información de los doctores disponibles en la clínica.

| Campo | Tipo | Restricciones | Descripción |
|---|---|---|---|
| id | BIGSERIAL | PRIMARY KEY | Identificador único del doctor |
| first_name | VARCHAR(100) | NOT NULL | Nombre del doctor |
| last_name | VARCHAR(100) | NOT NULL | Apellido del doctor |
| specialty | VARCHAR(120) | NOT NULL | Especialidad médica del doctor |
| email | VARCHAR(150) | NOT NULL, UNIQUE | Correo electrónico del doctor |
| phone | VARCHAR(30) | NOT NULL | Teléfono de contacto |
| created_at | TIMESTAMP | NULL | Fecha de creación del registro |
| updated_at | TIMESTAMP | NULL | Fecha de última actualización |

---

## Tabla: appointments

Tabla encargada de almacenar las citas médicas o registros clínicos básicos.

| Campo | Tipo | Restricciones | Descripción |
|---|---|---|---|
| id | BIGSERIAL | PRIMARY KEY | Identificador único de la cita |
| appointment_date | TIMESTAMP | NOT NULL | Fecha y hora de la cita médica |
| reason | VARCHAR(255) | NOT NULL | Motivo de la consulta |
| diagnosis | VARCHAR(255) | NULL | Diagnóstico médico |
| treatment | VARCHAR(255) | NULL | Tratamiento recomendado |
| patient_id | BIGINT | NOT NULL, FOREIGN KEY | Paciente asociado a la cita |
| doctor_id | BIGINT | NOT NULL, FOREIGN KEY | Doctor asociado a la cita |
| created_at | TIMESTAMP | NULL | Fecha de creación del registro |
| updated_at | TIMESTAMP | NULL | Fecha de última actualización |

---

# Relaciones

## patients → appointments

Un paciente puede tener muchas citas médicas.

Relación:

patients 1 → N appointments

## doctors → appointments

Un doctor puede atender muchas citas médicas.

Relación:

doctors 1 → N appointments

---

# Resumen del modelo

| Entidad | Descripción |
|---|---|
| patients | Pacientes registrados en la clínica |
| doctors | Doctores disponibles para atender citas |
| appointments | Citas médicas asociadas a pacientes y doctores |
