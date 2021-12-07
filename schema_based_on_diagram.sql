CREATE DATABASE clinic;

CREATE TABLE patients (
  id SERIAL PRIMARY KEY ,
  name VARCHAR(50),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  patient_id INT,
  admitted_at TIMESTAMP,
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(100),
  name VARCHAR(100)
);

CREATE TABLE treatments_histories (
  medical_history_id INT,
  treatment_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);