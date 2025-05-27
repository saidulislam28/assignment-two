CREATE Table rangers(
  ranger_id  SERIAL PRIMARY KEY,
  name VARCHAR(100),
  region VARCHAR(200)
);

CREATE TABLE species(
  species_id SERIAL PRIMARY KEY,
  common_name VARCHAR(50),
  scientific_name VARCHAR(50),
  discovery_date TIMESTAMP,
  conservation_status VARCHAR(50)
);

INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status)
VALUES 
('Snow Leopard','Panthera Molera','1776-01-01','Vulnerable'),
('bengal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered');



CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL,
    species_id INT NOT NULL,
    sighting_time TIMESTAMP,
    location VARCHAR(250) NOT NULL,
    notes TEXT,
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES 
  (1, 2, 'Peak Ridge Pass',        '2024-05-10 07:45:00', 'Camera trap image captured'),
  (2, 1, 'Bankwood Pass Area',     '2024-05-12 16:20:00', 'Juvenile seen'),
  (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
  (1, 2, 'Snowfall Pass',     '2024-05-18 18:30:00', NULL);

INSERT INTO rangers (name, region)
VALUES 
  ('Alice Green', 'Northern Hills'),
  ('Bob White', 'River Delta'),
  ('Carol King', 'Mountain Range');

DROP TABLE rangers;

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;


-- task-1
INSERT INTO rangers(name, region) VALUES('David Alan', 'South California');

-- task 2
SELECT count(DISTINCT species_id) as unique_species_count  FROM sightings;

-- task 3
SELECT * FROM sightings WHERE location LIKE '%Pass%';

-- task 4
SELECT name, count(*) AS number_of_sightings FROM rangers AS r
JOIN sightings AS s on r.ranger_id = s.ranger_id
GROUP BY name ;

-- task 5
SELECT common_name FROM species AS s
LEFT JOIN sightings AS st ON s.species_id = st.species_id
WHERE st.species_id IS NULL;


-- task 6
SELECT  common_name, sighting_time, name FROM sightings st
INNER JOIN rangers r ON  st.ranger_id = r.ranger_id
INNER JOIN species s On st.species_id = s.species_id
ORDER BY sighting_time DESC 
LIMIT 2;

-- task 7
UPDATE species
SET conservation_status = 'Historic'
WHERE (EXTRACT(YEAR FROM discovery_date)) < 1800;

-- task 8
SELECT 
  sighting_id,
  CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;

-- task 9
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT ranger_id FROM sightings);
