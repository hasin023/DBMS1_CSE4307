-- Task 1

CREATE VIEW ADVISOR_SELECTION AS
    SELECT
        ID,
        NAME,
        DEPT_NAME
    FROM
        INSTRUCTOR;

-- Task 2

CREATE VIEW STUDENT_COUNT AS
    SELECT
        A.NAME,
        COUNT(*) AS STUDENT_COUNT
    FROM
        ADVISOR_SELECTION A,
        ADVISOR           B
    WHERE
        A.ID=B.I_ID
    GROUP BY
        A.NAME;