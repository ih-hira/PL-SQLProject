SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER building_update_trigger
AFTER UPDATE OF building ON Department
FOR EACH ROW 


DECLARE 

   msg varchar(100):= 'building no have been updated !!!'; 
BEGIN 
    dbms_output.put_line(msg);
	dbms_output.put_line('Old building: ' || :OLD.building); 
    dbms_output.put_line('New building: ' || :NEW.building); 
	
END; 
/ 

--update Department set building='B-6' where deptid=205;