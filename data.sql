/* Populate database with sample data. */

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ( 'Agumon', '3-2-2020', 0 , true , 10.23),('Gabumon', '3-11-2018', 2, true, 8), ('Pikachu', '2021-1-7', 1, false, 15.04), ('Devimon', '2017-5-12', 5, true, 11);

 INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ( 'Charmander', '2020-2-8', 0 , false , -11),
 ('Plantmon', '2021-11-15', 2, true, -5.7),
  ('Squirtle', '1993-4-2', 3, false, -12.13),
   ('Angemon', '2005-6-12', 1, true, 45),
   ('Boarmon', '2005-6-7', 7, true, 20.4),
   ('Blossom', '1998-10-13', 3, true, 17),
   ('Ditto', '2022-5-14', 4, true, 22);

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name like '%mon';
SELECT * FROM animals;
UPDATE animals
SET species = 'pokemon'
WHERE name NOT like '%mon';
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT WEIGHT;
UPDATE animals
SET weight_kg = weight_kg*-1;
SELECT * FROM animals;
ROLLBACK TO WEIGHT;
UPDATE animals
SET weight_kg = weight_kg*-1
WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

BEGIN;
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'),('Digimon');

END;

BEGIN;
UPDATE animals
SET species_id = 'digimon'
WHERE name like '%mon';
