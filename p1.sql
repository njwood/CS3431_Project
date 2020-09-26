DROP TABLE Route;
DROP TABLE PhoneNum;
DROP TABLE Edges;
DROP TABLE Path;
DROP TABLE PositionList;
DROP TABLE Staff;
DROP TABLE Floor;
DROP TABLE Locations;
DROP TABLE Positions;
DROP SEQUENCE seq_eID;
DROP SEQUENCE seq_fID;

CREATE TABLE Positions(
    positionID varchar2(20),
    title varchar2(30),
    paygrade number(2) CHECK(paygrade >=0 AND paygrade <= 10),
    CONSTRAINT Positions_PK PRIMARY KEY(positionID)
);

CREATE TABLE Locations(
    locationID varchar2(5),
    locationName varchar2(20),
    locationType varchar2(20),
    maxOccupancy number(1) DEFAULT NULL,
    xcoord number(4),
    ycoord number(4),
    CONSTRAINT Locations_PK PRIMARY KEY(locationID)
);

CREATE TABLE Staff(
    accountName varchar2(10),
    firstName varchar2(15) NOT NULL,
    lastName varchar2(15) NOT NULL,
    locationID varchar2(5),
    CONSTRAINT Staff_PK PRIMARY KEY(accountName),
    CONSTRAINT Staff_FK2 FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);

CREATE TABLE PhoneNum(
    accountID varchar2(10),
    phoneNum number(4),
    CONSTRAINT Phone_PK PRIMARY KEY(accountID, phoneNum),
    CONSTRAINT Phone_FK FOREIGN KEY (accountID) REFERENCES Staff(accountName)
);

CREATE TABLE Edges(
    edgeID number(3),
    startNode varchar2(4),
    endNode varchar2(4),
    CONSTRAINT Edges_PK PRIMARY KEY (edgeID)
);

CREATE TABLE Path (
    pathID varchar2(20),
    locationID varchar2(5),
    destination varchar2(20),
    CONSTRAINT Path_PK PRIMARY KEY (pathID)
);

CREATE TABLE PositionList(
    acctName varchar2(10),
    positionID varchar2(20),
    CONSTRAINT Position_PK PRIMARY KEY (acctName, positionID),
    CONSTRAINT Position_FK  FOREIGN KEY (acctName) REFERENCES Staff(accountName),
    CONSTRAINT Position_FK2 FOREIGN KEY (positionID) REFERENCES Positions(positionID)
);

CREATE TABLE Route(
    edgeID number(3),
    pathID varchar2(20),
    CONSTRAINT Route_PK PRIMARY KEY (edgeID, pathID),
    CONSTRAINT Route_FK FOREIGN KEY (edgeID) REFERENCES Edges(edgeID),
    CONSTRAINT Route_FK2 FOREIGN KEY (pathID) REFERENCES Path(pathID)
);

CREATE TABLE Floor(
    floorID number(3),
    floorNumber number(1),
    locationID varchar2(5),
    CONSTRAINT Floor_PK PRIMARY KEY(floorID),
    CONSTRAINT Floor_FK FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);

CREATE SEQUENCE seq_eID
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1;
    
CREATE SEQUENCE seq_fID
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1;

-- Insert Statements By Table

-- Positions

INSERT INTO Positions VALUES('ASSOCARCHIVIST', 'Associate Archivist',5);
INSERT INTO Positions VALUES('DOCENT', 'Docent', 0);
INSERT INTO Positions VALUES('ASSTCURATOR', 'Assistant Curator', 4);
INSERT INTO Positions VALUES('ASSTARCHIVIST', 'Assistant Archivist', 3);
INSERT INTO Positions VALUES('ASSOCCURATOR', 'Associate Curator', 6);
INSERT INTO Positions VALUES('COORDEXHIBITS', 'Coordinator of Exhibits', 9);
INSERT INTO Positions VALUES('DEPTHEAD', 'Department Head', 10);
INSERT INTO Positions VALUES('DIRARTS', 'Director of Arts', 9);
INSERT INTO Positions VALUES('DIRHISTORY', 'Director of History', 9);
INSERT INTO Positions VALUES('COORDDESIGN', 'Coordinator of Design', 8);
INSERT INTO Positions VALUES('ADMIN1', 'Administrative Assistant I', 1);
INSERT INTO Positions VALUES('ADMIN2', 'Administrative Assistant II', 2);
INSERT INTO Positions VALUES('CURATOR', 'Curator', 7);
INSERT INTO Positions VALUES('HISTORIAN',' Historian', 6);
INSERT INTO Positions VALUES('ARCHIVIST', 'Archivist', 7);

