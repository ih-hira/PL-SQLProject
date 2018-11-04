
SET SERVEROUTPUT ON

DECLARE
  diff number := 0;
  id Room.pid%TYPE;

  cursor d_cur(anId Room.pid%TYPE)  is
  select pid,count_days(pid) from Room;

  
BEGIN

     open d_cur(1);
	 DBMS_OUTPUT.PUT_LINE('Pid'||'  '||'Days');
 loop
     fetch d_cur into id,diff;
     DBMS_OUTPUT.PUT_LINE(id||'  '||diff);
     exit when d_cur%notfound;

end loop;
close d_cur;

END;
/