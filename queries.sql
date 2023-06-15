/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals where name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE (neutered = true) AND (escape_attempts < 3);
SELECT date_of_birth FROM animals WHERE NAME IN ( 'Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE (weight_kg > 10.5);
SELECT * FROM animals WHERE (neutered = true);
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE (weight_kg >= 10.4 AND weight_kg <= 17.3);

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

SELECT
    name,
    full_name,
    owners_id
FROM
    owners
 JOIN owners
    ON owners_id = 4;