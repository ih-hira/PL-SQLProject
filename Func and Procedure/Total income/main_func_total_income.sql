set serveroutput on;
DECLARE
	tot_income integer;
BEGIN
	
	tot_income:=total_income('1-JUN-18','30-JUN-18');
	dbms_output.put_line('Total Bill of given date: '||tot_income);
	
END;
/