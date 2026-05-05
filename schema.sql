-- =====================================================
-- Clinic Database Schema
-- PostgreSQL
-- =====================================================

-- Tabla de pacientes
CREATE TABLE patients (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    document_number VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(30) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Tabla de doctores
CREATE TABLE doctors (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(30) NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Tabla de citas médicas
CREATE TABLE appointments (
    id BIGSERIAL PRIMARY KEY,
    appointment_date TIMESTAMP NOT NULL,
    reason VARCHAR(255) NOT NULL,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,

    CONSTRAINT fk_appointments_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(id),

    CONSTRAINT fk_appointments_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors(id)
);

-- =====================================================
-- Consultas útiles
-- =====================================================

-- Consultar pacientes
SELECT * FROM patients;

-- Consultar doctores
SELECT * FROM doctors;

-- Consultar citas
SELECT * FROM appointments;

-- Consultar citas con paciente y doctor
SELECT
    a.id,
    a.appointment_date,
    a.reason,
    a.diagnosis,
    a.treatment,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialty
FROM appointments a
INNER JOIN patients p ON a.patient_id = p.id
INNER JOIN doctors d ON a.doctor_id = d.id;
