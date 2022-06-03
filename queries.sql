/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-1-1' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, date_of_birth FROM animals WHERE weight_kg >= 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'pokimon' WHERE species IS NULL;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
SAVEPOINT date_save_point;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO date_save_point;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT avg(weight_kg) FROM animals;
SELECT * FROM animals WHERE escape_attempts = (SELECT max(escape_attempts) FROM animals);
SELECT max(weight_kg) FROM animals GROUP BY name;
SELECT avg(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY name;

SELECT * FROM animals JOIN species ON species.name = 'Pokemon';
SELECT * FROM animals JOIN owners ON owners.id = animals.owner_id;
SELECT count(*) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species_id;
SELECT * from animals JOIN owners ON owners.full_name = 'Dean Winchester' WHERE escape_attempts = 0;