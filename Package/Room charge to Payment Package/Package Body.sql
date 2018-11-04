CREATE OR REPLACE PACKAGE BODY pkg_room_charge AS
--FUNCTION--
FUNCTION  count_days(p_id in integer) RETURN integer
IS
diff integer;
BEGIN
  
  select (date_out - date_in) into diff
  from Room 
  where pid = p_id;
  
  RETURN diff;

END count_days;
--PROCEDURE--
PROCEDURE insert_room_charge(p_id integer)
IS
    room_bill integer;
	date_difference integer;
	chrg integer;
	pay_no integer;
	stat varchar2(10);
	pay_type varchar2(20);
	c_date varchar2(20);
	
	cursor c1 IS 
	select charge, date_out from room where pid=p_id;
	
	cursor c2 IS
	select pay_id from payment;
	
BEGIN

    room_bill := 0;
	stat :='Not Paid';
	pay_type :='Room Charge';
	
	open c1;
	open c2;
	
	date_difference := pkg_room_charge.count_days(p_id);
	
	fetch c1 into chrg,c_date;
	
	room_bill:= chrg * date_difference;
	
	loop
		fetch c2 into pay_no;
		exit when c2%NOTFOUND;
	end loop;
	
	close c1;
	close c2;
	
	pay_no := pay_no+1;
	
	
	insert into payment values(pay_no,p_id,pay_type,c_date,room_bill,stat);
	
	commit;
	
END insert_room_charge;

END pkg_room_charge;
/