-- SET SERVEROUTPUT ON;

-- Simple syntax
-- -- DECLARE
-- --     NAME    VARCHAR2(30) := 'HASIN';
-- --     AMOUNT  NUMBER(10, 3) NOT NULL := 5000;
-- --     PORTION NUMBER(10, 3) := AMOUNT/3;
-- -- BEGIN
-- --     DBMS_OUTPUT.PUT_LINE('WELCOME TO THUNDERDOME, '
-- --                          || NAME);
-- --     DBMS_OUTPUT.PUT_LINE('YOUR PORTION IS, '
-- --                          || PORTION);
-- -- EXCEPTION
-- --     WHEN ZERO_DIVIDE THEN
-- --         DBMS_OUTPUT.PUT_LINE(SQLERRM);
-- -- END;
-- -- /

-- CREATE TABLE BOYS (
--     ID INT,
--     NAME VARCHAR(20) NOT NULL,
--     SEMESTER INT NOT NULL,
--     CONSTRAINT PK_ID PRIMARY KEY (ID)
-- );

-- INSERT INTO BOYS VALUES (
--     1,
--     'Hasin',
--     5
-- );

-- INSERT INTO BOYS VALUES (
--     2,
--     'Mahtab',
--     6
-- );

-- INSERT INTO BOYS VALUES (
--     3,
--     'Alvee',
--     7
-- );

-- Achor variables
-- DECLARE
--     VAR_NAME     BOYS.NAME%TYPE;
--     VAR_SEMESTER BOYS.SEMESTER%TYPE;
-- BEGIN
--     SELECT
--         NAME,
--         SEMESTER INTO VAR_NAME,
--         VAR_SEMESTER
--     FROM
--         BOYS
--     WHERE
--         BOYS.ID = 2;
--     DBMS_OUTPUT.PUT_LINE('NAME: '
--                          || VAR_NAME);
--     DBMS_OUTPUT.PUT_LINE('SEMESTER: '
--                          || VAR_SEMESTER
--                          || 'th');
-- END;
-- /


-- CREATE TABLE BOYS_MARKS (
--     ID INT,
--     NAME VARCHAR(20) NOT NULL,
--     MARKS INT NOT NULL,
--     CONSTRAINT PKMARKS_ID PRIMARY KEY (ID)
-- );

-- INSERT INTO BOYS_MARKS VALUES (
--     1,
--     'Hasin',
--     75
-- );

-- INSERT INTO BOYS_MARKS VALUES (
--     2,
--     'Mahtab',
--     68
-- );

-- INSERT INTO BOYS_MARKS VALUES (
--     3,
--     'Alvee',
--     87
-- );


-- IF-ELSE

-- DECLARE
--     VAR_NAME BOYS_MARKS.NAME%TYPE;
--     VAR_MARK BOYS_MARKS.MARKS%TYPE;
--     GRADE    VARCHAR2(10);
-- BEGIN
--     SELECT
--         NAME,
--         MARKS INTO VAR_NAME,
--         VAR_MARK
--     FROM
--         BOYS_MARKS
--     WHERE
--         BOYS_MARKS.ID = 3;
--  -- If - else block
--     IF VAR_MARK >= 80 THEN
--         GRADE := 'A+';
--     ELSIF VAR_MARK >= 70 THEN
--         GRADE := 'A';
--     ELSIF VAR_MARK >= 60 THEN
--         GRADE := 'A-';
--     ELSIF VAR_MARK >= 50 THEN
--         GRADE := 'B';
--     ELSIF VAR_MARK >= 40 THEN
--         GRADE := 'C';
--     ELSIF VAR_MARK >= 33 THEN
--         GRADE := 'D';
--     ELSE
--         GRADE := 'F';
--     END IF;

--     DBMS_OUTPUT.PUT_LINE('Name: '
--                          || VAR_NAME);
--     DBMS_OUTPUT.PUT_LINE('Grade: '
--                          || GRADE);
-- END;
-- /

-- Orders tables

-- CREATE TABLE ORDERS (
--     ORDER_ID INT,
--     CLIENT_ID INT,
--     ORDER_DATE VARCHAR2(50) NOT NULL,
--     CONSTRAINT PKORDER_ID PRIMARY KEY (ORDER_ID)
-- );

-- CREATE TABLE ORDER_ITEMS (
--     ORDER_ID INT,
--     NAME VARCHAR2(50),
--     QUANTITY INT,
--     PPU NUMBER(10, 2)
-- );

-- INSERT INTO ORDERS VALUES (
--     1,
--     23,
--     '22-JUN-2020'
-- );

-- INSERT INTO ORDERS VALUES (
--     2,
--     32,
--     '27-APR-2021'
-- );

-- INSERT INTO ORDERS VALUES (
--     3,
--     43,
--     '15-DEC-2021'
-- );

-- INSERT INTO ORDER_ITEMS VALUES (
--     1,
--     'Bananas',
--     6,
--     9.0
-- );

-- INSERT INTO ORDER_ITEMS VALUES (
--     2,
--     'Apples',
--     10,
--     5.5
-- );

-- INSERT INTO ORDER_ITEMS VALUES (
--     2,
--     'Oranges',
--     15,
--     5.0
-- );

-- INSERT INTO ORDER_ITEMS VALUES (
--     3,
--     'Coffee',
--     50,
--     6.5
-- );

-- Functions - Write a function that takes a date string as input and returns the total earnings on that date

CREATE OR REPLACE FUNCTION GET_EARNINGS (
    P_DATE IN VARCHAR2
) RETURN NUMBER IS
    VAR_TOTAL NUMBER(10, 2) := 0;
BEGIN
    SELECT
        SUM(QUANTITY * PPU) INTO VAR_TOTAL
    FROM
        ORDERS
        JOIN ORDER_ITEMS
        ON ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
    WHERE
        ORDER_DATE = P_DATE;
    RETURN VAR_TOTAL;
END;
/

-- Calling function from an Anonymous Block

BEGIN
    DBMS_OUTPUT.PUT_LINE('Total earnings: '
                         || GET_EARNINGS('27-APR-2021'));
END;
/

-- -- Calling function from a SQL
-- SELECT
--     GET_EARNINGS('27-APR-2021') AS TOTAL_EARNINGS
-- FROM
--     DUAL;


-- Procedures