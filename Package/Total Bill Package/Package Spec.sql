CREATE OR REPLACE PACKAGE pkg_total_bill AS 
--procedure bill generate
PROCEDURE bill_generate(p_id integer,pay_method varchar2,p_date varchar2);

--function count total bill
FUNCTION count_total_bill(patid in integer) return integer;

END pkg_total_bill;
/