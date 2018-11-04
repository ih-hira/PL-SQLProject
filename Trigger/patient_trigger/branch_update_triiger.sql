SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER branch_update_trigger 
BEFORE UPDATE OF branch ON Patient
FOR EACH ROW 


DECLARE 

   msg varchar(100):= 'branch will be updated !!!'; 
BEGIN 
    dbms_output.put_line(msg);
	dbms_output.put_line('Old branch: ' || :OLD.branch); 
    dbms_output.put_line('New branch: ' || :NEW.branch); 
	
END; 
/ 

--update Patient set branch='gulshan' where pid = 1004;