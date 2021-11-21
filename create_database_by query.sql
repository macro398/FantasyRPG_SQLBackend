CREATE DATABASE fantasy_rpg;

USE fantasy_rpg;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE classes (
    name TEXT PRIMARY KEY,
	description TEXT
);

CREATE TABLE races (
    name TEXT PRIMARY KEY,
    description TEXT UNIQUE NOT NULL
);

CREATE TABLE characters (
    name TEXT PRIMARY KEY,
    level INT,
    armor_class INT NOT NULL,
    max_hp INT NOT NULL,
    class TEXT NOT NULL,
    race TEXT NOT NULL,
    is_npc BOOLEAN NOT NULL,
    played_by INT
);

ALTER TABLE characters
ADD CONSTRAINT fk_characters_users
FOREIGN KEY(played_by)
REFERENCES users;

ALTER TABLE characters
ADD CONSTRAINT fk_characters_races
FOREIGN KEY(race)
REFERENCES races;

ALTER TABLE characters
ADD CONSTRAINT fk_characters_classes
FOREIGN KEY(class)
REFERENCES classes;

CREATE TABLE mobs (
    id SERIAL PRIMARY KEY,
    name TEXT,
    level INT,
    armor_class INT NOT NULL,
    max_hp INT NOT NULL,
    class TEXT NOT NULL,
    race TEXT NOT NULL
);

ALTER TABLE mobs
ADD CONSTRAINT fk_mobs_races
FOREIGN KEY(race)
REFERENCES races;

ALTER TABLE mobs
ADD CONSTRAINT fk_mobs_classes
FOREIGN KEY(class)
REFERENCES classes;

CREATE TABLE encounters (
    id SERIAL PRIMARY KEY,
    area_id INT
);

CREATE TABLE areas (
    id SERIAL PRIMARY KEY,
    zone TEXT UNIQUE,
    has_traps BOOLEAN
);

ALTER TABLE encounters
ADD CONSTRAINT fk_encounters_areas
FOREIGN KEY(area_id)
REFERENCES areas;

CREATE TABLE enemies_in_encounter (
    encounter_id INT,
    mob_id INT,
    PRIMARY KEY(encounter_id, mob_id)
);

ALTER TABLE enemies_in_encounter
ADD CONSTRAINT fk_enemies_in_encounter_mobs
FOREIGN KEY(mob_id)
REFERENCES mobs;

ALTER TABLE enemies_in_encounter
ADD CONSTRAINT fk_enemies_in_encounter_encounters
FOREIGN KEY(encounter_id)
REFERENCES encounters;

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE,
    description TEXT NOT NULL,
    value INT
);

CREATE TABLE loot_from_encounter (
    encounter_id INT,
    loot_id INT,
    PRIMARY KEY(encounter_id,loot_id)
);

ALTER TABLE loot_from_encounter
ADD CONSTRAINT fk_loot_from_encounter_items
FOREIGN KEY(loot_id)
REFERENCES items;

ALTER TABLE loot_from_encounter
ADD CONSTRAINT fk_loot_from_encounter_encounters
FOREIGN KEY(encounter_id)
REFERENCES encounters;

CREATE TABLE character_inventories(
    character_name TEXT,
    item_id INT,
    equiped BOOLEAN,
    PRIMARY KEY(character_name,item_id)
);

ALTER TABLE character_inventories
ADD CONSTRAINT fk_character_inventories_characters
FOREIGN KEY(character_name)
REFERENCES characters;

ALTER TABLE character_inventories
ADD CONSTRAINT fk_character_inventories_items
FOREIGN KEY(item_id)
REFERENCES items;

CREATE TABLE abilities(
    name TEXT PRIMARY KEY,
    description TEXT,
    level INT,
    effect TEXT
);

CREATE TABLE class_abilities(
    ability_name TEXT,
    class_name TEXT,
    PRIMARY KEY(ability_name, class_name)
);

ALTER TABLE class_abilities
ADD CONSTRAINT fk_class_abilities_classes
FOREIGN KEY(class_name)
REFERENCES classes;

ALTER TABLE class_abilities
ADD CONSTRAINT fk_class_abilities_abilities
FOREIGN KEY(ability_name)
REFERENCES abilities;