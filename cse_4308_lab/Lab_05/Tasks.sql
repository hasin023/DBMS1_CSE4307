-- Task 01
SELECT
    CUSTOMER_NAME,
    CUSTOMER_CITY
FROM
    CUSTOMER
WHERE
    CUSTOMER_NAME IN (
        SELECT
            CUSTOMER_NAME
        FROM
            BORROWER
    )
    AND CUSTOMER_NAME NOT IN (
        SELECT
            CUSTOMER_NAME
        FROM
            DEPOSITOR
    );

-- Task 02
SELECT
    CUSTOMER_NAME
FROM
    CUSTOMER
WHERE
    CUSTOMER_NAME IN (
        SELECT
            CUSTOMER_NAME
        FROM
            BORROWER
    )
    AND CUSTOMER_NAME IN (
        SELECT
            CUSTOMER_NAME
        FROM
            DEPOSITOR
    );

-- Task 03
SELECT
    INITCAP(TO_CHAR(TO_DATE(EXTRACT(MONTH FROM ACC_OPENING_DATE), 'MM'), 'month')) AS MONTH,
    COUNT(*)                                                                       AS COUNT
FROM
    ACCOUNT
GROUP BY
    EXTRACT(MONTH FROM ACC_OPENING_DATE)
ORDER BY
    COUNT DESC;

-- Task 04
SELECT
    ABS(MONTHS_BETWEEN( (
        SELECT
            MAX(ACC_OPENING_DATE)
        FROM
            ACCOUNT
        WHERE
            ACCOUNT_NUMBER IN (
                SELECT
                    ACCOUNT_NUMBER
                FROM
                    DEPOSITOR
                WHERE
                    CUSTOMER_NAME = 'Smith'
            )
    ), (
        SELECT
            MAX(LOAN_DATE)
        FROM
            LOAN
        WHERE
            LOAN_NUMBER IN (
                SELECT
                    LOAN_NUMBER
                FROM
                    BORROWER
                WHERE
                    CUSTOMER_NAME = 'Smith'
            )
    ) )) AS MONTH
FROM
    DUAL;

-- Task 05
SELECT
    BRANCH_NAME,
    AVG(AMOUNT) AS AVG_LOAN_AMOUNT
FROM
    LOAN
WHERE
    BRANCH_NAME IN (
        SELECT
            BRANCH_NAME
        FROM
            BRANCH
        WHERE
            BRANCH_CITY NOT LIKE '%a%'
            AND BRANCH_NAME NOT LIKE '%Horse%'
    )
GROUP BY
    BRANCH_NAME
ORDER BY
    AVG_LOAN_AMOUNT DESC;

-- Task 06
SELECT
    CUSTOMER_NAME,
    ACCOUNT_NUMBER
FROM
    DEPOSITOR
WHERE
    ACCOUNT_NUMBER IN (
        SELECT
            ACCOUNT_NUMBER
        FROM
            ACCOUNT
        WHERE
            BALANCE = (
                SELECT
                    MAX(BALANCE)
                FROM
                    ACCOUNT
            )
    );

-- TASK 07
SELECT
    BRANCH_CITY,
    AVG(AMOUNT)
FROM
    LOAN,
    BRANCH
WHERE
    LOAN.BRANCH_NAME = BRANCH.BRANCH_NAME
GROUP BY
    BRANCH_CITY
HAVING
    AVG(AMOUNT) > 1500;

-- Task 08
SELECT
    CUSTOMER_NAME
    || ' Eligible' AS CUSTOMER_NAME
FROM
    DEPOSITOR
WHERE
    ACCOUNT_NUMBER IN (
        SELECT
            ACCOUNT_NUMBER
        FROM
            ACCOUNT
        WHERE
            BALANCE >= (
                SELECT
                    SUM(AMOUNT)
                FROM
                    LOAN
                WHERE
                    LOAN.BRANCH_NAME = ACCOUNT.BRANCH_NAME
                    AND LOAN.LOAN_NUMBER IN (
                        SELECT
                            LOAN_NUMBER
                        FROM
                            BORROWER
                        WHERE
                            BORROWER.CUSTOMER_NAME = DEPOSITOR.CUSTOMER_NAME
                    )
            )
    );

