CREATE OR REPLACE PROCEDURE
update_employee_info(emp_id integer,emp_name varchar2,emp_gen varchar2,emp_age varchar2,
emp_dept varchar2,emp_qual varchar2,emp_exp varchar2,emp_add varchar2,emp_cont varchar2,
emp_sal integer,emp_brnch varchar2)
IS

BEGIN
	INSERT INTO Employee values(emp_id,emp_name,emp_gen,emp_age,emp_dept,emp_qual,emp_exp,
		emp_add,emp_cont,emp_sal,emp_brnch);
		
	IF emp_brnch='Gulshan' THEN
		INSERT INTO Employee @Gulshan values(emp_id,emp_name,emp_gen,emp_age,emp_dept,emp_qual,emp_exp,
		emp_add,emp_cont,emp_sal,emp_brnch);
		DELETE FROM Employee @Dhanmondi WHERE empid = emp_id;
	
	ELSIF emp_brnch='Dhanmondi' THEN
		INSERT INTO Employee @Dhanmondi values(emp_id,emp_name,emp_gen,emp_age,emp_dept,emp_qual,emp_exp,
		emp_add,emp_cont,emp_sal,emp_brnch);
		DELETE FROM Employee @Gulshan WHERE empid = emp_id;
		
	END IF;
	
	COMMIT;
END;
/