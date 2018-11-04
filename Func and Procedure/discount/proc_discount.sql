create or replace procedure discount
is

tid integer := max_appointment();
cost integer;
r integer; 

cursor dis_cur is
select amount from payment
where  pid = tid;

Begin


  open dis_cur;

	loop
		fetch dis_cur into r;
		exit when dis_cur%notfound;
		     
		      cost := r - 100 ;

              update Payment set amount = cost
              where pid = tid;
		end loop;
	close dis_cur;
  
 

End discount;
/
  