DROP TRIGGER deduct_quantity;
CREATE OR REPLACE TRIGGER deduct_quantity
AFTER INSERT ON medicine FOR EACH ROW 
WHEN (NEW.quantity > 0)
DECLARE
	new_quan integer;
	prv_quan integer;
	branch varchar2(10);
	cursor cur is select quantity,branch from pharmacy where drugid = :NEW.drugid;
BEGIN
	open cur;
	fetch cur into prv_quan,branch;
	close cur;
	new_quan:= prv_quan - :NEW.quantity;
	UPDATE pharmacy SET quantity = new_quan WHERE
	drugid = :NEW.drugid;
	
	IF branch='Gulshan' THEN
		insert into medicine @Gulshan values(:New.pid,:New.drugid,:New.name,:New.quantity,:New.price);
		UPDATE pharmacy @Gulshan SET quantity = new_quan WHERE drugid = :NEW.drugid;
	
	/*ELSIF branch='Dhanmondi' THEN
		insert into medicine @Dhanmondi values(:New.pid,:New.drugid,:New.name,:New.quantity,:New.price);
		UPDATE pharmacy @Dhanmondi SET quantity = new_quan WHERE drugid = :NEW.drugid;*/
		
	END IF;
	
END;
/