/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS animals;

CREATE TABLE owners(
  id int GENERATED BY DEFAULT AS IDENTITY,
  full_name text,
  age int,
  PRIMARY KEY(id)
);

CREATe TABLE species(
  id int GENERATED BY DEFAULT AS IDENTITY,
  name text,
  PRIMARY KEY(id)
);

CREATE TABLE animals (
  id int GENERATED BY DEFAULT AS IDENTITY,
  PRIMARY KEY(id),
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal,
  species varchar(100),
  owner varchar(100),
  CONSTRAINT fk_owner
  	FOREIGN KEY(owner_id)
  		REFERENCES owners(id),
    CONSTRAINT fk_species
  	FOREIGN KEY(species_id)
  		REFERENCES species(id)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id BIGINT REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id BIGINT REFERENCES owners(id);

CREATE TABLE vets(id SERIAL PRIMARY KEY NOT NULL,name VARCHAR(255), age INT,date_of_graduation date);
CREATE TABLE specializations(id SERIAL PRIMARY KEY NOT NULL,vets_name VARCHAR(255), species_name VARCHAR(255));
CREATE TABLE visits(id SERIAL PRIMARY KEY NOT NULL,animals_name VARCHAR(255), vets_name VARCHAR(255),date_of_visit date);
