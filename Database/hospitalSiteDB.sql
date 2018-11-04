clear screen;

DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE Department CASCADE CONSTRAINTS;
DROP TABLE Doctor CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;
DROP TABLE Room CASCADE CONSTRAINTS;
DROP TABLE Nurse CASCADE CONSTRAINTS;
DROP TABLE Payment CASCADE CONSTRAINTS;
DROP TABLE Bill CASCADE CONSTRAINTS;
DROP TABLE Report CASCADE CONSTRAINTS;
DROP TABLE Medical_record CASCADE CONSTRAINTS;
DROP TABLE MyAdmin CASCADE CONSTRAINTS;
DROP TABLE Pharmacy CASCADE CONSTRAINTS;
DROP TABLE Medicine CASCADE CONSTRAINTS;
DROP TABLE Blood_bank CASCADE CONSTRAINTS;
DROP TABLE Information CASCADE CONSTRAINTS;


CREATE TABLE Patient(
		pid integer, 
		name varchar2(15), 
		gender varchar2(8), 
		age integer, 
		blood varchar2(6), 
		address varchar2(20), 
		email varchar2(20), 
		contact varchar2(15),
		branch varchar2(10), 
			PRIMARY KEY(pid));
			
CREATE TABLE Employee(
		empid integer, 
		name varchar2(15), 
		gender varchar2(8), 
		age integer, 
		department varchar2(15),
		qualification varchar2(20),	
		experience varchar2(10),
		address varchar2(20),		
		contact varchar2(15),
		salary integer,
		branch varchar2(10), 
			PRIMARY KEY(empid));	

CREATE TABLE Department(
		deptid integer, 
		deptname varchar2(25), 
		building varchar2(8),
		deptinfo varchar2(20), 
		branch varchar2(10),
			PRIMARY KEY(deptid));
			
CREATE TABLE Doctor(
		docid integer, 
		name varchar2(15),
		deptid integer,
		spec varchar2(20), 
		email varchar2(20),
		charge integer,
			PRIMARY KEY(docid),
			Foreign KEY(docid) REFERENCES Employee(empid),
			Foreign KEY(deptid) REFERENCES Department(deptid));		

			
			
			
CREATE TABLE Appointment(
		serial_no integer, 
		pid integer, 
		docid integer,  
		appdate date, 
		apptime varchar2(10),
		branch varchar2(10),
			PRIMARY KEY(serial_no),
			Foreign KEY(pid) REFERENCES Patient(pid),
			Foreign KEY(docid) REFERENCES Doctor(docid));
			
			
CREATE TABLE Room (
		roomid integer, 
		bedid integer,
		pid integer,
		Status varchar2(6), 
		roomtype varchar2(15), 
		charge integer,
		date_in date,
		date_out date,
		branch varchar2(10),
			PRIMARY KEY(roomid,bedid),
			Foreign KEY(pid) REFERENCES Patient(pid));
			
			
			
CREATE TABLE Nurse(
		nid integer, 
		roomid integer,
		name varchar2(15),
		working_hour varchar2(20), 
			PRIMARY KEY(nid),
			Foreign KEY(nid) REFERENCES Employee(empid));		
			
			
			
CREATE TABLE Payment(
		pay_id integer,
		pid integer,
		pay_type varchar2(20),
		pay_date date,
		amount integer,
		status varchar2(10),
			PRIMARY KEY(pay_id),
			Foreign KEY(pid) REFERENCES Patient(pid));	
			
			
CREATE TABLE Bill(
		bill_id integer,
		pid integer,
		method varchar2(10),
		total integer,
		bill_date date,
			PRIMARY KEY(pid),
			Foreign KEY(pid) REFERENCES Patient (pid));					


CREATE TABLE Report(
		reportid integer,
		rep_type varchar2(20),
		pid integer,
		docid integer,
		repdate date, 
		material varchar2(30),
			PRIMARY KEY(reportid),
			Foreign KEY(pid) REFERENCES Patient(pid),
			Foreign KEY(docid) REFERENCES Doctor(docid));		

CREATE TABLE Medical_record(
		recordid integer,
		reportid integer,
		pid integer,
		past_diag varchar2(20),
		ongoing_cond varchar2(20),
		surgeries  varchar2(20),
		prescribe varchar2(20),
			PRIMARY KEY(recordid,reportid),
			Foreign KEY(reportid) REFERENCES Report(reportid),
			Foreign KEY(pid) REFERENCES Patient(pid));		


			
CREATE TABLE MyAdmin(
		adminid integer,
		name varchar2(10), 
		email varchar2(20),
		pass varchar2(10),
			PRIMARY KEY(adminid),
			Foreign KEY(adminid) REFERENCES Employee (empid));		

			
CREATE TABLE Pharmacy(
		drugid integer,
		name varchar2(20),
		drug_class varchar2(20),
		quantity integer,
		price integer,
		branch varchar2(10),
			PRIMARY KEY(drugid));	
			

CREATE TABLE Medicine(
		pid integer,
		drugid integer,
		name varchar2(20),
		quantity integer,
		price integer,
			PRIMARY KEY(pid,drugid),
			Foreign KEY(pid) REFERENCES Patient(pid),
			Foreign KEY(drugid) REFERENCES Pharmacy(drugid));
			
			
CREATE TABLE Blood_bank(
		blood_id integer,
		blood_type varchar2(10),
		quantity integer,
		info varchar2(20),
		branch varchar2(10),
			PRIMARY KEY(blood_id));
			
			
CREATE TABLE Information(
		info_id integer,
		info_type varchar2(20),
		info varchar2(20),
		branch varchar2(10),
			PRIMARY KEY(info_id));			
						
			
			
	

commit;






