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