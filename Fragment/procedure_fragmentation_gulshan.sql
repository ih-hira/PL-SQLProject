CREATE OR REPLACE PROCEDURE fragmentation_Gulshan(table_name IN VARCHAR2,site_name IN VARCHAR2)
IS

BEGIN

	IF table_name='Patient' and site_name='Gulshan' THEN
	
	    DELETE from Patient @Gulshan where branch='Gulshan';
		FOR p IN (select * from Patient where branch= site_name) LOOP
			INSERT INTO Patient @Gulshan values(p.pid,p.name,p.gender,p.age,p.blood,p.address,p.email,p.contact,p.branch);
		END LOOP;
		
	ELSIF table_name='Employee' and site_name='Gulshan' THEN
	
	    DELETE from Employee @Gulshan where branch='Gulshan';
		FOR e IN (select * from Employee where branch= site_name) LOOP
			INSERT INTO Employee @Gulshan values(e.empid,e.name,e.gender,e.age,e.department,e.qualification,e.experience,e.address,e.contact,e.salary,e.branch);
		END LOOP;
		
	ELSIF table_name='Department' and site_name='Gulshan' THEN
	
	    DELETE from Department @Gulshan where branch='Gulshan';
		FOR d IN (select * from Department where branch= site_name) LOOP
			INSERT INTO Department @Gulshan values(d.deptid,d.deptname,d.building,d.deptinfo,d.branch);
		END LOOP;
	
	ELSIF table_name='Pharmacy' and site_name='Gulshan' THEN
	
	    DELETE from Pharmacy @Gulshan where branch='Gulshan';
		FOR ph IN (select * from Pharmacy where branch= site_name) LOOP
			INSERT INTO Pharmacy @Gulshan values(ph.drugid,ph.name,ph.drug_class,ph.quantity,ph.price,ph.branch);
		END LOOP;
		
	ELSIF table_name='Doctor' and site_name='Gulshan' THEN
	
	    DELETE from Doctor @Gulshan where branch='Gulshan';
		FOR dc IN (select * from Doctor where branch= site_name) LOOP
			INSERT INTO Doctor @Gulshan values(dc.docid,dc.name,dc.deptid,dc.spec,dc.email,dc.charge);
		END LOOP;
	
	ELSIF table_name='Appointment' and site_name='Gulshan' THEN
	
	    DELETE from Appointment @Gulshan where branch='Gulshan';
		FOR ap IN (select * from Appointment where branch= site_name) LOOP
			INSERT INTO Appointment @Gulshan values(ap.serial_no,ap.pid,ap.docid,ap.appdate,ap.apptime,ap.branch);
		END LOOP;
		
	ELSIF table_name='Room' and site_name='Gulshan' THEN
	
	    DELETE from Room @Gulshan where branch='Gulshan';
		FOR r IN (select * from Room where branch= site_name) LOOP
			INSERT INTO Room @Gulshan values(r.roomid, r.bedid, r.pid, r.Status, r.roomtype, r.charge, r.date_in, r.date_out, r.branch);
		END LOOP;
		
	ELSIF table_name='Nurse' and site_name='Gulshan' THEN
	
	    DELETE from Nurse @Gulshan where branch='Gulshan';
		FOR n IN (select * from Nurse where branch= site_name) LOOP
			INSERT INTO Nurse @Gulshan values(n.nid, n.roomid, n.name, n.working_hour);
		END LOOP;
		
	ELSIF table_name='Payment' and site_name='Gulshan' THEN
	
	    DELETE from Payment @Gulshan where branch='Gulshan';
		FOR py IN (select * from Payment where branch= site_name) LOOP
			INSERT INTO Payment @Gulshan values(py.pay_id, py.pid, py.pay_type, py.amount, py.status);
		END LOOP;
		
	ELSIF table_name='Medicine' and site_name='Gulshan' THEN
	
	    DELETE from Medicine @Gulshan where branch='Gulshan';
		FOR m IN (select * from Medicine where branch= site_name) LOOP
			INSERT INTO Medicine @Gulshan values(m.pid, m.drugid, m.name, m.quantity , m.price);
		END LOOP;
		
		
		
	END IF;
	
	COMMIT;
	
END;
/
		