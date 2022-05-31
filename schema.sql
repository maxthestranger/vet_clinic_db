/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int primary key not null,
    name varchar(100),
    date_of_birth datetime,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);
