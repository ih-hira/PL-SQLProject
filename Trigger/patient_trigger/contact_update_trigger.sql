SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER contact_update_trigger 
BEFORE UPDATE OF contact ON Patient
FOR EACH ROW 


DECLARE 

   msg varchar(100):= 'Contact will be updated !!!'; 
BEGIN 
    dbms_output.put_line(msg);
	dbms_output.put_line('Old contact: ' || :OLD.contact); 
    dbms_output.put_line('New contact: ' || :NEW.contact); 
	
END; 
/ 

--update Patient set contact=6542123 where pid = 1004;