-- Locations 

INSERT INTO Locations VALUES('201A','201A','Office',1,640,200);
INSERT INTO Locations VALUES('201B','201B','Office',1,575,200);
INSERT INTO Locations VALUES('201C','201C','Office',2,465,200);
INSERT INTO Locations VALUES('202','202','Gallery',NULL,395,270);
INSERT INTO Locations VALUES('202A','202A','Office',2,70,405);
INSERT INTO Locations VALUES('202B','202B','Office',1,170,405);
INSERT INTO Locations VALUES('202C','202C','Office',1,275,405);
INSERT INTO Locations VALUES('202D','202D','Office',1,380,405);
INSERT INTO Locations VALUES('202E','202E','Office','2',465,405);
INSERT INTO Locations VALUES('203','203','Gallery',NULL,885,340);
INSERT INTO Locations VALUES('204','204 Lovecraft Room','Conference Room',NULL,980,340);
INSERT INTO Locations VALUES('205','205','Office',2,465,340);
INSERT INTO Locations VALUES('206','206','Office',3,1380,200);
INSERT INTO Locations VALUES('207','207','Office',2,1250,200);
INSERT INTO Locations VALUES('208','208','Closet',NULL,1075,200);
INSERT INTO Locations VALUES('209','209 Museum Guides','Office',5,1015,200);
INSERT INTO Locations VALUES('S2','2nd Floor Stairs','Stairs',NULL,815,160);
INSERT INTO Locations VALUES('H201','Hallway 201','Hallway',NULL,70,350);
INSERT INTO Locations VALUES('H202','Hallway 202','Hallway',NULL,170,350);
INSERT INTO Locations VALUES('H203','Hallway 203','Hallway',NULL,275,350);
INSERT INTO Locations VALUES('H204','Hallway 204','Hallway',NULL,380,350);
INSERT INTO Locations VALUES('H205','Hallway 205','Hallway',NULL,465,350);
INSERT INTO Locations VALUES('H206','Hallway 206','Hallway',NULL,465,270);
INSERT INTO Locations VALUES('H207','Hallway 207','Hallway',NULL,575,270);
INSERT INTO Locations VALUES('H208','Hallway 208','Hallway',NULL,640,270);
INSERT INTO Locations VALUES('H209','Hallway 209','Hallway',NULL,815,270);
INSERT INTO Locations VALUES('H210','Hallway 210','Hallway',NULL,885,270);
INSERT INTO Locations VALUES('H211','Hallway 211','Hallway',NULL,980,270);
INSERT INTO Locations VALUES('H212','Hallway 212','Hallway',NULL,1015,270);
INSERT INTO Locations VALUES('H213','Hallway 213','Hallway',NULL,1075,270);
INSERT INTO Locations VALUES('H214','Hallway 214','Hallway',NULL,1250,270);
INSERT INTO Locations VALUES('H215','Hallway 215','Hallway',NULL,1380,270);
INSERT INTO Locations VALUES('302A','302A','Office',1,440,215);
INSERT INTO Locations VALUES('302B','302B','Office',1,580,215);
INSERT INTO Locations VALUES('303','303','Office',1,350,215);
INSERT INTO Locations VALUES('304','304','Conference Room',NULL,275,265);
INSERT INTO Locations VALUES('305A','305A','Office',1,340,425);
INSERT INTO Locations VALUES('305B','305B','Office',2,240,425);
INSERT INTO Locations VALUES('305C','305C','Office',1,175,425);
INSERT INTO Locations VALUES('305D','305D','Office',3,30,425);
INSERT INTO Locations VALUES('306','306','Gallery',NULL,475,335);
INSERT INTO Locations VALUES('307','307','Office',1,975,410);
INSERT INTO Locations VALUES('308','308','Gallery',NULL,1040,365);
INSERT INTO Locations VALUES('309','309','Gallery',NULL,1040,265);
INSERT INTO Locations VALUES('M','Mens Restroom','Restroom',NULL,960,215);
INSERT INTO Locations VALUES('W','Womens Restroom','Restroom',NULL,650,215);
INSERT INTO Locations VALUES('S3', '3rd Floor Stairs','Stairs',NULL,780,85);
INSERT INTO Locations VALUES('H301','Hallway 301','Hallway',NULL,30,360);
INSERT INTO Locations VALUES('H302','Hallway 302','Hallway',NULL,175,360);
INSERT INTO Locations VALUES('H303','Hallway 303','Hallway',NULL,240,360);
INSERT INTO Locations VALUES('H304','Hallway 304','Hallway',NULL,340,360);
INSERT INTO Locations VALUES('H305','Hallway 305','Hallway',NULL,380,360);
INSERT INTO Locations VALUES('H306','Hallway 306','Hallway',NULL,350,265);
INSERT INTO Locations VALUES('H307','Hallway 307','Hallway',NULL,380,265);
INSERT INTO Locations VALUES('H308','Hallway 308','Hallway',NULL,440,265);
INSERT INTO Locations VALUES('H309','Hallway 309','Hallway',NULL,475,265);
INSERT INTO Locations VALUES('H310','Hallway 310','Hallway',NULL,580,265);
INSERT INTO Locations VALUES('H311','Hallway 311','Hallway',NULL,650,265);
INSERT INTO Locations VALUES('H312','Hallway 312','Hallway',NULL,780,265);
INSERT INTO Locations VALUES('H313','Hallway 313','Hallway',NULL,960,265);
INSERT INTO Locations VALUES('H314','Hallway 314','Hallway',NULL,975,265);
INSERT INTO Locations VALUES('H315','Hallway 315','Hallway',NULL,975,365);

