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

select animals.name,owners.full_name from animals INNER JOIN owners on owners.id=animals.owner_id INNER JOIN species ON animals.species_id = species.id where owners.full_name ='Jennifer Orwell' AND animals.escape_attempts = 0;
select animals.name,owners.full_name from animals INNER JOIN owners on owners.id=animals.owner_id INNER JOIN species ON animals.species_id = species.id where owners.full_name ='Jennifer Orwell' AND animals.escape_attempts = 0;
select owners.full_name,count(*) as val_occurance from owners INNER JOIN animals ON owners.id=animals.owner_id GROUP BY (owners.full_name) ORDER BY val_occurance DESC LIMIT 1;
select animals.name from animals INNER JOIN visits ON animals.id=visits.animals_id INNER JOIN vets ON vets.id=visits.vets_id where vets.name ='William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;
select count(animals.name) from animals INNER JOIN visits ON animals.id=visits.animals_id where vets_name='Stephanie Mendez';
select vets.name,species.name from vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON species.id=specializations.species_id;
select animals.name from animals INNER JOIN visits ON animals.id=visits.animals_id INNER JOIN vets ON vets.id=visits.vets_id where vets.name='Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
select animals.name, COUNT(*) as visited from animals INNER JOIN  visits ON animals.id = visits.animals_id INNER JOIN vets ON vets.id=visits.vets_id GROUP BY animals.name ORDER BY visited DESC LIMIT 1;
elect animals.name, visits.date_of_visit,vets.name from animals INNER JOIN visits ON animals.id=visits.animals_id INNER JOIN vets ON vets.id=visits.vets_id where vets.name ='Maisy Smith' ORDER BY date_of_visit LIMIT 1;
select animals.*,vets.*,visits.date_of_visit from animals INNER JOIN visits ON visits.animals_id=animals.id INNER JOIN vets ON vets.id=visits.vets_id ORDER BY date_of_visit DESC LIMIT 1;
select vets.name,COUNT(visits.vets_id) as visit,COUNT(species.name) as specialization from vets LEFT JOIN specializations ON vets.id=specializations.vets_id LEFT JOIN species ON species.id=specializations.species_id INNER JOIN visits ON visits.vets_id =vets.id GROUP BY vets.name ORDER BY visit DESC LIMIT 1;
select vets.name,species.name from vets INNER JOIN specializations ON vets.id!=specializations.vets_id INNER JOIN species ON species.id !=specializations.species_id where vets.name='Maisy Smith';

-- optimzation
SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;

SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM visits where vet_id = 2;

SELECT * FROM owners where email = 'owner_18327@mail.com';
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';