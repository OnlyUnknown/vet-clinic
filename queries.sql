/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals where name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE (neutered = true) AND (escape_attempts < 3);
SELECT date_of_birth FROM animals WHERE NAME IN ( 'Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE (weight_kg > 10.5);
SELECT * FROM animals WHERE (neutered = true);
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE (weight_kg >= 10.4 AND weight_kg <= 17.3);


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

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0;
SELECT AVG(weight_kg) from animals;

SELECT MAX(escape_attempts) FROM animals
GROUP BY neutered;

SELECT 
MAX(weight_kg),
MIN(weight_kg)
FROM
animals
GROUP BY species;

SELECT
AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
GROUP BY species;
