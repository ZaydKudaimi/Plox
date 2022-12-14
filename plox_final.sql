BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Location" (
	"Address"	VARCHAR(45) NOT NULL,
	"City"	INTEGER NOT NULL,
	"Zip_Code"	INTEGER,
	PRIMARY KEY("Address","City")
);
CREATE TABLE IF NOT EXISTS "Role" (
	"User_ID"	INTEGER NOT NULL,
	"Role"	VARCHAR(45) NOT NULL,
	FOREIGN KEY("User_ID") REFERENCES "User"("User_ID"),
	PRIMARY KEY("User_ID","Role")
);
CREATE TABLE IF NOT EXISTS "Hangar" (
	"Hangar_ID"	INTEGER NOT NULL,
	"Name"	VARCHAR(45),
	"City"	VARCHAR(45),
	"Address"	VARCHAR(45),
	"Dimension"	VARCHAR(45),
	"Enclosure_Type"	VARCHAR(45),
	"Price"	INTEGER,
	"Available_Duration"	INTEGER,
	"Heating"	VARCHAR(45),
	"Water_and_Electricity"	VARCHAR(45),
	"Technician"	VARCHAR(45),
	"Rented_By"	INTEGER,
	"Owned_By"	INTEGER,
	FOREIGN KEY("Owned_By") REFERENCES "User"("User_ID"),
	FOREIGN KEY("Rented_By") REFERENCES "User"("User_ID"),
	PRIMARY KEY("Hangar_ID")
);
CREATE TABLE IF NOT EXISTS "Rental_Period" (
	"Hangar_ID"	INTEGER NOT NULL,
	"Rentee_User"	INTEGER NOT NULL,
	"Rental_Duration"	INTEGER,
	FOREIGN KEY("Hangar_ID") REFERENCES "Hangar"("Hangar_ID"),
	FOREIGN KEY("Rentee_User") REFERENCES "User"("User_ID"),
	PRIMARY KEY("Hangar_ID","Rentee_User")
);
CREATE TABLE IF NOT EXISTS "User" (
	"User_ID"	INTEGER NOT NULL,
	"First_Name"	VARCHAR(45),
	"Last_Name"	VARCHAR(45),
	"Address"	VARCHAR(45),
	"City"	VARCHAR(45),
	"Password"	TEXT,
	FOREIGN KEY("City") REFERENCES "Location"("City"),
	FOREIGN KEY("Address") REFERENCES "Location"("Address"),
	FOREIGN KEY("User_ID") REFERENCES "User"("User_ID"),
	PRIMARY KEY("User_ID")
);
INSERT INTO "Location" VALUES ('157 Plox Rd','San Jose',98765);
INSERT INTO "Location" VALUES ('1123 SQL Rd','Daily City',26234);
INSERT INTO "Location" VALUES ('87 Cowboy st unit #102','Dallas',51766);
INSERT INTO "Location" VALUES ('990 Washington st','Austin',71266);
INSERT INTO "Location" VALUES ('6277 Jason Park Drive','Seattle',20300);
INSERT INTO "Location" VALUES ('99 Rain st unit #205','Long Beach',44726);
INSERT INTO "Role" VALUES (0,'Admin');
INSERT INTO "Role" VALUES (1,'Hangar Owner');
INSERT INTO "Role" VALUES (2,'Hangar Owner');
INSERT INTO "Role" VALUES (3,'Hangar Owner');
INSERT INTO "Role" VALUES (4,'Plane Owner');
INSERT INTO "Role" VALUES (5,'Plane Owner');
INSERT INTO "Role" VALUES (6,'Plane Onwer');
INSERT INTO "Hangar" VALUES (0,'Air Bed','San Jose','6543 Romano St','80x70x20','wood',70,120,'Radiant tube heater','Included','Offsite Technician availabe',NULL,1);
INSERT INTO "Hangar" VALUES (1,'JK Hangar','Seattle','127 Raining Rd','150x250x24','concrete',200,210,'High-BTU tube heater','Included','Onsite Technician available',NULL,1);
INSERT INTO "Hangar" VALUES (2,'The King''s Hangar','Dallas','776 Lonestar Rd','150x30x50','metal',220,240,'High-BTU tube heater','Included','Onsite Technician available',NULL,2);
INSERT INTO "Hangar" VALUES (3,'You Park Hangar','Riverside','129 Long River Park Driver','8x70x20','metal',90,140,'Radiant tube heater','Included','Offsite Technician available',4,3);
INSERT INTO "Hangar" VALUES (4,'Dream Parking','Orlando','65 North st','150x30x50','wood',100,360,'High-BTU tube heater','Included','Offsite Technician available',4,3);
INSERT INTO "Hangar" VALUES (5,'Air Parking','San Meteo','72 South st','150x30x50','wood',120,360,'High-BTU tube heater','Included','Onsite Technician available',5,3);
INSERT INTO "Hangar" VALUES (6,'The Bill Hangar CO.','Midtown','72 South st','150x30x50','wood',120,360,'High-BTU tube heater','Included','Onsite Technician available',NULL,2);
INSERT INTO "Hangar" VALUES (7,'Roller Hangar','Clinton','2000 Park Dr','180x50x70','metal',120,360,'Radiant tube heater','Included','Onsite Technician available',NULL,2);
INSERT INTO "Hangar" VALUES (8,'Phantom Hangars','Centerville','7th Street','180x50x70','metal',80,320,'Radiant tube heater','Included','Offsite Technician available',NULL,2);
INSERT INTO "Rental_Period" VALUES (0,0,120);
INSERT INTO "Rental_Period" VALUES (1,1,240);
INSERT INTO "Rental_Period" VALUES (2,2,320);
INSERT INTO "Rental_Period" VALUES (3,4,120);
INSERT INTO "Rental_Period" VALUES (4,4,240);
INSERT INTO "Rental_Period" VALUES (5,5,320);
INSERT INTO "User" VALUES (0,'Jane','Austin','157 Plox Rd','San Jose',NULL);
INSERT INTO "User" VALUES (1,'John','Griss','1123 SQL Rd','Daily City',NULL);
INSERT INTO "User" VALUES (2,'Jake','Lee','87 Cowboy st unit #102','Dallas',NULL);
INSERT INTO "User" VALUES (3,'Lisa','Bong','990 Washington st','Austin',NULL);
INSERT INTO "User" VALUES (4,'Rola','Hepburn','6277 Jason Park Drive','Seattle',NULL);
INSERT INTO "User" VALUES (5,'Sarang','Kim','99 Rain st unit #205','Long Beach',NULL);
CREATE VIEW [MASTER REPORT] AS
SELECT  h.hangar_id, h.name, h.city, h.address, h.Dimension, h.Enclosure_Type, h.Price, h.Available_Duration, h.Heating, h.Water_and_Electricity, h.Technician, u.First_Name, u.Last_Name, u.address

