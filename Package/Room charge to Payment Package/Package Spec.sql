CREATE OR REPLACE PACKAGE pkg_room_charge AS

--PROCEDURE
PROCEDURE insert_room_charge(p_id integer);

--FUNCTION
FUNCTION count_days(p_id in integer) RETURN integer;

END pkg_room_charge;
/