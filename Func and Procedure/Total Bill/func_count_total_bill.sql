CREATE OR REPLACE FUNCTION
count_total_bill(p_id integer) return integer
IS
	total_bill integer;
	
	cursor c1 IS 
	select sum(amount) from payment where pid = p_id;

BEGIN
	total_bill :=0;
	open c1;
	fetch c1 into total_bill;
	close c1;
	return total_bill;
END;
/
	