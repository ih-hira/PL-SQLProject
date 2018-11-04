set serveroutput on

declare
v_deptname department.deptname%TYPE;
v_building department.building%TYPE;
v_deptinfo department.deptinfo%TYPE;

v_docid doctor.docid%TYPE;
v_name doctor.name%TYPE;
v_spec doctor.spec%TYPE;
v_email doctor.email%TYPE;
v_charge doctor.charge%TYPE;

cursor doc_cur is
select docid,name,spec,email,charge 
from doctor1  
where deptid = 202;


begin

open doc_cur();

select deptname,building,deptinfo into  v_deptname,v_building,v_deptinfo
from department1 @Gulshan
where deptid = 202;

insert into department2 @Dhanmondi values (202,v_deptname,v_building,v_deptinfo,'Dhanmondi');

delete department1 @Gulshan where deptid = 202;

loop 
  fetch doc_cur into v_docid,v_name,v_spec,v_email,v_charge;
  exit when doc_cur%NOTFOUND;
  insert into doctor2 @Dhanmondi values (v_docid,v_name,202,v_spec,v_email,v_charge);
  delete doctor1 @Gulshan where deptid = 202;
  
end loop; 
close doc_cur;
   

commit;
end;
/