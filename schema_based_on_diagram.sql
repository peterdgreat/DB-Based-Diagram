CREATE TABLE patients(
    id SERIAL PRIMARY KEY ,
    name VARCHAR(50),
    date_of_birth DATE,
);

CREATE TABLE medical_histories(
    id SERIAL PRIMARY KEY,
    patient_id INT,
    admitted_at TIMESTAMP,
    CONSTRAINT patient_id_fk FOREIGN KEY (patient_id) REFERENCES patients(id)
);