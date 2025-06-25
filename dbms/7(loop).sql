-- EXE-7: All in One Program
-- Author: [Your Name]
-- Lab: DBMS PL/SQL Lab
-- Description: Covers WHILE, FOR, NESTED LOOPS, Built-in & User-defined Exceptions, and RAISE_APPLICATION_ERROR

-- 1️⃣ WHILE LOOP
DECLARE
  v_counter NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- WHILE LOOP OUTPUT ---');
  WHILE v_counter <= 5 LOOP
    DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter);
    v_counter := v_counter + 1;
  END LOOP;
END;
/
-- Expected Output:
-- Counter: 1
-- Counter: 2
-- Counter: 3
-- Counter: 4
-- Counter: 5

-- 2️⃣ FOR LOOP
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- FOR LOOP OUTPUT ---');
  FOR v_counter IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('Value: ' || v_counter);
  END LOOP;
END;
/
-- Expected Output:
-- Value: 1
-- Value: 2
-- Value: 3
-- Value: 4
-- Value: 5

-- 3️⃣ NESTED FOR LOOP
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- NESTED LOOP OUTPUT (Multiplication Table) ---');
  FOR i IN 1..3 LOOP
    FOR j IN 1..3 LOOP
      DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || (i * j));
    END LOOP;
  END LOOP;
END;
/
-- Expected Output:
-- 1 x 1 = 1
-- 1 x 2 = 2
-- ...
-- 3 x 3 = 9

-- 4️⃣ BUILT-IN EXCEPTION (ZERO_DIVIDE)
DECLARE
  v_num1 NUMBER := 10;
  v_num2 NUMBER := 0;
  v_result NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- BUILT-IN EXCEPTION (ZERO_DIVIDE) ---');
  v_result := v_num1 / v_num2;
  DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
EXCEPTION
  WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Error: Cannot divide by zero!');
END;
/
-- Expected Output:
-- Error: Cannot divide by zero!

-- 5️⃣ USER-DEFINED EXCEPTION
DECLARE
  e_insufficient_funds EXCEPTION;
  v_balance NUMBER := 5000;
  v_withdraw_amount NUMBER := 6000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- USER-DEFINED EXCEPTION ---');
  IF v_withdraw_amount > v_balance THEN
    RAISE e_insufficient_funds;
  END IF;
  v_balance := v_balance - v_withdraw_amount;
  DBMS_OUTPUT.PUT_LINE('Transaction successful! Remaining balance: ' || v_balance);
EXCEPTION
  WHEN e_insufficient_funds THEN
    DBMS_OUTPUT.PUT_LINE('Error: Insufficient funds! Withdrawal amount exceeds balance.');
END;
/
-- Expected Output:
-- Error: Insufficient funds! Withdrawal amount exceeds balance.

-- 6️⃣ RAISE_APPLICATION_ERROR
DECLARE
  v_salary NUMBER := -1000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- RAISE_APPLICATION_ERROR ---');
  IF v_salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative!');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Valid Salary.');
END;
/
-- Expected Output:
-- ORA-20001: Salary cannot be negative!

-- 7️⃣ LOOP with EXIT WHEN
DECLARE
  v_counter NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- SIMPLE LOOP with EXIT WHEN ---');
  LOOP
    DBMS_OUTPUT.PUT_LINE('Value: ' || v_counter);
    v_counter := v_counter + 1;
    EXIT WHEN v_counter > 5;
  END LOOP;
END;
/
-- Expected Output:
-- Value: 1
-- ...
-- Value: 5