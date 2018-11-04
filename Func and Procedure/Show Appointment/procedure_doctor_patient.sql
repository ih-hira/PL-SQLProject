set serveroutput on;
create or replace procedure
patient_list(doc_id in integer,given_date in varchar2)
IS
	doc_name varchar2(15);
	patient_name varchar2(15);
	appointment_time varchar2(15);
	
	cursor cur1 is 
	select name from doctor where docid = doc_id;

	cursor cur2 is
	
	select name, apptime
	from appointment inner join patient 
	on appointment.pid=patient.pid 
	where appointment.docid=doc_id and appointment.pid in (select pid from appointment where appdate=given_date and docid=doc_id);
	
BEGIN
	open cur1;
	open cur2;
	
	fetch cur1 into doc_name;
	
	close cur1;
	
	dbms_output.put_line('Doctor Name: '||doc_name);
	
	loop
		fetch cur2 into patient_name,appointment_time;
		exit when cur2%notfound;
		
		dbms_output.put_line('Patient Name : ' || patient_name || '   Appointment time : '|| appointment_time);
		
	end loop;
	
	close cur2;
	
END;
/
