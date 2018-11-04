DROP TRIGGER insert_payment_atsite;
CREATE OR REPLACE TRIGGER insert_payment_atsite
AFTER INSERT ON Payment FOR EACH ROW 
WHEN (NEW.pay_id> 0)

DECLARE
	branch varchar2(20);
	cursor cur is select branch from Patient where pid = :NEW.pid;
BEGIN
	open cur;
	fetch cur into branch;
	close cur;
	IF branch = 'Gulshan' THEN
		insert into Payment @Gulshan values(:New.pay_id,:New.pid,:New.pay_type,:New.pay_date,:New.amount,:New.status);
	/*ELSIF branch = 'Dhanmondi' THEN
		insert into Payment @Dhanmondi values(:New.pay_id,:New.pid,:New.pay_type,:New.pay_date,:New.amount,:New.status);*/
	END IF;
END;
/