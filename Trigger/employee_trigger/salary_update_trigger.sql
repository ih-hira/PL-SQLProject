SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER salary_update_trigger
AFTER UPDATE OF salary ON Employee
FOR EACH ROW 


DECLARE 

   msg varchar(100):= 'salary have been updated !!!'; 
BEGIN 
    dbms_output.put_line(msg);
	dbms_output.put_line('Old salary: ' || :OLD.salary); 
    dbms_output.put_line('New salary: ' || :NEW.salary); 
	
END; 
/ 

--update Employee set salary=40000 where empid=4001;