/*the first table  for patients*/

CREATE TABLE patients (
  id INT PRIMARY KEY,
  name VARCHAR,
  date_of_birth DATE
);
/*the second table  for history*/
CREATE TABLE medical_history (
  id INT PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR,
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);
/*the third table  for ttreatments*/
CREATE TABLE treatments (
  id INT PRIMARY KEY,
  type VARCHAR,
  name VARCHAR,
);
/*the forth table  invoice-items*/
CREATE TABLE invoice_items (
  id INT PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  FOREIGN KEY (treatment_id) REFERENCES treatments (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices (id)
);
/*the fith table  for Invoices*/
CREATE TABLE invoices (
  id INT PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_history (id)
);