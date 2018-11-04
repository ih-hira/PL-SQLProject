CREATE OR REPLACE PROCEDURE
bill_generate(p_id integer,pay_method varchar2,p_date varchar2) 
IS
	total_bill integer;
	bill_no integer;
	
	cursor c1 IS
	select bill_id from bill;
	
BEGIN
	total_bill :=0;
	open c1;
	total_bill := count_total_bill(p_id);
	loop
		fetch c1 into bill_no;
		exit when c1%NOTFOUND;
	end loop;
	close c1;
	
	bill_no := bill_no+1;
	
	insert into bill values(bill_no,p_id,pay_method,total_bill,p_date);
	
	update Payment set status ='Paid' where pid=p_id;
	
	commit;
	
END;
/