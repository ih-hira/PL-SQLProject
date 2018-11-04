CREATE OR REPLACE PROCEDURE fragmentation_Dhanmondi(table_name IN VARCHAR2,site_name IN VARCHAR2)
IS

BEGIN

	IF table_name='Patient' and site_name='Dhanmondi' THEN
	
	    DELETE from Patient @Dhanmondi where branch='Dhanmondi';
		FOR p IN (select * from Patient where branch= site_name) LOOP
			INSERT INTO Patient @Dhanmondi values(p.pid,p.name,p.gender,p.age,p.blood,p.address,p.email,p.contact,p.branch);
		END LOOP;
		
		
	ELSIF table_name='Employee' and site_name='Dhanmondi' THEN
	
	    DELETE from Employee @Dhanmondi where branch='Dhanmondi';
		FOR e IN (select * from Employee where branch= site_name) LOOP
			INSERT INTO Employee @Dhanmondi values(e.empid,e.name,e.gender,e.age,e.department,e.qualification,e.experience,e.address,e.contact,e.salary,e.branch);
		END LOOP;
		
	ELSIF table_name='Department' and site_name='Dhanmondi' THEN
	
	    DELETE from Department @Dhanmondi where branch='Dhanmondi';
		FOR d IN (select * from Department where branch= site_name) LOOP
			INSERT INTO Department @Dhanmondi values(d.deptid,d.deptname,d.building,d.deptinfo,d.branch);
		END LOOP;
		
	ELSIF table_name='Pharmacy' and site_name='Dhanmondi' THEN
	
	    DELETE from Pharmacy @Dhanmondi where branch='Dhanmondi';
		FOR ph IN (select * from Pharmacy where branch= site_name) LOOP
			INSERT INTO Pharmacy @Dhanmondi values(ph.drugid,ph.name,ph.drug_class,ph.quantity,ph.price,ph.branch);
		END LOOP;
		
    ELSIF table_name='Doctor' and site_name='Dhanmondi' THEN
	
	    DELETE from Doctor @Dhanmondi where branch='Dhanmondi';
		FOR dc IN (select * from Doctor where branch= site_name) LOOP
			INSERT INTO Doctor @Dhanmondi values(dc.docid,dc.name,dc.deptid,dc.spec,dc.email,dc.charge);
		END LOOP;
	
	ELSIF table_name='Appointment' and site_name='Dhanmondi' THEN
	
	    DELETE from Appointment @Dhanmondi where branch='Dhanmondi';
		FOR ap IN (select * from Appointment where branch= site_name) LOOP
			INSERT INTO Appointment @Dhanmondi values(ap.serial_no,ap.pid,ap.docid,ap.appdate,ap.apptime,ap.branch);
		END LOOP;
		
	ELSIF table_name='Room' and site_name='Dhanmondi' THEN
	
	    DELETE from Room @Dhanmondi where branch='Dhanmondi';
		FOR r IN (select * from Room where branch= site_name) LOOP
			INSERT INTO Room @Dhanmondi values(r.roomid, r.bedid, r.pid, r.Status, r.roomtype, r.charge, r.date_in, r.date_out, r.branch);
		END LOOP;
		
	ELSIF table_name='Nurse' and site_name='Dhanmondi' THEN
	
	    DELETE from Nurse @Dhanmondi where branch='Dhanmondi';
		FOR n IN (select * from Nurse where branch= site_name) LOOP
			INSERT INTO Nurse @Dhanmondi values(n.nid, n.roomid, n.name, n.working_hour);
		END LOOP;
		
	ELSIF table_name='Payment' and site_name='Dhanmondi' THEN
	
	    DELETE from Payment @Dhanmondi where branch='Dhanmondi';
		FOR py IN (select * from Payment where branch= site_name) LOOP
			INSERT INTO Payment @Dhanmondi values(py.pay_id, py.pid, py.pay_type, py.amount, py.status);
		END LOOP;
		
	ELSIF table_name='Medicine' and site_name='Dhanmondi' THEN
	
	    DELETE from Medicine @Dhanmondi where branch='Dhanmondi';
		FOR m IN (select * from Medicine where branch= site_name) LOOP
			INSERT INTO Medicine @Dhanmondi values(m.pid, m.drugid, m.name, m.quantity , m.price);
		END LOOP;
	
	END IF;
	
	COMMIT;
	
END;
/
		