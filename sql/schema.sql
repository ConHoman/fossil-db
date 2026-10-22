-- Drop tables in case I need to redo something
drop table if exists image;
drop table if exists specimen;
drop table if exists organism;
drop table if exists site;
drop table if exists formation;


CREATE TABLE organism (
	organism_id INT PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(100) NOT NULL,
	genus VARCHAR(100),
	species VARCHAR(100)
);

CREATE TABLE formation (
	formation_id INT PRIMARY KEY AUTO_INCREMENT,
	period VARCHAR(50),
	name VARCHAR(100) NOT NULL
);

CREATE TABLE site (
	site_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	county VARCHAR(100),
	state CHAR(2),
	latitude DECIMAL(7,5),
	longitude DECIMAL(8,5)
);


CREATE TABLE specimen (
	specimen_id INT PRIMARY KEY AUTO_INCREMENT,
	featured BOOL DEFAULT FALSE NOT NULL,
	date_collected DATE,
	specimen_condition ENUM('perfect', 'fair', 'poor'),
	identified_by VARCHAR(50),
	confidence ENUM('high', 'medium', 'low', 'unidentified') NOT NULL DEFAULT 'unidentified',
	size_cm DECIMAL(5,2),
	catalog_number CHAR(7) NOT NULL UNIQUE,
	acquisition_method ENUM('found', 'purchased', 'gift') NOT NULL DEFAULT 'found',
	updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	notes TEXT,
	formation_id INT REFERENCES formation(formation_id) ON DELETE RESTRICT,
	site_id INT REFERENCES site(site_id) ON DELETE RESTRICT,
	organism_id INT REFERENCES organism(organism_id) ON DELETE SET NULL
);	

CREATE TABLE image (
	image_id INT PRIMARY KEY AUTO_INCREMENT,
	file_path VARCHAR(255) NOT NULL UNIQUE,
	caption TEXT,
	specimen_id INT NOT NULL REFERENCES specimen(specimen_id) ON DELETE CASCADE
);

