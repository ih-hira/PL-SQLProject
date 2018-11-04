--procedure 1
create or replace procedure PatientBill(id IN integer)
is

tid integer:= 0;
cost integer;
r integer; 
d integer;
datet number := 0;
status payment.status%TYPE := 'Not Paid';
begin
  
  select count_days(pid) into datet from Room
  where pid = id;
  
  select max(pay_id) into tid from Payment;

  tid := tid+1;
  
  select charge into r from Room where pid = id;
  
  cost := r * datet;
  
  insert into Payment values(tid,id,'Appointment Charge',CURRENT_DATE,cost,status); 
  
    
end PatientBill;
/

