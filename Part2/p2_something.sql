drop table PathEdge; 
drop table Path;
drop table Edge;
drop table Office;
drop table StaffPhone;
drop table StaffPosition;
drop table Phone;
drop table Staff;
drop table Position;
drop table Location;

create table Location(
    locationID varchar2(50) Primary Key, 
    locationName varchar2(50),
    locationType varchar2(50),
    xcoord number(6, 0),
    ycoord number(6, 0),
    floor varchar2(1),
    CONSTRAINT CK_Location_Floor CHECK (floor IN ('B', '1', '2', '3')),
    Constraint UQ_StaffPosition_Position Unique (xcoord, ycoord, floor)
    
);

create table Staff(
    accountName varchar2(50) Primary Key,
    firstName varchar2(50) Not Null,
    lastName varchar2(50) Not Null,
    locationID varchar(50),
    Constraint FK_Staff_LocationID Foreign Key (locationID) References Location (locationID)

);


create table Phone(
    phoneNumber varchar2(20) Primary Key
);

create table StaffPhone(
    accountName varchar2(50),
    phoneNumber varchar2(20),
    Constraint FK_StaffPhone_AccountName Foreign Key (accountName) References Staff (accountName),
    Constraint FK_StaffPhone_PhoneNumber Foreign Key (phoneNumber) References Phone (phoneNumber)

);

create table Position(
    positionID varchar2(50) Primary Key,
    title varchar2(50),
    payGrade number(2,0),
    CONSTRAINT CK_Position_PayGrade CHECK (payGrade BETWEEN 0 AND 10)
);

create table StaffPosition(
    accountName varchar2(50),
    positionID varchar2(50),
    Constraint FK_StaffPosition_AccountName Foreign Key (accountName) References Staff (accountName),
    Constraint FK_StaffPosition_PositionID Foreign Key (positionID) References Position (positionID)

);


create table Office(
    locationID varchar2(50) Primary Key,
    maxOccupancy number(2),
    Constraint FK_Office_LocationID Foreign Key (locationID) References Location (locationID)

);

create table Edge(
    startingID varchar2(50),
    endingID varchar2(50),
    Constraint PK_Edge Primary Key (startingID, endingID),
    Constraint FK_Edge_StartingID Foreign Key (startingID) References Location (locationID),
    Constraint FK_Edge_EndingID Foreign Key (endingID) References Location (locationID)
);

create table Path(
    pathID varchar2(50) Primary Key
);