-- Staff
INSERT INTO Staff VALUES('fargo','Caroline','Fargo','205');
INSERT INTO Staff VALUES('rick','Charles','Rick','305C');
INSERT INTO Staff VALUES('arko','Christine','Arko','209');
INSERT INTO Staff VALUES('shoe','Sam','Shoe','206');
INSERT INTO Staff VALUES('williams','Mark','Williams','207');
INSERT INTO Staff VALUES('dixon','Dewayne','Dixon','305A');
INSERT INTO Staff VALUES('rodriguez','Douglas','Rodriguez','202E');
INSERT INTO Staff VALUES('stein','Eli','Stein','202A');
INSERT INTO Staff VALUES('lin','Amy','Lin','202D');
INSERT INTO Staff VALUES('hirsch','George','Hirsch','305B');
INSERT INTO Staff VALUES('pine','Katherine','Pine','201C');
INSERT INTO Staff VALUES('landry','Hugh','Landry','202E');
INSERT INTO Staff VALUES('simmons','Moesha','Simmons','302B');
INSERT INTO Staff VALUES('brown','Eva','Brown','202C');
INSERT INTO Staff VALUES('fischer','Emily','Fischer','201B');
INSERT INTO Staff VALUES('mehta','Gaurav','Mehta','202B');
INSERT INTO Staff VALUES('clay','Mark','Clay','307');
INSERT INTO Staff VALUES('hofstra','Michelle','Hostra','205');
INSERT INTO Staff VALUES('haring','Tom','Haring','201A');
INSERT INTO Staff VALUES('jones','Kiki','Jones','303');
INSERT INTO Staff VALUES('isa','Mohamed','Isa','207');
INSERT INTO Staff VALUES('holmes','Neil','Holmes','206');
INSERT INTO Staff VALUES('ford','Nicole','Ford','209');
INSERT INTO Staff VALUES('rcane','Ralph','Cane','209');
INSERT INTO Staff VALUES('ganoon','Griffin','Ganoon','302A');
INSERT INTO Staff VALUES('tam','William','Tam','305D');

