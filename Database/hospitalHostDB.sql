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
						
			
			
			
			
insert into Patient values(1001,'Rahim','Male',49,'O+ve','Dhanmondi','rah@gmail.com','016419732','Gulshan'); 
insert into Patient values(1002,'Mehrab','Male',23,'A+ve','Mirpur','meh@gmail.com','8788560','Gulshan'); 
insert into Patient values(1003,'Proma','Female',18,'B+ve','Panthapath','pro@gmail.com','88614588','Gulshan');
insert into Patient values(1004,'Fahim','Male',25,'A+ve','Dhanmondi','fah@gmail.com','83645545','Gulshan');
insert into Patient values(1005,'Rodoshi','Female',22,'O+ve','Mohammadpur','rodo@gmail.com','01521367','Gulshan');
insert into Patient values(1006,'Sami','Male',32,'O-ve','Gulshan','sam@gmail.com','017146746','Gulshan');
insert into Patient values(1007,'Nadira','Female',37,'O+ve','Uttara','nadu@gmail.com','65466518','Gulshan');
insert into Patient values(1008,'Azwad','Male',47,'B+ve','Mohammadpur','az@gmail.com','88026544','Gulshan');
insert into Patient values(1009,'Sakin','Male',33,'AB+ve','Dhanmondi','sak@gmail.com','02166849','Gulshan');
insert into Patient values(1010,'Ishita','Female',29,'O-ve','Gulshan','ish9@gmail.com','02689868','Gulshan');

insert into Patient values(2001,'Rakib','Male',49,'O+ve','Dhanmondi','rak@gmail.com','016419732','Dhanmondi'); 
insert into Patient values(2002,'Mridul','Male',23,'A+ve','Mirpur','mrid@gmail.com','8788560','Dhanmondi'); 
insert into Patient values(2003,'Prioti','Female',18,'B+ve','Panthapath','prio@gmail.com','88614588','Dhanmondi');
insert into Patient values(2004,'Faiaz','Male',25,'A+ve','Dhanmondi','faaz@gmail.com','83645545','Dhanmondi');
insert into Patient values(2005,'Rupty','Female',22,'O+ve','Mohammadpur','rup@gmail.com','01521367','Dhanmondi');
insert into Patient values(2006,'Sakib','Male',32,'O-ve','Gulshan','sak9@gmail.com','017146746','Dhanmondi');
insert into Patient values(2007,'Nabila','Female',37,'O+ve','Uttara','nabi@gmail.com','65466518','Dhanmondi');
insert into Patient values(2008,'Akbar','Male',47,'B+ve','Mohammadpur','akb@gmail.com','88026544','Dhanmondi');
insert into Patient values(2009,'Selim','Male',33,'AB+ve','Dhanmondi','sel@gmail.com','02166849','Dhanmondi');
insert into Patient values(2010,'Ishrat','Female',29,'O-ve','Gulshan','ish@gmail.com','02689868','Dhanmondi');



insert into Employee values(4001,'Ms. Sheuli','Female',29,'Nurse','BSc','2 years','Dhanmondi','86578564',30000,'Dhanmondi');
insert into Employee values(4002,'Ms. Fatema','Female',33,'Nurse','HSC','2 years','Kurmitola','89638564',25000,'Gulshan');
insert into Employee values(4003,'Jalal Iqbal','Male',35,'Nurse','BSc','3 years','Dhanmondi','013578564',35000,'Dhanmondi');
insert into Employee values(4004,'Ms. Farzana','Female',29,'Nurse','MS','2 years','Kolabagan','89638564',23000,'Gulshan');

