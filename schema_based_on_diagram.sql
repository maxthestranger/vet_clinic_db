/*the first table  for patients*/

CREATE TABLE patients (
  id INT PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  date_of_birth DATE NOT NULL,
);
/*the second table  for history*/
CREATE TABLE medical_history (
  id INT PRIMARY KEY NOT NULL,
  admitted_at TIMESTAMP,
  status VARCHAR,
  patient_id INT,
  CONSTRAINT fk_patients 
     FOREIGN KEY (patient_id)
     REFERENCES patients(id)
);
/*the third table  for ttreatments*/
CREATE TABLE treatments (
  id INT PRIMARY KEY NOT NULL,
  type VARCHAR (255),
  name VARCHAR(255),
);
/*the forth table  invoice-items*/
CREATE TABLE invoice_items (
  id INT PRIMARY KEY NOT NULL,
  unit_price NEMERIC,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  CONSTRAINT fk_invoice_id 
     FOREIGN KEY (invoice_id)
     REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices (id)
);
/*the fith table  for Invoices*/
CREATE TABLE invoices (
  id INT PRIMARY KEY NOT NULL,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT fk_medical_history 
     FOREIGN KEY (medical_history_id)
     REFERENCES medical_history(id)
);

/* creating a many to many relationship between treatment and medical_history */
CREATE TABLE medical_treatment(
    medical_id INT,
    treatment_id INT,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_id)
    REFERENCES medical_histories(id),
    CONSTRAINT fk_medical_treatment FOREIGN KEY(treatment_id)
    REFERENCES treatments(id)
);


/* Optimized Execution analysis by creating Indexes */
CREATE INDEX treatment_id_asc ON invoice_items (treatment_id ASC);
CREATE INDEX medical_histories_id_asc ON invoices (medical_histories_id ASC);
CREATE INDEX invoices_asc ON invoice_items (invoice_id ASC);
CREATE INDEX patients_asc ON medical_histories (patient_id ASC);