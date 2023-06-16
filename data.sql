/* Populate database with sample data. */

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ( 'Agumon', '3-2-2020', 0 , true , 10.23),
 ('Gabumon', '3-11-2018', 2, true, 8),
 ('Pikachu', '2021-1-7', 1, false, 15.04), 
 ('Devimon', '2017-5-12', 5, true, 11);

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
ALTER SEQUENCE species_id_seq RESTART WITH 1;
ALTER SEQUENCE owners_id_seq RESTART WITH 1;
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
SET species_id = 2
WHERE name like '%mon';

UPDATE animals
SET species_id = 1
WHERE name NOT like '%mon';

UPDATE animals
SET owners_id = 1
WHERE name like 'Agumon';

UPDATE animals
set owners_id = 2
WHERE name IN ('Gabumon','Pikachu');

UPDATE animals
set owners_id = 3
WHERE name IN ('Devimon','Plantmon');

UPDATE animals
set owners_id = 4
WHERE name IN ('Charmander','Squirtle','Blossom');

UPDATE animals
set owners_id = 5
WHERE name IN ('Angemon','Boarmon');

SELECT * FROM animals;

END;

BEGIN;
ALTER SEQUENCE vets_id_seq RESTART WITH 1;
INSERT INTO vets ( name, age, date_of_graduation)
 VALUES ( 'William Tatcher',45, '2000-4-23'),
 ( 'Maisy Smith',26, '2019-1-17'),
 ( 'Stephanie Mendez',64, '1981-5-4'),
 ( 'Jack Harkness',38, '2008-6-8');

SELECT * FROM vets;

COMMIT;

BEGIN;
INSERT INTO specializations (species,vets)
VALUES (1,1),(1,3),(2,3),(2,4);

SELECT * from specializations;

BEGIN;
INSERT INTO visits (animals,vets,visit_date)
VALUES (1,1, '2020-5-24'),
(1,3, '2020-7-22'),
(2,4, '2021-2-2'),
(3,2, '2020-1-5'),
(3,2, '2020-3-8'),
(3,2, '2020-5-14'),
(4,3, '2021-5-4'),
(5,4, '2021-2-24'),
(6,2, '2019-12-21'),
(6,1, '2020-8-10'),
(6,2, '2021-4-7'),
(7,3, '2019-9-29'),
(8,4, '2020-10-3'),
(8,4, '2020-11-4'),
(9,2, '2019-1-24'),
(9,2, '2019-5-15'),
(9,2, '2020-2-27'),
(9,2, '2020-8-3'),
(10,3, '2020-5-24'),
(10,1, '2021-1-11');

END;