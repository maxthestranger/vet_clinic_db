/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-1-1' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, date_of_birth FROM animals WHERE weight_kg >= 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

SELECT * FROM animals JOIN species ON species.name = 'Pokemon';
SELECT * FROM animals JOIN owners ON owners.id = animals.owner_id;
SELECT count(*) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species_id;
SELECT * from animals JOIN owners ON owners.full_name = 'Dean Winchester' WHERE escape_attempts = 0;
