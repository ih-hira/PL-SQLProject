SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER email_update_trigger 
BEFORE UPDATE OF email ON Patient
FOR EACH ROW 


DECLARE 

   msg varchar(100):= 'Email will be updated !!!'; 
BEGIN 
    dbms_output.put_line(msg);
	dbms_output.put_line('Old email: ' || :OLD.email); 
    dbms_output.put_line('New email: ' || :NEW.email); 
	
END; 
/ 

--update Patient set email='w@gmail.com' where pid = 1004;