-- PhoneNum
INSERT INTO PhoneNum VALUES('fargo',2140);
INSERT INTO PhoneNum VALUES('rick',2445);
INSERT INTO PhoneNum VALUES('arko',2178);
INSERT INTO PhoneNum VALUES('shoe',1433);
INSERT INTO PhoneNum VALUES('williams',4357);
INSERT INTO PhoneNum VALUES('williams',4622);
INSERT INTO PhoneNum VALUES('dixon',2121);
INSERT INTO PhoneNum VALUES('rodriguez',1993);
INSERT INTO PhoneNum VALUES('stein',2315);
INSERT INTO PhoneNum VALUES('lin',2068);
INSERT INTO PhoneNum VALUES('hirsch',2002);
INSERT INTO PhoneNum VALUES('pine',1752);
INSERT INTO PhoneNum VALUES('landry',1993);
INSERT INTO PhoneNum VALUES('simmons',2322);
INSERT INTO PhoneNum VALUES('brown',2656);
INSERT INTO PhoneNum VALUES('fischer',1618);
INSERT INTO PhoneNum VALUES('mehta',3071);
INSERT INTO PhoneNum VALUES('clay',1909);
INSERT INTO PhoneNum VALUES('hofstra',3411);
INSERT INTO PhoneNum VALUES('haring',1617);
INSERT INTO PhoneNum VALUES('jones',3669);
INSERT INTO PhoneNum VALUES('jones',2674);
INSERT INTO PhoneNum VALUES('isa',2921);
INSERT INTO PhoneNum VALUES('holmes',2069);
INSERT INTO PhoneNum VALUES('ford',1857);
INSERT INTO PhoneNum VALUES('rcane',1857);
INSERT INTO PhoneNum VALUES('ganoon',1857);
INSERT INTO PhoneNum VALUES('tam',2206);

-- PositionList

INSERT INTO PositionList VALUES('fargo','ASSOCCURATOR');
INSERT INTO PositionList VALUES('rick','CURATOR');
INSERT INTO PositionList VALUES('arko','DOCENT');
INSERT INTO PositionList VALUES('shoe','ASSOCCURATOR');
INSERT INTO PositionList VALUES('williams','CURATOR');
INSERT INTO PositionList VALUES('williams','DEPTHEAD');
INSERT INTO PositionList VALUES('dixon','CURATOR');
INSERT INTO PositionList VALUES('rodriguez','ASSTARCHIVIST');
INSERT INTO PositionList VALUES('stein','CURATOR');
INSERT INTO PositionList VALUES('stein','DIRARTS');
INSERT INTO PositionList VALUES('lin','ASSOCCURATOR');
INSERT INTO PositionList VALUES('lin','COORDEXHIBITS');
INSERT INTO PositionList VALUES('hirsch','ASSOCCURATOR');
INSERT INTO PositionList VALUES('pine','HISTORIAN');
INSERT INTO PositionList VALUES('landry','ARCHIVIST');
INSERT INTO PositionList VALUES('simmons','ADMIN1');
INSERT INTO PositionList VALUES('brown','ASSOCCURATOR');
INSERT INTO PositionList VALUES('fischer','CURATOR');
INSERT INTO PositionList VALUES('mehta','ASSTCURATOR');
INSERT INTO PositionList VALUES('clay','CURATOR');
INSERT INTO PositionList VALUES('hofstra','CURATOR');
INSERT INTO PositionList VALUES('haring','HISTORIAN');
INSERT INTO PositionList VALUES('jones','ADMIN2');
INSERT INTO PositionList VALUES('isa','ASSOCCURATOR');
INSERT INTO PositionList VALUES('holmes','CURATOR');
INSERT INTO PositionList VALUES('holmes','DIRHISTORY');
INSERT INTO PositionList VALUES('ford','DOCENT');
INSERT INTO PositionList VALUES('rcane','COORDDESIGN');
INSERT INTO PositionList VALUES('ganoon','ASSOCARCHIVIST');
INSERT INTO PositionList VALUES('tam','ASSTARCHIVIST');

-- Edges

