CREATE OR REPLACE PROCEDURE
insert_medicine_list(p_id in integer, sentDrug_id in integer, drug_name in varchar2, sentQuantity in integer ,price in integer) 
IS
	
BEGIN
	insert into Medicine values(p_id,sentDrug_id,drug_name,sentQuantity,price);
	commit;
	
END;
/