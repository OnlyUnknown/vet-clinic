/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(25),
date_of_birth DATE,
escape_attempts INT,
neutered BOOL,
weight_kg decimal
);

ALTER TABLE animals
ADD species VARCHAR(25);


BEGIN;
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(25),
    age INT
);
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(25)
);

ALTER TABLE animals
ADD PRIMARY KEY (id);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT,
ADD FOREIGN KEY (species_id)
REFERENCES  species(id);

ALTER TABLE animals
ADD owners_id INT,
ADD FOREIGN KEY (owners_id)
REFERENCES  owners(id);