INSERT INTO Edges VALUES(seq_eID.nextval,'202A','H201');
INSERT INTO Edges VALUES(seq_eID.nextval,'H201','202A');
INSERT INTO Edges VALUES(seq_eID.nextval,'H201','H202');
INSERT INTO Edges VALUES(seq_eID.nextval,'H202','H201');
INSERT INTO Edges VALUES(seq_eID.nextval,'H202','202B');
INSERT INTO Edges VALUES(seq_eID.nextval,'202B','H202');
INSERT INTO Edges VALUES(seq_eID.nextval,'H202','H203');
INSERT INTO Edges VALUES(seq_eID.nextval,'H203','H202');
INSERT INTO Edges VALUES(seq_eID.nextval,'H203','202C');
INSERT INTO Edges VALUES(seq_eID.nextval,'202C','H203');
INSERT INTO Edges VALUES(seq_eID.nextval,'H203','H204');
INSERT INTO Edges VALUES(seq_eID.nextval,'H204','H203');
INSERT INTO Edges VALUES(seq_eID.nextval,'H204','202D');
INSERT INTO Edges VALUES(seq_eID.nextval,'202D', 'H204');
INSERT INTO Edges VALUES(seq_eID.nextval,'H204','H205');
INSERT INTO Edges VALUES(seq_eID.nextval,'H205','H204');
INSERT INTO Edges VALUES(seq_eID.nextval,'H205','202E');
INSERT INTO Edges VALUES(seq_eID.nextval,'202E','H205');
INSERT INTO Edges VALUES(seq_eID.nextval,'H205','H206');
INSERT INTO Edges VALUES(seq_eID.nextval,'H206','H205');
INSERT INTO Edges VALUES(seq_eID.nextval,'H206','202');
INSERT INTO Edges VALUES(seq_eID.nextval,'H206','201C');
INSERT INTO Edges VALUES(seq_eID.nextval,'H206','H207');
INSERT INTO Edges VALUES(seq_eID.nextval,'202','H206');
INSERT INTO Edges VALUES(seq_eID.nextval,'201C','H206');
INSERT INTO Edges VALUES(seq_eID.nextval,'H207','H206');
INSERT INTO Edges VALUES(seq_eID.nextval,'H207','201B');
INSERT INTO Edges VALUES(seq_eID.nextval,'H207','H208');
INSERT INTO Edges VALUES(seq_eID.nextval,'201B','H207');
INSERT INTO Edges VALUES(seq_eID.nextval,'H208','H207');
INSERT INTO Edges VALUES(seq_eID.nextval,'H208','201A');
INSERT INTO Edges VALUES(seq_eID.nextval,'201A','H208');
INSERT INTO Edges VALUES(seq_eID.nextval,'H208','H209');
INSERT INTO Edges VALUES(seq_eID.nextval,'H209','H208');
INSERT INTO Edges VALUES(seq_eID.nextval,'H209','S2');
INSERT INTO Edges VALUES(seq_eID.nextval,'S2','H209');
INSERT INTO Edges VALUES(seq_eID.nextval,'H209','H210');
INSERT INTO Edges VALUES(seq_eID.nextval,'S2','S3');
INSERT INTO Edges VALUES(seq_eID.nextval,'S3','S2');
INSERT INTO Edges VALUES(seq_eID.nextval,'H210','H209');
INSERT INTO Edges VALUES(seq_eID.nextval,'H210','203');
INSERT INTO Edges VALUES(seq_eID.nextval,'203','H210');
INSERT INTO Edges VALUES(seq_eID.nextval,'H210','H211');
INSERT INTO Edges VALUES(seq_eID.nextval,'H211','H210');
INSERT INTO Edges VALUES(seq_eID.nextval,'H211','204');
INSERT INTO Edges VALUES(seq_eID.nextval,'204','H211');
INSERT INTO Edges VALUES(seq_eID.nextval,'H211','H212');
INSERT INTO Edges VALUES(seq_eID.nextval,'H212','H211');
INSERT INTO Edges VALUES(seq_eID.nextval,'H212','209');
INSERT INTO Edges VALUES(seq_eID.nextval,'209','H212');
INSERT INTO Edges VALUES(seq_eID.nextval,'H212','H213');
INSERT INTO Edges VALUES(seq_eID.nextval,'H213','H212');
INSERT INTO Edges VALUES(seq_eID.nextval,'H213','208');
INSERT INTO Edges VALUES(seq_eID.nextval,'208','H213');
INSERT INTO Edges VALUES(seq_eID.nextval,'H213','H214');
INSERT INTO Edges VALUES(seq_eID.nextval,'H214','H213');
INSERT INTO Edges VALUES(seq_eID.nextval,'H214','207');
INSERT INTO Edges VALUES(seq_eID.nextval,'207','H214');
INSERT INTO Edges VALUES(seq_eID.nextval,'H214','H215');
INSERT INTO Edges VALUES(seq_eID.nextval,'H215','H214');
INSERT INTO Edges VALUES(seq_eID.nextval,'H215','206');
INSERT INTO Edges VALUES(seq_eID.nextval,'H215','205');
INSERT INTO Edges VALUES(seq_eID.nextval,'206','H215');
INSERT INTO Edges VALUES(seq_eID.nextval,'205','H215');
INSERT INTO Edges VALUES(seq_eID.nextval,'305D','H301');
INSERT INTO Edges VALUES(seq_eID.nextval,'H301','305D');
INSERT INTO Edges VALUES(seq_eID.nextval,'H301','H302');
INSERT INTO Edges VALUES(seq_eID.nextval,'H302','H301');
INSERT INTO Edges VALUES(seq_eID.nextval,'H302','305C');
INSERT INTO Edges VALUES(seq_eID.nextval,'305C','H302');
INSERT INTO Edges VALUES(seq_eID.nextval,'H302','H303');
INSERT INTO Edges VALUES(seq_eID.nextval,'H303','H302');
INSERT INTO Edges VALUES(seq_eID.nextval,'H303','305B');
INSERT INTO Edges VALUES(seq_eID.nextval,'305B','H303');
INSERT INTO Edges VALUES(seq_eID.nextval,'H303','H304');
INSERT INTO Edges VALUES(seq_eID.nextval,'H304','H303');
INSERT INTO Edges VALUES(seq_eID.nextval,'H304','305A');
INSERT INTO Edges VALUES(seq_eID.nextval,'305A','H304');
INSERT INTO Edges VALUES(seq_eID.nextval,'H304','H305');
INSERT INTO Edges VALUES(seq_eID.nextval,'H305','H305');
INSERT INTO Edges VALUES(seq_eID.nextval,'H305','H307');
INSERT INTO Edges VALUES(seq_eID.nextval,'H307','H305');
INSERT INTO Edges VALUES(seq_eID.nextval,'H307','H306');
INSERT INTO Edges VALUES(seq_eID.nextval,'H306','H307');
INSERT INTO Edges VALUES(seq_eID.nextval,'H306','304');
INSERT INTO Edges VALUES(seq_eID.nextval,'304','H306');
INSERT INTO Edges VALUES(seq_eID.nextval,'H306','303');
INSERT INTO Edges VALUES(seq_eID.nextval,'303','H306');
INSERT INTO Edges VALUES(seq_eID.nextval,'H307','H308');
INSERT INTO Edges VALUES(seq_eID.nextval,'H308','H307');
INSERT INTO Edges VALUES(seq_eID.nextval,'H308','302A');
INSERT INTO Edges VALUES(seq_eID.nextval,'302A','H308');
INSERT INTO Edges VALUES(seq_eID.nextval,'H308','H309');
INSERT INTO Edges VALUES(seq_eID.nextval,'H309','H308');
INSERT INTO Edges VALUES(seq_eID.nextval,'H309','306');
INSERT INTO Edges VALUES(seq_eID.nextval,'306','H309');
INSERT INTO Edges VALUES(seq_eID.nextval,'H309','H310');
INSERT INTO Edges VALUES(seq_eID.nextval,'H310','H309');
INSERT INTO Edges VALUES(seq_eID.nextval,'H310','302B');
INSERT INTO Edges VALUES(seq_eID.nextval,'302B','H310');
INSERT INTO Edges VALUES(seq_eID.nextval,'H310','H311');
INSERT INTO Edges VALUES(seq_eID.nextval,'H311','H310');
INSERT INTO Edges VALUES(seq_eID.nextval,'H311','W');
INSERT INTO Edges VALUES(seq_eID.nextval,'W','H311');
INSERT INTO Edges VALUES(seq_eID.nextval,'H311','H312');
INSERT INTO Edges VALUES(seq_eID.nextval,'H312','H311');
INSERT INTO Edges VALUES(seq_eID.nextval,'S3','H312');
INSERT INTO Edges VALUES(seq_eID.nextval,'H312','S3');
INSERT INTO Edges VALUES(seq_eID.nextval,'H312','H313');
INSERT INTO Edges VALUES(seq_eID.nextval,'H313','H312');
INSERT INTO Edges VALUES(seq_eID.nextval,'H313','M');
INSERT INTO Edges VALUES(seq_eID.nextval,'M','H313');
INSERT INTO Edges VALUES(seq_eID.nextval,'H313','H314');
INSERT INTO Edges VALUES(seq_eID.nextval,'H314','H313');
INSERT INTO Edges VALUES(seq_eID.nextval,'H314','309');
INSERT INTO Edges VALUES(seq_eID.nextval,'309','H314');
INSERT INTO Edges VALUES(seq_eID.nextval,'H314','H315');
INSERT INTO Edges VALUES(seq_eID.nextval,'H315','H314');
INSERT INTO Edges VALUES(seq_eID.nextval,'H315','308');
INSERT INTO Edges VALUES(seq_eID.nextval,'308','H315');
INSERT INTO Edges VALUES(seq_eID.nextval,'H315','307');
INSERT INTO Edges VALUES(seq_eID.nextval,'307','H315');

