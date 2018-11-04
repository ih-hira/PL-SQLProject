CREATE OR REPLACE PROCEDURE
insert_payment_charge(p_id integer,payment_type varchar2,p_date varchar2,price integer,stat varchar2) 
IS
	pay_no integer;
	
	cursor c1 IS
	select pay_id from Payment;
	
BEGIN
	
	pay_no := 0;
	open c1;
	
	loop
		fetch c1 into pay_no;
		exit when c1%NOTFOUND;
	end loop;
	close c1;
	
	pay_no := pay_no+1;
	
	insert into Payment values(pay_no,p_id,payment_type,p_date,price,stat);
	
	commit;
	
END;
/