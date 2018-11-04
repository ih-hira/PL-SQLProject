CREATE OR REPLACE FUNCTION max_appointment
RETURN integer
IS

pcount integer := 0;
num integer;

begin 

    select * into num from
     ( 
       select pid
       from Appointment
       group by pid
       order by count(serial_no) desc
      )
     where ROWNUM = 1;

RETURN num;

end;
/
