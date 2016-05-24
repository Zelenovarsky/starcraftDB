CREATE TABLE race (
race_id NUMBER (3) PRIMARY KEY NOT NULL,
race_name VARCHAR2 (15) NOT NULL
);

CREATE TABLE building (
building_id NUMBER (4) PRIMARY KEY NOT NULL,
building_name VARCHAR (30) NOT NULL,
gas INT NOT NULL,
minerals INT CHECK(minerals >=0),
race_id NUMBER (3) NOT NULL,
FOREIGN KEY (race_id) REFERENCES race (race_id)
);

CREATE TABLE unit (
unit_id NUMBER (4) PRIMARY KEY NOT NULL,

unit_name VARCHAR2 (30) NOT NULL,
gas INT NOT NULL,
minerals INT CHECK(minerals >=0),
health INT NOT NULL,
mana INT,

building_id NUMBER (4) NOT NULL,
race_id NUMBER (3) NOT NULL,
FOREIGN KEY (race_id) REFERENCES race (race_id),
FOREIGN KEY (building_id) REFERENCES building (building_id)
);

--tables population
INSERT INTO RACE VALUES (001,'Terran');
INSERT INTO BUILDING VALUES (001,'command Center',0,400,001);

INSERT INTO UNIT VALUES (001,'SCV',0,50,45,NULL,001,001);
commit;
