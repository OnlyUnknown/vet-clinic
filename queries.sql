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
    name as Melody_owns
FROM
    animals
 JOIN owners
    ON owners.id = owners_id
    WHERE full_name = 'Melody Pond';

SELECT
    animals.name as name,
    species.name as species
FROM
    animals
 JOIN species
    ON species_id = 1
    where species.name = 'Pokemon';

    SELECT 
    owners.full_name,
    animals.name
    from owners
    left JOIN animals
    ON owners.id = owners_id ;

    SELECT
    species.name
    from species
    left

    SELECT
     species.name as 
species_name, COUNT(animals.id) as number_of_animals 
FROM animals 
JOIN species 
ON animals.species_id = species.id
 GROUP BY 
species.name;

SELECT 
animals.name,
owners.full_name
from animals
JOIN owners
ON owners.id = animals.owners_id
WHERE owners_id = 2;

SELECT
animals.name,
owners.full_name
from animals
JOIN owners
ON owners_id = 5
where escape_attempts = 0;

SELECT owners.full_name as 
owner_name, COUNT(animals.id) as 
number_of_animals 
FROM animals
JOIN owners 
ON animals.owners_id = owners.id 
GROUP BY owners.full_name
 ORDER BY number_of_animals 
 DESC LIMIT 1;


SELECT 
MAX(visit_date),
animals.name
from animals
JOIN visits
ON visits.animals = animals.id
where vets = 1
GROUP BY animals.name, visit_date
ORDER BY visit_date
DESC LIMIT 1;

SELECT 
COUNT(visits.animals)
from visits
where vets = 3;

SELECT
vets.name,
specializations.species
from vets
left JOIN specializations
ON specializations.vets = vets.id;

SELECT
name
from animals
JOIN visits
ON animals.id = visits.animals
where visits.vets = 3 AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT
COUNT(visits.animals),
animals.name
from visits
JOIN animals
ON visits.animals = animals.id
GROUP BY visits.animals, animals.name
ORDER BY COUNT
DESC LIMIT 1;

SELECT 
MIN(visit_date),
animals.name
from visits
JOIN animals
ON visits.animals = animals.id
WHERE visits.vets = 2
GROUP BY animals.name ,visit_date
ORDER BY visits.visit_date
ASC LIMIT 1;

SELECT 
visit_date,
animals.name as animal_name,
animals.weight_kg as animal_weight,
vets.name as Vet_Name,
vets.age as vet_age,
vets.date_of_graduation as vet_graduation
from vets
JOIN visits 
ON vets.id = visits.vets
JOIN animals
ON animals.id = visits.animals
ORDER BY visit_date DESC LIMIT 1;

SELECT COUNT(*) AS mismatched_visits_count
FROM visits 
JOIN animals ON animals.id = visits.animals
JOIN vets ON vets.id = visits.vets
LEFT JOIN specializations sp 
ON vets.id = sp.vets AND animals.species_id = sp.species
WHERE sp.species IS NULL;

SELECt 
COUNT(*),
species.name
FROM visits
JOIN animals
ON animals.id = visits.animals
JOIN species
ON species_id = species.id
WHERE visits.vets = 2
GROUP BY species.name
ORDER BY COUNT DESC LIMIT 1;

explain analyze SELECT COUNT(*) FROM visits where animals = 4;
explain analyze SELECT * FROM visits where vets = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';