create table PathEdge(
    pathID varchar2(50),
    startingID varchar2(50),
    endingID varchar2(50),
    sequenceNumber number(3, 0),
    Constraint PK_PathEdge Primary Key (pathID, startingID, endingID),
    Constraint FK_PathEdge_PathID Foreign Key (pathID) References Path (pathID),
    Constraint FK_PathEdge_StartEndIDs Foreign Key (startingID, endingID) References Edge (startingID, endingID)

);

Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('ASSOCARCHIVIST','Associate Archivist',5);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('DOCENT','Docent',0);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('ASSTCURATOR','Assistant Curator',4);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('ASSTARCHIVIST','Assistant Archivist',3);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('ASSOCCURATOR','Associate Curator',6);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('COORDEXHIBITS','Coordinator of Exhibits',9);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('DEPTHEAD','Department Head',10);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('DIRARTS','Director of Arts',9);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('DIRHISTORY','Director of History',9);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('COORDDESIGN','Coordinator of Design',8);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('ADMIN1','Administrative Assistant I',1);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('ADMIN2','Administrative Assistant II',2);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('CURATOR','Curator',7);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('HISTORIAN','Historian',6);
Insert into POSITION (POSITIONID,TITLE,PAYGRADE) values ('ARCHIVIST','Archivist',7);

Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('201A','201A','Office',640,200,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('201B','201B','Office',575,200,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('201C','201C','Office',465,200,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('202','202','Gallery',395,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('202A','202A','Office',70,405,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('202B','202B','Office',170,405,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('202C','202C','Office',275,405,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('202D','202D','Office',380,405,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('202E','202E','Office',465,405,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('203','203','Gallery',885,340,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('204','204 Lovecraft Room','Conference Room',980,340,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('205','205','Office',465,340,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('206','206','Office',1380,200,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('207','207','Office',1250,200,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('208','208','Closet',1075,200,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('209','209 Museum Guides','Office',1015,200,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('S2','2nd Floor Stairs','Stairs',815,160,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H201','Hallway 201','Hallway',70,350,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H202','Hallway 202','Hallway',170,350,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H203','Hallway 203','Hallway',275,350,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H204','Hallway 204','Hallway',380,350,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H205','Hallway 205','Hallway',465,350,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H206','Hallway 206','Hallway',465,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H207','Hallway 207','Hallway',575,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H208','Hallway 208','Hallway',640,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H209','Hallway 209','Hallway',815,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H210','Hallway 210','Hallway',885,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H211','Hallway 211','Hallway',980,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H212','Hallway 212','Hallway',1015,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H213','Hallway 213','Hallway',1075,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H214','Hallway 214','Hallway',1250,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H215','Hallway 215','Hallway',1380,270,2);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('302A','302A','Office',440,215,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('302B','302B','Office',580,215,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('303','303','Office',350,215,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('304','304','Conference Room',275,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('305A','305A','Office',340,425,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('305B','305B','Office',240,425,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('305C','305C','Office',175,425,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('305D','305D','Office',30,425,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('306','306','Gallery',475,335,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('307','307','Office',975,410,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('308','308','Gallery',1040,365,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('309','309','Gallery',1040,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('M','Men''s Restroom','Restroom',960,215,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('W','Women''s Restroom','Restroom',650,215,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('S3','3rd Floor Stairs','Stairs',780,85,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H301','Hallway 301','Hallway',30,360,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H302','Hallway 302','Hallway',175,360,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H303','Hallway 303','Hallway',240,360,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H304','Hallway 304','Hallway',340,360,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H305','Hallway 305','Hallway',380,360,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H306','Hallway 306','Hallway',350,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H307','Hallway 307','Hallway',380,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H308','Hallway 308','Hallway',440,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H309','Hallway 309','Hallway',475,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H310','Hallway 310','Hallway',580,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H311','Hallway 311','Hallway',650,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H312','Hallway 312','Hallway',780,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H313','Hallway 313','Hallway',960,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H314','Hallway 314','Hallway',975,265,3);
Insert into LOCATION (LOCATIONID,LOCATIONNAME,LOCATIONTYPE,XCOORD,YCOORD,FLOOR) values ('H315','Hallway 315','Hallway',975,365,3);


Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('fargo','Caroline', 'Fargo','205');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('rick','Charles', 'Rick','305C');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('arko','Christine', 'Arko','209');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('shoe','Sam', 'Shoe','206');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('williams','Mark', 'Williams','207');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('dixon','Dewayne', 'Dixon','305A');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('rodriguez','Douglas', 'Rodriguez','202E');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('stein','Eli', 'Stein','202A');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('lin','Amy', 'Lin','202D');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('hirsch','George', 'Hirsch','305B');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('pine','Katherine', 'Pine','201C');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('landry','Hugh', 'Landry','202E');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('simmons','Moesha', 'Simmons','302B');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('brown','Eva', 'Brown','202C');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('fischer','Emily', 'Fischer','201B');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('mehta','Gaurav', 'Mehta','202B');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('clay','Mark', 'Clay','307');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('hofstra','Michelle', 'Hostra','205');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('haring','Tom', 'Haring','201A');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('jones','Kiki', 'Jones','303');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('isa','Mohamed', 'Isa','207');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('holmes','Neil', 'Holmes','206');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('ford','Nicole', 'Ford','209');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('rcane','Ralph', 'Cane','209');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('ganoon','Griffin', 'Ganoon','302A');
Insert into STAFF (ACCOUNTNAME,FIRSTNAME, LASTNAME,LOCATIONID) values ('tam','William', 'Tam','305D');


Insert into PHONE (PHONENUMBER) values ('2140');
Insert into PHONE (PHONENUMBER) values ('2445');
Insert into PHONE (PHONENUMBER) values ('2178');
Insert into PHONE (PHONENUMBER) values ('1433');
Insert into PHONE (PHONENUMBER) values ('4357');
Insert into PHONE (PHONENUMBER) values ('4622');
Insert into PHONE (PHONENUMBER) values ('2121');
Insert into PHONE (PHONENUMBER) values ('1993');
Insert into PHONE (PHONENUMBER) values ('2315');
Insert into PHONE (PHONENUMBER) values ('2068');
Insert into PHONE (PHONENUMBER) values ('2002');
Insert into PHONE (PHONENUMBER) values ('1752');
Insert into PHONE (PHONENUMBER) values ('2322');
Insert into PHONE (PHONENUMBER) values ('2656');
Insert into PHONE (PHONENUMBER) values ('1618');
Insert into PHONE (PHONENUMBER) values ('3071');
Insert into PHONE (PHONENUMBER) values ('1909');
Insert into PHONE (PHONENUMBER) values ('3411');
Insert into PHONE (PHONENUMBER) values ('1617');
Insert into PHONE (PHONENUMBER) values ('3669');
Insert into PHONE (PHONENUMBER) values ('2674');
Insert into PHONE (PHONENUMBER) values ('2921');
Insert into PHONE (PHONENUMBER) values ('2069');
Insert into PHONE (PHONENUMBER) values ('1857');
Insert into PHONE (PHONENUMBER) values ('2206');

Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('fargo','2140');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('rick','2445');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('arko','2178');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('shoe','1433');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('williams','4357');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('williams','4622');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('dixon','2121');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('rodriguez','1993');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('stein','2315');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('lin','2068');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('hirsch','2002');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('pine','1752');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('landry','1993');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('simmons','2322');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('brown','2656');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('fischer','1618');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('mehta','3071');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('clay','1909');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('hofstra','3411');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('haring','1617');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('jones','3669');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('jones','2674');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('isa','2921');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('holmes','2069');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('ford','1857');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('rcane','1857');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('ganoon','1857');
Insert into STAFFPHONE (ACCOUNTNAME,PHONENUMBER) values ('tam','2206');


Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('201A', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('201B', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('201C', 2);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('202A', 2);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('202B', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('202C', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('202D', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('202E', 2);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('205', 2);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('206', 3);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('207', 2);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('209', 5);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('302A', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('302B', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('303', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('305A', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('305B', 2);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('305C', 1);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('305D', 3);
Insert into OFFICE (LOCATIONID, MAXOCCUPANCY) values('307', 1);

Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('fargo','ASSOCCURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('rick','CURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('arko','DOCENT');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('shoe','ASSOCCURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('williams','CURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('williams','DEPTHEAD');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('dixon','CURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('rodriguez','ASSTARCHIVIST');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('stein','CURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('stein','DIRARTS');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('lin','ASSOCCURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('lin','COORDEXHIBITS');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('hirsch','ASSOCCURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('pine','HISTORIAN');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('landry','ARCHIVIST');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('simmons','ADMIN1');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('brown','ASSOCCURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('fischer','CURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('mehta','ASSTCURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('clay','CURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('hofstra','CURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('haring','HISTORIAN');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('jones','ADMIN2');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('isa','ASSOCCURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('holmes','CURATOR');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('holmes','DIRHISTORY');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('ford','DOCENT');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('rcane','COORDDESIGN');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('ganoon','ASSOCARCHIVIST');
Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('tam','ASSTARCHIVIST');

select * from StaffPosition order by accountName;

select * from StaffPhone order by accountName;

select * from Phone order by phoneNumber;

select * from Staff order by accountName;

select * from Position order by positionID;

select * from Location order by locationID;

select * from Office order by locationID;

Insert into Edge(startingID, endingID) values ('202A', 'H201');
Insert into Edge(startingID, endingID) values ('H201', '202A');
Insert into Edge(startingID, endingID) values ('H201', 'H202');
Insert into Edge(startingID, endingID) values ('H202', 'H201');
Insert into Edge(startingID, endingID) values ('H202', '202B');
Insert into Edge(startingID, endingID) values ('202B', 'H202');
Insert into Edge(startingID, endingID) values ('H202', 'H203');
Insert into Edge(startingID, endingID) values ('H203', 'H202');
Insert into Edge(startingID, endingID) values ('H203', '202C');
Insert into Edge(startingID, endingID) values ('202C', 'H203');
Insert into Edge(startingID, endingID) values ('H203', 'H204');
Insert into Edge(startingID, endingID) values ('H204', 'H203');
Insert into Edge(startingID, endingID) values ('H204', '202D');
Insert into Edge(startingID, endingID) values ('202D', 'H204');
Insert into Edge(startingID, endingID) values ('H204', 'H205');
Insert into Edge(startingID, endingID) values ('H205', '202E');
Insert into Edge(startingID, endingID) values ('202E', 'H205');
Insert into Edge(startingID, endingID) values ('H205', 'H206');
Insert into Edge(startingID, endingID) values ('H206', '202');
Insert into Edge(startingID, endingID) values ('202', 'H206');
Insert into Edge(startingID, endingID) values ('H206', '201C');
Insert into Edge(startingID, endingID) values ('201C', 'H206');
Insert into Edge(startingID, endingID) values ('H206', 'H207');
Insert into Edge(startingID, endingID) values ('H207', 'H206');
Insert into Edge(startingID, endingID) values ('H207', '201B');
Insert into Edge(startingID, endingID) values ('201B', 'H207');
Insert into Edge(startingID, endingID) values ('H207', 'H208');
Insert into Edge(startingID, endingID) values ('H208', 'H207');
Insert into Edge(startingID, endingID) values ('H208', '201A');
Insert into Edge(startingID, endingID) values ('201A', 'H208');
Insert into Edge(startingID, endingID) values ('H208', 'H209');
Insert into Edge(startingID, endingID) values ('H209', 'H208');
Insert into Edge(startingID, endingID) values ('H209', 'S2');
Insert into Edge(startingID, endingID) values ('S2', 'H209');
Insert into Edge(startingID, endingID) values ('H209', 'H210');
Insert into Edge(startingID, endingID) values ('H210', 'H209');
Insert into Edge(startingID, endingID) values ('H210', '203');
Insert into Edge(startingID, endingID) values ('203', 'H210');
Insert into Edge(startingID, endingID) values ('H210', 'H211');
Insert into Edge(startingID, endingID) values ('H211', 'H210');
Insert into Edge(startingID, endingID) values ('H211', '204');
Insert into Edge(startingID, endingID) values ('204', 'H211');
Insert into Edge(startingID, endingID) values ('H211', 'H212');
Insert into Edge(startingID, endingID) values ('H212', 'H211');
Insert into Edge(startingID, endingID) values ('H212', '209');
Insert into Edge(startingID, endingID) values ('209', 'H212');
Insert into Edge(startingID, endingID) values ('H212', 'H213');
Insert into Edge(startingID, endingID) values ('H213', 'H212');
Insert into Edge(startingID, endingID) values ('H213', '208');
Insert into Edge(startingID, endingID) values ('208', 'H213');
Insert into Edge(startingID, endingID) values ('H213', 'H214');
Insert into Edge(startingID, endingID) values ('H214', 'H213');
Insert into Edge(startingID, endingID) values ('H214', '207');
Insert into Edge(startingID, endingID) values ('207', 'H214');
Insert into Edge(startingID, endingID) values ('H214', 'H215');
Insert into Edge(startingID, endingID) values ('H215', 'H214');
Insert into Edge(startingID, endingID) values ('H215', '206');
Insert into Edge(startingID, endingID) values ('206', 'H215');
Insert into Edge(startingID, endingID) values ('H215', '205');
Insert into Edge(startingID, endingID) values ('205', 'H215');

Insert into Edge(startingID, endingID) values ('S2', 'S3');
Insert into Edge(startingID, endingID) values ('S3', 'S2');

Insert into Edge(startingID, endingID) values ('305D', 'H301');
Insert into Edge(startingID, endingID) values ('H301', '305D');
Insert into Edge(startingID, endingID) values ('H301', 'H302');
Insert into Edge(startingID, endingID) values ('H302', 'H301');
Insert into Edge(startingID, endingID) values ('H302', '305C');
Insert into Edge(startingID, endingID) values ('305C', 'H302');
Insert into Edge(startingID, endingID) values ('H302', 'H303');
Insert into Edge(startingID, endingID) values ('H303', 'H302');
Insert into Edge(startingID, endingID) values ('H303', '305B');
Insert into Edge(startingID, endingID) values ('305B', 'H303');
Insert into Edge(startingID, endingID) values ('H303', 'H304');
Insert into Edge(startingID, endingID) values ('H304', 'H303');
Insert into Edge(startingID, endingID) values ('H304', '305A');
Insert into Edge(startingID, endingID) values ('305A', 'H304');
Insert into Edge(startingID, endingID) values ('H304', 'H305');
Insert into Edge(startingID, endingID) values ('H305', 'H304');
Insert into Edge(startingID, endingID) values ('H305', 'H307');
Insert into Edge(startingID, endingID) values ('H307', 'H305');
Insert into Edge(startingID, endingID) values ('H307', 'H306');
Insert into Edge(startingID, endingID) values ('H306', 'H307');
Insert into Edge(startingID, endingID) values ('H306', '304');
Insert into Edge(startingID, endingID) values ('304', 'H306');
Insert into Edge(startingID, endingID) values ('H306', '303');
Insert into Edge(startingID, endingID) values ('303', 'H306');
Insert into Edge(startingID, endingID) values ('H307', 'H308');
Insert into Edge(startingID, endingID) values ('H308', 'H307');
Insert into Edge(startingID, endingID) values ('H308', '302A');
Insert into Edge(startingID, endingID) values ('302A', 'H308');
Insert into Edge(startingID, endingID) values ('H308', 'H309');
Insert into Edge(startingID, endingID) values ('H309', 'H308');
Insert into Edge(startingID, endingID) values ('H309', '306');
Insert into Edge(startingID, endingID) values ('306', 'H309');
Insert into Edge(startingID, endingID) values ('H309', 'H310');
Insert into Edge(startingID, endingID) values ('H310', 'H309');
Insert into Edge(startingID, endingID) values ('H310', '302B');
Insert into Edge(startingID, endingID) values ('302B', 'H310');
Insert into Edge(startingID, endingID) values ('H310', 'H311');
Insert into Edge(startingID, endingID) values ('H311', 'H310');
Insert into Edge(startingID, endingID) values ('H311', 'W');
Insert into Edge(startingID, endingID) values ('W', 'H311');
Insert into Edge(startingID, endingID) values ('H311', 'H312');
Insert into Edge(startingID, endingID) values ('H312', 'H311');
Insert into Edge(startingID, endingID) values ('H312', 'S3');
Insert into Edge(startingID, endingID) values ('S3', 'H312');
Insert into Edge(startingID, endingID) values ('H312', 'H313');
Insert into Edge(startingID, endingID) values ('H313', 'H312');
Insert into Edge(startingID, endingID) values ('H313', 'M');
Insert into Edge(startingID, endingID) values ('M', 'H313');
Insert into Edge(startingID, endingID) values ('H313', 'H314');
Insert into Edge(startingID, endingID) values ('H314', 'H313');
Insert into Edge(startingID, endingID) values ('H314', '309');
Insert into Edge(startingID, endingID) values ('309', 'H314');
Insert into Edge(startingID, endingID) values ('H314', 'H315');
Insert into Edge(startingID, endingID) values ('H315', 'H314');
Insert into Edge(startingID, endingID) values ('H315', '308');
Insert into Edge(startingID, endingID) values ('308', 'H315');
Insert into Edge(startingID, endingID) values ('H315', '307');
Insert into Edge(startingID, endingID) values ('307', 'H315');

select * from Edge;

insert into Path(pathID) values ('305B_M');
insert into Path(pathID) values ('S2_206');
insert into Path(pathID) values ('202E_307');

select * from Path;

insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', '305B', 'H303', 1);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H303', 'H304', 2);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H304', 'H305', 3);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H305', 'H307', 4);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H307', 'H308', 5);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H308', 'H309', 6);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H309', 'H310', 7);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H310', 'H311', 8);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H311', 'H312', 9);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H312', 'H313', 10);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('305B_M', 'H313', 'M', 11);

insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('S2_206', 'S2', 'H209', 1);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('S2_206', 'H209', 'H210', 2);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('S2_206', 'H210', 'H211', 3);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('S2_206', 'H211', 'H212', 4);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('S2_206', 'H212', 'H213', 5);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('S2_206', 'H213', 'H214', 6);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('S2_206', 'H214', 'H215', 7);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('S2_206', 'H215', '206', 8);

insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', '202E', 'H205', 1);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'H205', 'H206', 2);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'H206', 'H207', 3);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'H207', 'H208', 4);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'H208', 'H209', 5);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'H209', 'S2', 6);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'S2', 'S3', 7);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'S3', 'H312', 8);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'H312', 'H313', 9);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'H313', 'H314', 10);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'H314', 'H315', 11);
insert into PathEdge(pathID, startingID, endingID, sequenceNumber) values ('202E_307', 'H315', '307', 12);

select * from PathEdge order by pathID, sequenceNumber;

DROP PROCEDURE StaffInOffice;

-- This is the right query
SELECT Location.locationID, maxOccupancy, COUNT(accountName) FROM Location
JOIN Office
ON Location.locationID = Office.locationID
JOIN Staff
ON Location.locationID = Staff.locationID
GROUP BY Location.locationID, maxOccupancy;

CREATE OR REPLACE PROCEDURE StaffInOffice (locationID_in IN varchar2) IS
BEGIN

    -- Gets the location matching the inputID
    SELECT Location.locationID, maxOccupancy, COUNT(accountName)  FROM Location
    JOIN Office
    ON Location.locationID = Office.locationID
    JOIN Staff
    ON Location.locationID = Staff.locationID
    WHERE Location.locationID = locationID_in
    GROUP BY Location.locationID, maxOccupancy;
    
    -- Output
    dbms_output.put_line(locationID_in);
    
    -- Exception
    
END;
/


EXECUTE StaffInOffice('207');

CREATE OR REPLACE TRIGGER MustBeOffice
BEFORE INSERT OR UPDATE ON Location
FOR EACH ROW
DECLARE locationTypeVar varchar2(50);
BEGIN 
SELECT locationType  INTO locationTypeVar FROM Location 
JOIN Office 
ON Office.locationID = Location.locationID
WHERE Location.locationType = 'Office';
IF locationTypeVar != 'Office' THEN
RAISE_APPLICATION_ERROR(-20004, 'Cannot make non office room into an office,');
END IF;
END;

CREATE OR REPLACE TRIGGER JobLimit
AFTER INSERT OR UPDATE ON StaffPosition
DECLARE jobTotal number;
BEGIN
SELECT COUNT(positionID) INTO jobTotal FROM StaffPosition 
GROUP BY accountName;
IF jobTotal > 3 THEN
RAISE_APPLICATION_ERROR(-20004, 'Employee cannot have more than 3 jobs');
END IF;
END;
/

DROP TRIGGER JobLimit;

CREATE OR REPLACE TRIGGER TestTrigger
AFTER INSERT OR UPDATE ON StaffPosition
BEGIN
dbms_output.put_line('testing');
END;
/

Insert into STAFFPOSITION (ACCOUNTNAME,POSITIONID) values ('williams','ASSOCCURATOR');

SELECT accountName, COUNT(positionID) FROM StaffPosition
GROUP BY accountName;

CREATE OR REPLACE PROCEDURE StaffInOffice (locationID_in IN varchar2) IS locationVar varchar2(50);
BEGIN
SELECT Location.locationID, maxOccupancy, COUNT(accountName) INTO locationVar FROM Location
    JOIN Office
    ON Location.locationID = Office.locationID
    JOIN Staff
    ON Location.locationID = Staff.locationID
    WHERE Location.locationID = locationID_in
    GROUP BY Location.locationID, maxOccupancy;
END;
/