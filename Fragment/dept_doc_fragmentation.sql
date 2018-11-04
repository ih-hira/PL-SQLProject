--department1 fragmentation
	declare
	cursor dept1 is select * from department where branch = 'Gulshan';
	data department%ROWTYPE;

	begin
	open dept1;
	loop
		fetch dept1 into data;
		exit when dept1%NOTFOUND;
		insert into department1 @Gulshan values (data.deptid, data.deptname,data.building,data.deptinfo,data.branch);
	end loop;
	close dept1;
	commit;
	end;
	/

	
	--department2 fragmentation
	declare
	cursor dept2 is select * from department where branch = 'Dhanmondi';
	data department%ROWTYPE;

	begin
	open dept2;
	loop
		fetch dept2 into data;
		exit when dept2%NOTFOUND;
		insert into department2 @Dhanmondi values (data.deptid, data.deptname,data.building,data.deptinfo,data.branch);
	end loop;
	close dept2;
	commit;
	end;
	/
	
	
	
	--doctor1 fragment
	--department1 fragmentation
	declare
	cursor doc1 is select doctor.* from doctor left join department1 on doctor.deptid = department1.deptid
	where department1.branch = 'Gulshan';
	data doctor%ROWTYPE;

	begin
	open doc1;
	loop
		fetch doc1 into data;
		exit when doc1%NOTFOUND;
		insert into doctor1 @Gulshan values (data.docid, data.name, data.deptid, data.spec, data.email, data.charge);
	end loop;
	close doc1;
	commit;
	end;
	/
	
	--doctor2 fragment
	--department2 fragmentation
	declare
	cursor doc2 is select doctor.* from doctor left join department2 on doctor.deptid = department2.deptid
	where department2.branch = 'Dhanmondi';
	data doctor%ROWTYPE;

	begin
	open doc2;
	loop
		fetch doc2 into data;
		exit when doc2%NOTFOUND;
		insert into doctor2 @Dhanmondi values (data.docid, data.name, data.deptid, data.spec, data.email, data.charge);
	end loop;
	close doc2;
	commit;
	end;
	/