insert into Employee values(6001,'Dr. Rizvi','Male',49,'Doctor','(MBBS,MMSc','6 years','Mirpur','8788560',80000,'Gulshan'); 
insert into Employee values(6002,'Prof. Samad','Male',41,'Doctor','(MBBS,MD','4 years','Kolabagan','8788560',70000,'Gulshan'); 
insert into Employee values(6003,'Dr. Rumana','Female',39,'Doctor','(MBBS','2 years','Dhanmondi','8788560',65000,'Gulshan'); 
insert into Employee values(6004,'Dr. Sohrab','Male',51,'Doctor','(MBBS,MD','9 years','Mirpur','8788560',120000,'Gulshan'); 
insert into Employee values(6005,'Dr. Shafiullah','Male',44,'Doctor','(MBBS','5 years','Banani','8788560',85000,'Gulshan'); 
insert into Employee values(6006,'Dr. Aminur','Male',42,'Doctor','(MBBS','4 years','Mirpur','8788560',75000,'Gulshan'); 
insert into Employee values(6007,'Dr. Rahima','Female',49,'Doctor','(MBBS,MS','7 years','Mohammadpur','8788560',85000,'Gulshan'); 

insert into Employee values(7001,'Dr. Alif','Male',49,'Doctor','(MBBS,MMSc','6 years','Mirpur','8788560',80000,'Dhanmondi'); 
insert into Employee values(7002,'Prof. Ayon','Male',41,'Doctor','(MBBS,MD','4 years','Kolabagan','8788560',70000,'Dhanmondi'); 
insert into Employee values(7003,'Dr. Oishi','Female',39,'Doctor','(MBBS','2 years','Dhanmondi','8788560',65000,'Dhanmondi'); 
insert into Employee values(7004,'Dr. Naval','Male',51,'Doctor','(MBBS,MD','9 years','Mirpur','8788560',120000,'Dhanmondi'); 
insert into Employee values(7005,'Dr. Zahir','Male',44,'Doctor','(MBBS','5 years','Banani','8788560',85000,'Dhanmondi'); 
insert into Employee values(7006,'Dr. Khaleq','Male',42,'Doctor','(MBBS','4 years','Mirpur','8788560',75000,'Dhanmondi'); 
insert into Employee values(7007,'Dr. Lima','Female',49,'Doctor','(MBBS,MS','7 years','Mohammadpur','8788560',85000,'Dhanmondi'); 


insert into Employee values(8001,'Md. Ashraf','Male',28,'Receptionist','BSc','2 years','Komolapur','02548560',28000,'Dhanmondi');
insert into Employee values(8002,'Md. Kabir','Male',32,'Receptionist','BSc','2 years','Mirpur','8788560',25000,'Gulshan');

insert into Employee values(1, 'Minhaj','Male',25,'ADMIN','BSc','2 years','Panthapath','02548560',50000,'Dhanmondi');
insert into Employee values(2, 'Adib','Male',23,'ADMIN','BSc','2 years','Mohakhali','02548560',50000,'Gulshan');
insert into Employee values(3, 'Hira','Male',24,'ADMIN','BSc','2 years','Tejgaon','02548560',50000,'Dhanmondi');




insert into Department values(101,'ENT','B-1','Info','Dhanmondi'); 
insert into Department values(102,'Medicine and Cardiology','B-2','Info','Dhanmondi');
insert into Department values(103,'Gynocology','B-2','Info','Dhanmondi');  
insert into Department values(104,'Pediatric and Neonatology','B-2','Info','Dhanmondi'); 
insert into Department values(105,'Anesthesiology','B-1','Info','Dhanmondi'); 
insert into Department values(106,'Burn Unit','B-1','Info','Dhanmondi'); 
insert into Department values(107,'Dermatology','B-2','Info','Dhanmondi'); 
insert into Department values(108,'Orthopedic','B-1','Info','Dhanmondi'); 
insert into Department values(109,'Radiology and Imaging','B-2','Info','Dhanmondi'); 
insert into Department values(110,'Urology','B-1','Info','Dhanmondi'); 

insert into Department values(201,'ENT','B-1','Info','Gulshan'); 
insert into Department values(202,'Medicine and Cardiology','B-2','Info','Gulshan');
insert into Department values(203,'Gynocology','B-2','Info','Gulshan');   
insert into Department values(204,'Anesthesiology','B-1','Info','Gulshan'); 
insert into Department values(205,'Dermatology','B-2','Info','Gulshan'); 
insert into Department values(206,'Neurology','B-2','Info','Gulshan'); 
insert into Department values(207,'Orthopedic','B-1','Info','Gulshan'); 
insert into Department values(208,'Radiology and Imaging','B-2','Info','Gulshan'); 
insert into Department values(209,'Urology','B-1','Info','Gulshan'); 



