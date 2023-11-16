SET SERVEROUTPUT ON SIZE 1000000;

SET VERIFY OFF;

-- Task A
DECLARE
    NAME VARCHAR2(30) := 'Hasin Mahtab Alvee';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Name : '
                         || NAME);
END;
/

-- Task B
DECLARE
    ID VARCHAR2 (20);
BEGIN
    ID := '&Student_Id';
    DBMS_OUTPUT.PUT_LINE('Student Id Length: '
                         || LENGTH(ID));
END;
/

-- Task C
DECLARE
    NUM1  NUMBER;
    NUM2  NUMBER;
    TOTAL NUMBER;
BEGIN
    NUM1 := '&Num1';
    NUM2 := '&Num2';
    TOTAL := NUM1+ NUM2;
    DBMS_OUTPUT.PUT_LINE( 'Total : '
                          || TOTAL);
END;
/

-- Task D
DECLARE
    NOWTIME TIMESTAMP;
BEGIN
    NOWTIME:= SYSTIMESTAMP;
    DBMS_OUTPUT . PUT_LINE ('Current Time: '
                            || TO_CHAR ( NOWTIME, 'HH :MI:SS AM'));
END;
/

-- -- Task E
DECLARE
    NUM NUMBER;
BEGIN
    NUM := '&Number';
    IF MOD(NUM, 1) = 0 THEN
        DBMS_OUTPUT.PUT_LINE( NUM
                              || ' is a Whole Number');
    ELSE
        DBMS_OUTPUT.PUT_LINE( NUM
                              || ' is a Fraction');
    END IF;
END;
/

-- -- Task F
CREATE OR REPLACE FUNCTION IS_COMPOSITE(
    NUM IN NUMBER
) RETURN BOOLEAN IS
BEGIN
    IF NUM <= 1 THEN
        RETURN FALSE;
    END IF;

    FOR I IN 2..ROUND(SQRT(NUM)) LOOP
        IF MOD(NUM, I) = 0 THEN
            RETURN TRUE;
        END IF;
    END LOOP;

    RETURN FALSE;
END;
/

DECLARE
    NUM     NUMBER;
    FRESULT BOOLEAN;
BEGIN
    NUM:= '&number';
    FRESULT:= IS_COMPOSITE(NUM);
    IF FRESULT THEN
        DBMS_OUTPUT.PUT_LINE(NUM
                             || ' is Composite');
    ELSE
        DBMS_OUTPUT.PUT_LINE(NUM
                             || ' is Prime');
    END IF;
END;
/