/* Populate database with sample data. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-2-3', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-1-7', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-5-12', 5, true, 11.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-2-8', 0, false, 11.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, 5.70);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-4-2', 3, false, 12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-5-12', 1, true, 45.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-7-7', 7, true, 20.40);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-12', 3, true, 17.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-5-14', 4, true, 22.00);

INSERT INTO owners (full_name, age) VALUES  ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES  ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES  ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES  ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES  ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES  ('Jodie Whittaker', 38);


INSERT INTO species (name) VALUES  ('Pokemon');
INSERT INTO species (name) VALUES  ('Digimon');

UPDATE animals SET species_id  = 1;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET owner_id  = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id  = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id  = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id  = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id  = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets(name,age,date_of_graduation) values('William Tatcher',45,'2000-04-23'),('Maisy Smith',26,'2019-01-17'),('Stephanie Mendez',45,'1981-05-04'),('Jack Harkness',38,'2008-06-08');
INSERT INTO specializations(vets_name,species_name) values('William Tatcher','Pokemon'),('Stephanie Mendez','Digimon,Pokemon'),('Jack Harkness','Digimon');
INSERT INTO visits(animals_name,vets_name,date_of_visit) values('Agumon','William Tatcher','2020-05-25'),('Agumon','Stephanie Mendez','2020-07-22'),('Gabumon','Jack Harkness','2021-02-02'),('Pikachu','Maisy Smith','2020-01-05'),('Pikachu','Maisy Smith','2020-03-08'),('Pikachu','Maisy Smith','2020-05-14'),('Devimon','Stephanie Mendez','2021-05-04'),('Charmander','Jack Harkness','2021-02-24'),('Plantmon','Maisy Smith','2019-12-21'),('Plantmon','William Tatcher','2020-04-10'),('Squirtle','Stephanie Mendez','2020-09-29'),('Angemon','Jack Harkness','2020-10-03'),('Angemon','Jack Harkness','2020-11-04'),('Boarmon','Maisy Smith','2019-01-24'),('Boarmon','Maisy Smith','2019-05-15'),('Boarmon','Maisy Smith','2020-02-27'),('Boarmon','Maisy Smith','2019-01-24'),('Boarmon','Maisy Smith','2020-08-03'),('Blossom','Stephanie Mendaz','2020-05-24'),('Blossom','Willia, Tatcher','2021-01-11');