-- Task 09
SELECT
    BRANCH_NAME,
    CASE
        WHEN TOTAL_BALANCE > (AVG_TOTAL_BALANCE + 500) THEN
            'ELITE'
        WHEN TOTAL_BALANCE BETWEEN (AVG_TOTAL_BALANCE + 500) AND (AVG_TOTAL_BALANCE - 500) THEN
            'MODERATE'
        ELSE
            'POOR'
    END AS BRANCH_STATUS
FROM
    (
        SELECT
            BRANCH_NAME,
            SUM(BALANCE) AS TOTAL_BALANCE,
            AVG(BALANCE) AS AVG_TOTAL_BALANCE
        FROM
            ACCOUNT
        GROUP BY
            BRANCH_NAME
    );

-- Task 10
SELECT
    BRANCH_NAME,
    BRANCH_CITY
FROM
    BRANCH
WHERE
    BRANCH_CITY IN (
        SELECT
            CUSTOMER_CITY
        FROM
            CUSTOMER
        WHERE
            CUSTOMER_NAME NOT IN (
                SELECT
                    CUSTOMER_NAME
                FROM
                    DEPOSITOR
            )
            AND CUSTOMER_NAME NOT IN (
                SELECT
                    CUSTOMER_NAME
                FROM
                    BORROWER
            )
    )
    AND BRANCH_NAME IN (
        SELECT
            BRANCH_NAME
        FROM
            LOAN
    )
    AND BRANCH_NAME IN (
        SELECT
            BRANCH_NAME
        FROM
            ACCOUNT
        WHERE
            ACCOUNT_NUMBER IN (
                SELECT
                    ACCOUNT_NUMBER
                FROM
                    DEPOSITOR
            )
    );

-- Task 11
CREATE TABLE CUSTOMER_NEW AS
    SELECT
        *
    FROM
        CUSTOMER
    WHERE
        1 = 0;

-- Task 12
INSERT INTO CUSTOMER_NEW
    SELECT
        *
    FROM
        CUSTOMER
    WHERE
        CUSTOMER_NAME IN (
            SELECT
                CUSTOMER_NAME
            FROM
                DEPOSITOR
        )
        OR CUSTOMER_NAME IN (
            SELECT
                CUSTOMER_NAME
            FROM
                BORROWER
        );

-- Task 13
ALTER TABLE CUSTOMER_NEW ADD STATUS VARCHAR2(15);

-- Task 14
UPDATE CUSTOMER_NEW
SET
    STATUS = (
        SELECT CASE WHEN TOTAL_BALANCE > TOTAL_LOAN THEN 'IN SAVINGS' WHEN TOTAL_BALANCE < TOTAL_LOAN THEN 'IN LOAN' ELSE 'IN BREAKEVEN' END FROM ( SELECT CUSTOMER_NAME, SUM(BALANCE) AS TOTAL_BALANCE, SUM(AMOUNT) AS TOTAL_LOAN FROM ACCOUNT, LOAN WHERE ACCOUNT.BRANCH_NAME = LOAN.BRANCH_NAME AND ACCOUNT.ACCOUNT_NUMBER IN ( SELECT ACCOUNT_NUMBER FROM DEPOSITOR WHERE CUSTOMER_NAME = CUSTOMER_NEW.CUSTOMER_NAME ) AND LOAN.LOAN_NUMBER IN ( SELECT LOAN_NUMBER FROM BORROWER WHERE CUSTOMER_NAME = CUSTOMER_NEW.CUSTOMER_NAME ) GROUP BY CUSTOMER_NAME ) WHERE CUSTOMER_NAME = CUSTOMER_NEW.CUSTOMER_NAME
    );

-- Task 15
SELECT
    STATUS,
    COUNT(*) AS COUNT
FROM
    CUSTOMER_NEW
GROUP BY
    STATUS;