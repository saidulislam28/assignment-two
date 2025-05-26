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
('Snow Leopard','Panthera uncia','1775-01-01','Endangered'),
('engal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered');


ALTER TABLE species ALTER COLUMN discovery_date TYPE DATE;

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
  (1, 1, 'Peak Ridge',        '2024-05-10 07:45:00', 'Camera trap image captured'),
  (2, 2, 'Bankwood Area',     '2024-05-12 16:20:00', 'Juvenile seen'),
  (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
  (1, 2, 'Snowfall Pass',     '2024-05-18 18:30:00', NULL);

INSERT INTO rangers (name, region)
VALUES 
  ('Alice Green', 'Northern Hills'),
  ('Bob White', 'River Delta'),
  ('Carol King', 'Mountain Range');


SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;


-- task-1
INSERT INTO rangers(name, region) VALUES('David Alan', 'South California');

