
--procedure 3

CREATE OR REPLACE procedure update_patient(vid in integer ,val in integer ,new_val in VARCHAR2)
IS
BEGIN
   
 	case val 
	when 1
		then
		update Patient set name = new_val where pid=vid; 

	when 2
		then
		update Patient set gender = new_val where pid = vid;

	when 3
        then
		update Patient set address = new_val where pid = vid;
      
    when 4
        then
		update Patient set email = new_val where pid =vid;

    when 5
	    then
		update Patient set contact = new_val where pid=vid;
		
	else
        update Patient set branch = new_val where pid=vid;     


	end case;

END update_Patient;
/
