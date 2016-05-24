---unit stored proc
--1) insert values into tables 
CREATE or REPLACE Procedure insertUnit(unit_name in varchar2, gas in int, minerals in int, health in int , 
mana in int, building_id in number, race_id in number) is
begin
insert into UNIT values (newid.nextval,Unit_name,gas,minerals,health,mana,building_id,race_id);
end;

begin
insertUnit('asda',3,3,3,3,1,1);
end;
select* from UNIT;
--2) read tables
--3)updateTableUnit
create or replace procedure updateTableUnit(unit_id_for_update in number,  new_gas in int,new_minerals in int, new_health in int, new_mana in int)
is begin
Update unit 
set  minerals=new_minerals, gas=new_gas, health=new_health, mana=new_mana
where unit_id=unit_id_for_update;
end;
-----------sequence
CREATE SEQUENCE newid
  START WITH 1
  INCREMENT BY 1
  CACHE 150;
commit;
