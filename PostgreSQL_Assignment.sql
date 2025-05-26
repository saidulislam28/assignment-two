CREATE Table rangers(
  ranger_id  SERIAL PRIMARY KEY,
  name VARCHAR(100),
  region VARCHAR(200)
);

SELECT * FROM rangers;

-- task-1
INSERT INTO rangers(name, region) VALUES('Derek Fox', 'Coastal Plains');

