
--function 1

CREATE OR REPLACE FUNCTION count_days(id IN Room.pid%TYPE)
RETURN number
IS
diff number;
din Room.date_in%TYPE ;
dout Room.date_out%TYPE ;

BEGIN
  
  select date_out - date_in into diff
  from Room where pid = id;

  
  RETURN diff;

END count_days;
/