insert into Doctor values(6001,'Dr. Rizvi',202,'Cardiologist','riz@gmail.com',800); 
insert into Doctor values(6002,'Prof. Samad',201,'ENT','sam@gmail.com',600); 
insert into Doctor values(6003,'Dr. Rumana',203,'Gynecologist','ruma@gmail.com',500); 
insert into Doctor values(6004,'Dr. Sohrab',202,'Cardiologist','soh@gmail.com',1000); 
insert into Doctor values(6005,'Dr. Shafiullah',202,'Medicine','abm@gmail.com',800); 
insert into Doctor values(6006,'Dr. Aminur',208,'Neurologist','amin@gmail.com',700); 
insert into Doctor values(6007,'Dr. Rahima',203,'Gynecologist','rah@gmail.com',800); 

insert into Doctor values(7001,'Dr. Alif',102,'Cardiologist','alf@gmail.com',800); 
insert into Doctor values(7002,'Prof. Ayon',101,'ENT','ayon@gmail.com',600); 
insert into Doctor values(7003,'Dr. Oishi',103,'Gynecologist','oish@gmail.com',500); 
insert into Doctor values(7004,'Dr. Naval',102,'Cardiologist','nav@gmail.com',1000); 
insert into Doctor values(7005,'Dr. Zahir',102,'Medicine','zah@gmail.com',800); 
insert into Doctor values(7006,'Dr. Khaleq',108,'Neurologist','khal@gmail.com',700); 
insert into Doctor values(7007,'Dr. Lima',103,'Gynecologist','lim@gmail.com',800); 


insert into Appointment values(101,1001,6004,'14-June-2018','5 PM','Gulshan'); 
insert into Appointment values(102,1001,6005,'10-June-2018','4 PM','Gulshan'); 
insert into Appointment values(103,1002,6002,'11-June-2018','6 PM','Gulshan'); 
insert into Appointment values(104,1003,6003,'12-June-2018','5 PM','Gulshan'); 
insert into Appointment values(105,1003,6006,'15-June-2018','6 PM','Gulshan'); 
insert into Appointment values(106,1004,6001,'12-June-2018','7 PM','Gulshan'); 
insert into Appointment values(107,1005,6007,'16-June-2018','5 PM','Gulshan'); 
insert into Appointment values(108,1005,6005,'10-June-2018','6 PM','Gulshan'); 
insert into Appointment values(109,1006,6002,'11-June-2018','8 PM','Gulshan'); 
insert into Appointment values(110,1007,6003,'12-June-2018','7 PM','Gulshan'); 
insert into Appointment values(111,1008,6004,'14-June-2018','7 PM','Gulshan'); 
insert into Appointment values(112,1009,6006,'15-June-2018','5 PM','Gulshan'); 
insert into Appointment values(113,1010,6007,'16-June-2018','7 PM','Gulshan'); 
insert into Appointment values(114,1010,6005,'11-June-2018','7 PM','Gulshan'); 

insert into Appointment values(201,2001,7004,'14-June-2018','5 PM','Dhanmondi'); 
insert into Appointment values(202,2001,7005,'10-June-2018','4 PM','Dhanmondi'); 
insert into Appointment values(203,2002,7002,'11-June-2018','6 PM','Dhanmondi'); 
insert into Appointment values(204,2003,7003,'12-June-2018','5 PM','Dhanmondi'); 
insert into Appointment values(205,2003,7006,'15-June-2018','6 PM','Dhanmondi'); 
insert into Appointment values(206,2004,7001,'12-June-2018','7 PM','Dhanmondi'); 
insert into Appointment values(207,2005,7007,'16-June-2018','5 PM','Dhanmondi'); 
insert into Appointment values(208,2005,7005,'10-June-2018','6 PM','Dhanmondi'); 
insert into Appointment values(209,2006,7002,'11-June-2018','8 PM','Dhanmondi'); 
insert into Appointment values(210,2007,7003,'12-June-2018','7 PM','Dhanmondi'); 
insert into Appointment values(211,2008,7004,'14-June-2018','7 PM','Dhanmondi'); 
insert into Appointment values(212,2009,7006,'15-June-2018','5 PM','Dhanmondi'); 
insert into Appointment values(213,2010,7007,'16-June-2018','7 PM','Dhanmondi'); 
insert into Appointment values(214,2010,7005,'11-June-2018','7 PM','Dhanmondi'); 