-- Path
INSERT INTO Path VALUES('305B_M','305B','M');
INSERT INTO Path VALUES('S2_206','S2','206');
INSERT INTO Path VALUES('202E_307','202E', '307');

-- Route

-- R1
INSERT INTO Route VALUES(74,'305B_M');
INSERT INTO Route VALUES(75,'305B_M');
INSERT INTO Route VALUES(79,'305B_M');
INSERT INTO Route VALUES(81,'305B_M');
INSERT INTO Route VALUES(89,'305B_M');
INSERT INTO Route VALUES(93,'305B_M');
INSERT INTO Route VALUES(97,'305B_M');
INSERT INTO Route VALUES(101,'305B_M');
INSERT INTO Route VALUES(105,'305B_M');
INSERT INTO Route VALUES(107,'305B_M');
INSERT INTO Route VALUES(111,'305B_M');

-- R2
INSERT INTO Route VALUES(36,'S2_206');
INSERT INTO Route VALUES(37,'S2_206');
INSERT INTO Route VALUES(43,'S2_206');
INSERT INTO Route VALUES(47,'S2_206');
INSERT INTO Route VALUES(51,'S2_206');
INSERT INTO Route VALUES(55,'S2_206');
INSERT INTO Route VALUES(59,'S2_206');
INSERT INTO Route VALUES(61,'S2_206');

