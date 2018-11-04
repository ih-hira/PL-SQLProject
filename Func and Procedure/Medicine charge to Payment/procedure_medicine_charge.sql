CREATE OR REPLACE PROCEDURE
insert_medicine_charge(p_id integer,c_date varchar2)
IS
	total_charge integer;
	pay_type varchar2(20);
	pay_no integer;
	stat varchar2(10);
	
	quan integer;
	pri integer;
	
	cursor c1 IS
	select pay_id from payment;

BEGIN
	total_charge :=0;
	stat :='Not Paid';
	pay_type :='Medicine Charge';

	open c1;
	total_charge := total_medicine_charge(p_id);
	loop
		fetch c1 into pay_no;
		exit when c1%NOTFOUND;
	end loop;
	close c1;
	
	pay_no := pay_no+1;
	
	insert into payment values(pay_no,p_id,pay_type,c_date,total_charge,stat);
	commit;
	
END;
/
	