insert into Room values(1301,1,1003,'1/6','Ward',300,'15-June-2018','20-June-2018','Gulshan'); 
insert into Room values(1401,1,1004,'1/2','Double Bed',500,'13-June-2018','17-June-2018','Gulshan');
insert into Room values(1402,1,1008,'1/2','Double Bed',500,'11-June-2018','19-June-2018','Gulshan');
insert into Room values(1501,1,1005,'1/1','Single Bed',800,'15-June-2018','17-June-2018','Gulshan');
insert into Room values(1502,1,1010,'1/1','Single Bed',800,'14-June-2018','18-June-2018','Gulshan');

insert into Room values(2301,1,2003,'1/6','Ward',300,'15-June-2018','20-June-2018','Dhanmondi'); 
insert into Room values(2401,1,2004,'1/2','Double Bed',500,'13-June-2018','17-June-2018','Dhanmondi');
insert into Room values(2402,1,2008,'1/2','Double Bed',500,'11-June-2018','19-June-2018','Dhanmondi');
insert into Room values(2501,1,2005,'1/1','Single Bed',800,'15-June-2018','17-June-2018','Dhanmondi');
insert into Room values(2502,1,2010,'1/1','Single Bed',800,'14-June-2018','18-June-2018','Dhanmondi');



insert into Nurse values(4001,2301,'Ms. Sheuli','7am-3pm');
insert into Nurse values(4002,1401,'Ms. Fatema','6am-12pm');
insert into Nurse values(4003,2402,'Jalal Iqbal','3pm-12am');
insert into Nurse values(4004,1502,'Ms. Farzana','8pm-6am');



insert into Payment values(1,1001,'Appointment Charge','14-June-2018',1200,'Paid'); 
insert into Payment values(2,1001,'Appointment Charge','10-June-2018',700,'Paid'); 
insert into Payment values(3,1001,'Medicine Charge','10-June-2018',500,'Paid'); 
insert into Payment values(4,1002,'Appointment Charge','11-June-2018',800,'Not Paid'); 
insert into Payment values(5,1003,'Appointment Charge','12-June-2018',600,'Not Paid'); 
insert into Payment values(6,1003,'Appointment Charge','15-June-2018',900,'Not Paid'); 
insert into Payment values(7,1004,'Appointment Charge','12-June-2018',1000,'Not Paid'); 
insert into Payment values(8,1004,'Surgery Charge','15-June-2018',80000,'Not Paid'); 
insert into Payment values(9,1005,'Appointment Charge','16-June-2018',800,'Not Paid'); 
insert into Payment values(10,1005,'Appointment Charge','10-June-2018',700,'Not Paid'); 
insert into Payment values(11,1006,'Appointment Charge','11-June-2018',800,'Not Paid'); 
insert into Payment values(12,1006,'Lab Charge','11-June-2018',600,'Not Paid'); 
insert into Payment values(13,1007,'Appointment Charge','12-June-2018',600,'Not Paid'); 
insert into Payment values(14,1008,'Appointment Charge','14-June-2018',1200,'Not Paid'); 
insert into Payment values(15,1009,'Appointment Charge','15-June-2018',900,'Not Paid'); 
insert into Payment values(16,1010,'Appointment Charge','16-June-2018',800,'Not Paid'); 
insert into Payment values(17,1010,'Appointment Charge','11-June-2018',700,'Not Paid'); 
insert into Payment values(18,1010,'Test Charge','18-June-2018',2400,'Not Paid'); 
insert into Payment values(19,1008,'Medicine Charge','14-June-2018',2200,'Not Paid'); 

