SET SERVEROUTPUT ON
DECLARE
  id integer;

BEGIN
  id := max_appointment();
  DBMS_OUTPUT.PUT_LINE('Max appointment has been made by patient id:'||id);
  
 
 
END;
/