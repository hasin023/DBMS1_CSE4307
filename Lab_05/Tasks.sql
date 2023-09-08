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
-- TODO

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
    BRANCH_CITY
FROM
    BRANCH
WHERE
    BRANCH_NAME IN (
        SELECT
            BRANCH_NAME
        FROM
            LOAN
        WHERE
            BRANCH_CITY NOT IN (
                SELECT
                    BRANCH_CITY
                FROM
                    BRANCH
                WHERE
                    BRANCH_NAME IN (
                        SELECT
                            BRANCH_NAME
                        FROM
                            LOAN
                        HAVING
                            AVG(AMOUNT) > 1500
                        GROUP BY
                            BRANCH_NAME
                    )
            )
    )
GROUP BY
    BRANCH_CITY;

-- Task 08
-- TODO THIS

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
        CUSTOMER;

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
                BORROWER
        )
        OR CUSTOMER_NAME IN (
            SELECT
                CUSTOMER_NAME
            FROM
                DEPOSITOR
        );

-- Task 13
ALTER TABLE CUSTOMER_NEW ADD STATUS VARCHAR2(15);

-- Task 14


-- Task 15
SELECT
    STATUS,
    COUNT(*) AS COUNT
FROM
    CUSTOMER_NEW
GROUP BY
    STATUS;