insert into Payment values(20,2001,'Appointment Charge','14-June-2018',1200,'Not Paid'); 
insert into Payment values(21,2001,'Appointment Charge','10-June-2018',700,'Not Paid'); 
insert into Payment values(22,2001,'Medicine Charge','10-June-2018',500,'Not Paid'); 
insert into Payment values(23,2002,'Appointment Charge','11-June-2018',800,'Not Paid'); 
insert into Payment values(24,2003,'Appointment Charge','12-June-2018',600,'Not Paid'); 
insert into Payment values(25,2003,'Appointment Charge','15-June-2018',900,'Not Paid'); 
insert into Payment values(26,2004,'Appointment Charge','12-June-2018',1000,'Not Paid'); 
insert into Payment values(27,2004,'Surgery Charge','15-June-2018',80000,'Not Paid'); 
insert into Payment values(28,2005,'Appointment Charge','16-June-2018',800,'Not Paid'); 
insert into Payment values(29,2005,'Appointment Charge','10-June-2018',700,'Not Paid'); 
insert into Payment values(30,2006,'Appointment Charge','11-June-2018',800,'Not Paid'); 
insert into Payment values(31,2006,'Lab Charge','11-June-2018',600,'Not Paid'); 
insert into Payment values(32,2007,'Appointment Charge','12-June-2018',600,'Not Paid'); 
insert into Payment values(33,2008,'Appointment Charge','14-June-2018',1200,'Not Paid'); 
insert into Payment values(34,2009,'Appointment Charge','15-June-2018',900,'Not Paid'); 
insert into Payment values(35,2010,'Appointment Charge','16-June-2018',800,'Paid'); 
insert into Payment values(36,2010,'Appointment Charge','11-June-2018',700,'Paid'); 
insert into Payment values(37,2010,'Test Charge','18-June-2018',2400,'Paid'); 
insert into Payment values(38,2008,'Medicine Charge','14-June-2018',2200,'Not Paid'); 


insert into Bill values(1,1001,'Cash',2400,'14-June-2018'); 
insert into Bill values(2,2010,'Cash',3900,'18-June-2018'); 



insert into Report values(1,'Blood Test',1001,6004,'18-June-2018','material'); 
insert into Report values(2,'MRI Test',1001,6005,'18-June-2018','material'); 
insert into Report values(3,'Xray Test',1002,6002,'21-June-2018','material'); 
insert into Report values(4,'Blood Test',1003,6003,'22-June-2018','material'); 
insert into Report values(5,'Urinalysis',1003,6006,'22-June-2018','material'); 
insert into Report values(6,'MRI Test',1004,6001,'20-June-2018','material'); 
insert into Report values(7,'Blood Test',1005,6005,'22-June-2018','material'); 
insert into Report values(8,'Ultrasonography',1005,6007,'22-June-2018','material'); 
insert into Report values(9,'Xray Test',1006,6002,'19-June-2018','material'); 
insert into Report values(10,'Blood Test',1007,6003,'23-June-2018','material'); 
insert into Report values(11,'Blood Test',1008,6004,'22-June-2018','material'); 
insert into Report values(12,'MRI Test',1009,6006,'25-June-2018','material'); 
insert into Report values(13,'Ultrasonography',1010,6007,'25-June-2018','material'); 
insert into Report values(14,'Blood Test',1010,6005,'25-June-2018','material'); 

insert into Report values(15,'Blood Test',2001,7004,'18-June-2018','material'); 
insert into Report values(16,'MRI Test',2001,7005,'18-June-2018','material'); 
insert into Report values(17,'Xray Test',2002,7002,'21-June-2018','material'); 
insert into Report values(18,'Blood Test',2003,7003,'22-June-2018','material'); 
insert into Report values(19,'Urinalysis',2003,7006,'22-June-2018','material'); 
insert into Report values(20,'MRI Test',2004,7001,'20-June-2018','material'); 
insert into Report values(21,'Blood Test',2005,7005,'22-June-2018','material'); 
insert into Report values(22,'Ultrasonography',2005,7007,'22-June-2018','material'); 
insert into Report values(23,'Xray Test',2006,7002,'19-June-2018','material'); 
insert into Report values(24,'Blood Test',2007,7003,'23-June-2018','material'); 
insert into Report values(25,'Blood Test',2008,7004,'22-June-2018','material'); 
insert into Report values(26,'MRI Test',2009,7006,'25-June-2018','material'); 
insert into Report values(27,'Ultrasonography',2010,7007,'25-June-2018','material'); 
insert into Report values(28,'Blood Test',2010,7005,'25-June-2018','material'); 


