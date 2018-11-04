SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER appdate_update_trigger 
BEFORE UPDATE OF appdate ON Appointment
FOR EACH ROW 


DECLARE 

   msg varchar(100):= 'Appointment date will be updated !!!'; 
BEGIN 
    dbms_output.put_line(msg);
	dbms_output.put_line('Old appdate: ' || :OLD.appdate); 
    dbms_output.put_line('New appdate: ' || :NEW.appdate); 
	
END; 
/ 

--update Appointment set appdate='15-June-2018' where serial_no = 101;