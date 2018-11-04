CREATE OR REPLACE FUNCTION
total_medicine_charge(p_id integer) return integer
IS
	total_charge integer;
	quan integer;
	pri integer;
	
	cursor c1 IS 
	select quantity,price from medicine where pid = p_id;	

BEGIN
	total_charge :=0;
	open c1;
	loop
		fetch c1 into quan,pri;
		exit when c1%NOTFOUND;
		total_charge := total_charge + (quan*pri);
	end loop;
	close c1;
	return total_charge;
END;
/
	