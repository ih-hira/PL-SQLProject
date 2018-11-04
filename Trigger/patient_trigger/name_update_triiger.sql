SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER name_update_trigger
AFTER UPDATE OF name ON Patient
FOR EACH ROW 


DECLARE 

   msg varchar(100):= 'Name have been updated !!!'; 
BEGIN 
    dbms_output.put_line(msg);
	dbms_output.put_line('Old name: ' || :OLD.name); 
    dbms_output.put_line('New name: ' || :NEW.name); 
	
END; 
/ 

--update Patient set name='Rahim' where pid=1004;