--R3
INSERT INTO Route VALUES(18,'202E_307');
INSERT INTO Route VALUES(19,'202E_307');
INSERT INTO Route VALUES(23,'202E_307');
INSERT INTO Route VALUES(28,'202E_307');
INSERT INTO Route VALUES(33,'202E_307');
INSERT INTO Route VALUES(35,'202E_307');
INSERT INTO Route VALUES(38,'202E_307');
INSERT INTO Route VALUES(107,'202E_307');
INSERT INTO Route VALUES(109,'202E_307');
INSERT INTO Route VALUES(113,'202E_307');
INSERT INTO Route VALUES(117,'202E_307');
INSERT INTO Route VALUES(121,'202E_307');

-- Floor
INSERT INTO Floor VALUES(seq_fID.nextval,2,'201A');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'201B');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'201C');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'202');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'202A');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'202B');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'202C');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'202D');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'202E');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'203');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'204');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'205');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'206');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'207');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'208');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'209');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'S2');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H201');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H202');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H203');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H204');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H205');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H206');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H207');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H208');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H209');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H210');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H211');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H212');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H213');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H214');
INSERT INTO Floor VALUES(seq_fID.nextval,2,'H215');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'302A');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'302B');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'303');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'304');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'305A');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'305B');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'305C');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'305D');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'306');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'307');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'308');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'309');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'M');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'W');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'S3');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H301');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H302');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H303');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H304');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H305');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H306');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H307');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H308');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H309');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H310');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H311');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H312');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H313');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H314');
INSERT INTO Floor VALUES(seq_fID.nextval,3,'H315');

/* Testing to make sure the data has been entered properly
 
 SELECT * FROM Positions;
 SELECT * FROM Locations;
 SELECT * FROM Staff;
 SELECT * FROM PhoneNum;
 SELECT * FROM PositionList;
 SELECT * FROM Edges;
 SELECT * FROM Path;
 SELECT * FROM Route;
 SELECT * FROM Floor;
 
*/