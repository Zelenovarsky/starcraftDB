----stored procedures
--1) insert values into tables(temporary race table only)
CREATE OR REPLACE PROCEDURE insertRace(race_id in NUMBER, race_name in VARCHAR2)
is
begin
INSERT INTO RACE VALUES (race_id,race_name);
end;

--begin
--insertRace(005,'sas');
--end;
----select* from race;
--2) read tables
CREATE OR REPLACE PROCEDURE readTable(tablename in VARCHAR2)
is 
begin
if tablename = 'race' then
select * from race;
else
if tablename = 'unit' then 
select * from unit;
else if tablename = 'building' then
select* from building;
end if;
end if;
end if;
end;
------------------------------------
create or replace procedure getvalues(table in varchar2)
is begin
select * from table
end;

begin
getvalues(race);
end;

---UpdateTables#############################################
create or replace procedure updateTableRace(race_id_for_update in number,new_race_name in varchar2)
is begin

UPDATE race
set race_name = new_race_name
where race_id = race_id_for_update;
end;

--begin
--updateTableRace(005,'updated');
--end;
--select * from race;

--- deleteFromTables#############################################
create or replace procedure deleteFromRace(race_id_for_deletion NUMBER)
is begin
DELETE FROM race where race_id=race_id_for_deletion;
end;

