CREATE OR REPLACE FUNCTION 
count_days(p_id in integer)
RETURN integer
IS

diff integer;

BEGIN
  
  select (date_out - date_in) into diff
  from Room 
  where pid = p_id;
  
  RETURN diff;

END count_days;
/