FROM Hangar h JOIN User u ON h.Owned_By = u.User_ID 
JOIN Role r ON u.User_ID = r.User_ID

WHERE h.Rented_By = "5"
AND r.Role = "Hangar Owner"
GROUP BY h.Name;
CREATE VIEW [LISTING REPORT] AS
SELECT  h.hangar_id, h.name, h.city, h.address, h.Dimension, h.Enclosure_Type, h.Price, h.Available_Duration, h.Heating, h.Water_and_Electricity, h.Technician, u.First_Name, u.Last_Name

FROM Hangar h JOIN User u ON h.Owned_By = u.User_ID 
JOIN Role r ON u.User_ID = r.User_ID

WHERE h.Rented_By is null  
AND r.Role = "Hangar Owner"
GROUP BY h.Name;
CREATE VIEW [RENTING REPORT] AS
SELECT  h.hangar_id, h.name, h.city, h.address, h.Dimension, h.Enclosure_Type, h.Price, h.Available_Duration, h.Heating, h.Water_and_Electricity, h.Technician, u.First_Name, u.Last_Name

FROM Hangar h JOIN Rental_Period rp ON h.Rented_By = rp.Rentee_User
JOIN User u ON rp.Rentee_User = u.User_ID 


WHERE h.Rented_By is not null  
AND h.Owned_By= "3"     
GROUP BY h.Name;
COMMIT;
