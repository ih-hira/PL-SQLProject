
DROP TABLE Doctor1;
CREATE TABLE Doctor1(
		docid integer, 
		name varchar2(15),
		deptid integer,
		spec varchar2(20), 
		email varchar2(20),
		charge integer,
			PRIMARY KEY(docid),
			Foreign KEY(docid) REFERENCES Employee(empid),
			Foreign KEY(deptid) REFERENCES Department(deptid));	