insert into Medical_record values(1,1,1001,'No Result','High BP','Sergery on Left','Prescribe'); 
insert into Medical_record values(1,2,1001,'Chest Pain','High BP','Sergery on Left','Prescribe'); 
insert into Medical_record values(2,3,1002,'No Result','Sinus','None','Prescribe'); 
insert into Medical_record values(3,4,1003,'No Result','Pregnant','None','Prescribe'); 
insert into Medical_record values(3,5,1003,'No Result','Pregnant','None','Prescribe'); 
insert into Medical_record values(4,6,1004,'Heart attack','Chest Pain','Ring Sergery','Prescribe'); 
insert into Medical_record values(5,7,1005,'No Result','Pregnant','None','Prescribe'); 
insert into Medical_record values(5,8,1005,'No Result','Pregnant','Sergery','Prescribe'); 
insert into Medical_record values(6,9,1006,'No Result','Hit','None','Prescribe'); 
insert into Medical_record values(7,10,1007,'Skin Desease','Skin problem','None','Prescribe'); 
insert into Medical_record values(8,11,1008,'High BP','Heart Attack','Ring Sergery','Prescribe'); 
insert into Medical_record values(9,12,1009,'No Result','Brain Tumor','None','Prescribe'); 
insert into Medical_record values(10,13,1010,'No Result','Monthly Checkup','None','Prescribe'); 
insert into Medical_record values(10,14,1010,'No Result','Monthly Checkup','None','Prescribe'); 

insert into Medical_record values(11,15,2001,'No Result','High BP','Sergery on Left','Prescribe'); 
insert into Medical_record values(11,16,2001,'Chest Pain','High BP','Sergery on Left','Prescribe'); 
insert into Medical_record values(12,17,2002,'No Result','Sinus','None','Prescribe'); 
insert into Medical_record values(13,18,2003,'No Result','Pregnant','None','Prescribe'); 
insert into Medical_record values(13,19,2003,'No Result','Pregnant','None','Prescribe'); 
insert into Medical_record values(14,20,2004,'Heart attack','Chest Pain','Ring Sergery','Prescribe'); 
insert into Medical_record values(15,21,2005,'No Result','Pregnant','None','Prescribe'); 
insert into Medical_record values(15,22,2005,'No Result','Pregnant','Sergery','Prescribe'); 
insert into Medical_record values(16,23,2006,'No Result','Hit','None','Prescribe'); 
insert into Medical_record values(17,24,2007,'Skin Desease','Skin problem','None','Prescribe'); 
insert into Medical_record values(18,25,2008,'High BP','Heart Attack','Ring Sergery','Prescribe'); 
insert into Medical_record values(19,26,2009,'No Result','Brain Tumor','None','Prescribe'); 
insert into Medical_record values(20,27,2010,'No Result','Monthly Checkup','None','Prescribe'); 
insert into Medical_record values(20,28,2010,'No Result','Monthly Checkup','None','Prescribe'); 



insert into myAdmin values(1, 'Minhaj','admin1@google.com','123');
insert into myAdmin values(2, 'Adib','admin2@google.com','123');
insert into myAdmin values(3, 'Hira','admin3@google.com','123');



insert into Pharmacy values(1001, 'Napa','Paracetamol',9998,10,'Gulshan');
insert into Pharmacy values(1002, 'Synthroid','levothyroxine',7999,20,'Gulshan');
insert into Pharmacy values(1003, 'Crestor','rosuvastatin',11999,25,'Gulshan');
insert into Pharmacy values(1004, 'Ventolin HFA','albuterol',4000,30,'Gulshan');
insert into Pharmacy values(1005, 'Nexium','esomeprazole',795,50,'Gulshan');
insert into Pharmacy values(1006, 'Advair Diskus','fluticasone',398,40,'Gulshan');
insert into Pharmacy values(1007, 'Lantus Solostar','insulin glargine',99,1000,'Gulshan');

