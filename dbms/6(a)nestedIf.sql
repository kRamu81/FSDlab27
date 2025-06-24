/*Syntax:- 
if (condition1) then 
   -- Executes when condition1 is true 
  if (condition2) then  
     -- Executes when condition2 is true 
   end if;  
end if;*/


DECLARE
  a NUMBER := 10;
  b NUMBER := 20;
  c NUMBER := 30;
BEGIN
  DBMS_OUTPUT.PUT_LINE('a'|| a || ' b'|| b || ' c'|| c);

  IF a > b AND a > c THEN
    DBMS_OUTPUT.PUT_LINE('a is greater');
  ELSE
    IF b > a AND b > c THEN
      DBMS_OUTPUT.PUT_LINE('b is greater');
    ELSE
      DBMS_OUTPUT.PUT_LINE('c is greater');
    END IF;
  END IF;
END;
/
--Output:
--a10 b20 c30
--c is greater
