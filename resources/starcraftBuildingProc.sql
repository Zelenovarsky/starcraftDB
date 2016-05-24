CREATE or REPLACE Procedure insertBuilding(building_id in number, building_name in varchar2, gas in int, minerals in int, race_id in number)
is begin
insert into BUILDING values (building_id, building_name, gas, minerals, race_id);
end;
---------------------
create or replace procedure updateTableBuilding(building_id_for_update in number,new_gas in int, new_minerals in int)
is begin
Update unit 
set  minerals=new_minerals, gas=new_gas
where building_id=building_id_for_update;
end;
commit;