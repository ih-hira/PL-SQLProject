create or replace function 
total_income(start_date in varchar2, end_date in varchar2)
return integer
IS
	total_amount integer;
	temp_amount integer;
	temp_date varchar2(50);
	
	cursor cur is
	select total,bill_date from bill
	where bill_date>=start_date and bill_date<= end_date order by bill_date asc;

BEGIN
	
	open cur;
	total_amount:= 0;
	loop
		fetch cur into temp_amount,temp_date;
		exit when cur%notfound;
		total_amount := total_amount + temp_amount;
	end loop;
	close cur;
	return total_amount;
END;
/