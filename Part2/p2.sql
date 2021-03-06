--  Students: Tae Hyun Je, Nicholas Wood


--  Question 1

create or replace view NoCurator as
    select L.locationID, S.accountName
    from Location L
    join Staff S
        on L.locationID  = S.locationID
    join StaffPosition SP
        on SP.accountName = S.accountName
    where (L.locationType = 'Office') and (SP.positionID not like '%CURATOR%');
  


-- Question 2

CREATE OR REPLACE PROCEDURE StaffInOffice (location_id IN varchar2) IS
locationVar varchar2(50);
maxOccu number(1);
empCount number(1);
BEGIN
SELECT maxOccupancy, COUNT(accountName), Location.locationID INTO maxOccu, empCount, locationVar FROM Location
JOIN Office
ON Location.locationID = Office.locationID
JOIN Staff
ON Location.locationID = Staff.locationID
WHERE Location.locationID = StaffInOffice.location_id
GROUP BY Location.locationID, maxOccupancy;
dbms_output.put_line('Office: ' || locationVar || ' Max Occupancy: '  || maxOccu || ' Employees Assigned: ' || empCount);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20001,  'Input is an invalid Office');
END;
/

-- Question 3 

create or replace trigger NoSameStartEnd
after insert on Edge
for each row
begin 
    if(:new.startingID = :new.endingID) then
        RAISE_APPLICATION_ERROR(-20004, 'Edge: startingID and endingID cannot be the same');
    end if;
end;
/

-- Question 4 

create or replace trigger OnlyStaircases
after insert on Edge
for each row
begin
    if(SUBSTR(:new.startingID, 1, 1) = 'S' and SUBSTR(:new.endingID, 1, 1) = 'S') then
        if(SUBSTR(:new.startingID, 2, 2) = SUBSTR(:new.endingID, 2, 2)) then
            RAISE_APPLICATION_ERROR(-20005, 'Edge: staircases must be different');
        end if;
    end if;
end;
/


-- Question 5

create or replace Trigger MustBeOffice
before insert on Office
for each row
Declare
    CURSOR OfficeCur IS 
        SELECT locationID, maxOccupancy 
        from Office;
        
    cursor locationCur is
        select locationID, locationName, locationType, xcoord, ycoord
        from Location;

    officeCount number;
    checkPreExisting number;
Begin
    
    for officeRow in OfficeCur loop
        for locationRow in locationCur loop
            if(officeRow.locationID = locationRow.locationID) then
                if(locationRow.locationType != 'Office') then
                    RAISE_APPLICATION_ERROR(-20010, 'There already exists and Office that is not type of Office in Location');
                end if;
            end if;
        end loop;
    end loop;
    
    select count(Location.locationID) into officeCount
    from Location
    where :new.locationID = Location.locationID and Location.locationType != 'Office';

    if(officeCount > 0) then
            RAISE_APPLICATION_ERROR(-20010, 'Cannot have Office that is not Office type');
    end if;
end;
/

-- Question 6 

CREATE OR REPLACE TRIGGER JobLimit
after INSERT OR UPDATE ON StaffPosition
DECLARE 
    jobTotal number;
    
    numberOfPositions number;
    cursor staffPosCount is
        select AccountName, count(positionID) as CNT 
        from StaffPosition
        group by AccountName;
BEGIN
    
    for i in staffPosCount loop
        if(i.CNT > 3) then
            RAISE_APPLICATION_ERROR(-20008, 'An account has more than 3 positions!!!');
        end if;
    end loop;
    
END;
/