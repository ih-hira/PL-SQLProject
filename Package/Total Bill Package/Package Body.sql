CREATE OR REPLACE PACKAGE BODY pkg_total_bill AS

--FUNCTION--
FUNCTION count_total_bill(patid integer) return integer IS
	cursor c1 IS
	select sum(amount) from payment where pid = patid;
	tot_bill integer;
BEGIN
	open c1;
	fetch c1 into tot_bill;
	close c1;
	return tot_bill;
END count_total_bill;

--PROCEDURE--
PROCEDURE bill_generate(p_id integer,pay_method varchar2,p_date varchar2) 
IS
	cursor c2 IS
	select bill_id from bill;
	total_bill integer;
	bill_no integer;
BEGIN
	open c2;
	total_bill := pkg_total_bill.count_total_bill(p_id); --Function Called
	loop
		fetch c2 into bill_no;
		exit when c2%NOTFOUND;
	end loop;
	close c2;
	
	bill_no := bill_no+1;
	
	insert into bill values(bill_no,p_id,pay_method,total_bill,p_date);
	
	update Payment set status ='Paid' where pid=p_id;
	
END bill_generate;

END pkg_total_bill;
/