insert into Pharmacy values(2001, 'Napa','Paracetamol',7998,10,'Dhanmondi');
insert into Pharmacy values(2002, 'Synthroid','levothyroxine',6990,20,'Dhanmondi');
insert into Pharmacy values(2003, 'Crestor','rosuvastatin',7994,25,'Dhanmondi');
insert into Pharmacy values(2004, 'Ventolin HFA','albuterol',5998,30,'Dhanmondi');
insert into Pharmacy values(2005, 'Nexium','esomeprazole',1198,50,'Dhanmondi');
insert into Pharmacy values(2006, 'Advair Diskus','fluticasone',597,40,'Dhanmondi');
insert into Pharmacy values(2007, 'Lantus Solostar','insulin glargine',500,1000,'Dhanmondi');



insert into Medicine values(1003,1001,'Napa',2,10);
insert into Medicine values(1003,1003,'Crestor',1,25);
insert into Medicine values(1004,1006,'Advair Diskus',2,40);
insert into Medicine values(1008,1005,'Nexium',5,50);
insert into Medicine values(1005,1007,'Lantus Solostar',1,1000);
insert into Medicine values(1010,1002,'Synthroid',1,20);

insert into Medicine values(2003,2001,'Napa',2,10);
insert into Medicine values(2003,2003,'Crestor',6,25);
insert into Medicine values(2004,2006,'Advair Diskus',3,40);
insert into Medicine values(2008,2005,'Nexium',2,50);
insert into Medicine values(2005,2007,'Ventolin HFA',2,30);
insert into Medicine values(2010,2002,'Synthroid',10,20);



insert into Blood_bank values(1000,'0+ve',1,'Info','Gulshan');
insert into Blood_bank values(1001,'0+ve',1,'Info','Gulshan');
insert into Blood_bank values(1002,'A+ve',1,'Info','Gulshan');
insert into Blood_bank values(1003,'B+ve',1,'Info','Gulshan');
insert into Blood_bank values(1004,'0-ve',1,'Info','Gulshan');
insert into Blood_bank values(1005,'0+ve',1,'Info','Gulshan');
insert into Blood_bank values(1006,'AB+ve',1,'Info','Gulshan');
insert into Blood_bank values(1007,'0+ve',1,'Info','Gulshan');
insert into Blood_bank values(1008,'A+ve',1,'Info','Gulshan');
insert into Blood_bank values(1009,'B-ve',1,'Info','Gulshan');
insert into Blood_bank values(1010,'0+ve',2,'Info','Gulshan');
insert into Blood_bank values(1011,'A+ve',1,'Info','Gulshan');
insert into Blood_bank values(1012,'0+ve',1,'Info','Gulshan');
insert into Blood_bank values(1013,'AB-ve',1,'Info','Gulshan');
insert into Blood_bank values(1014,'0+ve',2,'Info','Gulshan');
insert into Blood_bank values(1015,'A+ve',2,'Info','Gulshan');
insert into Blood_bank values(1016,'B+ve',1,'Info','Gulshan');
insert into Blood_bank values(1017,'AB+ve',2,'Info','Gulshan');
insert into Blood_bank values(1018,'A+ve',1,'Info','Gulshan');
insert into Blood_bank values(1019,'A-ve',2,'Info','Gulshan');


insert into Blood_bank values(2000,'0+ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2001,'0+ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2002,'A+ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2003,'B+ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2004,'0-ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2005,'B+ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2006,'AB+ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2007,'0+ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2008,'A+ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2009,'B-ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2010,'0+ve',2,'Info','Dhanmondi');
insert into Blood_bank values(2011,'AB+ve',1,'Info','Dhanmondi');
insert into Blood_bank values(2012,'0+ve',1,'Info','Dhanmondi');



insert into Information values(1,'Budget 2018','Info','Gulshan');
insert into Information values(2,'Weekly Promoted','Info','Gulshan');
insert into Information values(3,'Salary July','Info','Gulshan');
insert into Information values(4,'Salary August','Info','Gulshan');
insert into Information values(5,'Budget 2018','Info','Dhanmondi');
insert into Information values(6,'Weekly Promoted','Info','Dhanmondi');
insert into Information values(7,'Salary July','Info','Dhanmondi');
insert into Information values(8,'Salary August','Info','Dhanmondi');


commit;






