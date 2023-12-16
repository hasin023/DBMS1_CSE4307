SELECT
    NAME
FROM
    DOCTOR
WHERE
    FEE < 1500;

SELECT
    NAME
FROM
    PATIENT
WHERE
    ADDRESS = 'KHL';

SELECT
    *
FROM
    PATIENT,
    APPOINTMENT_INFO;

SELECT
    *
FROM
    PATIENT
    NATURAL JOIN APPOINTMENT_INFO;

SELECT
    P.PATIENT_NO,
    P.ADDRESS
FROM
    PATIENT          P
WHERE
    P.PATIENT_NO IN (
        SELECT
            A.P_NO
        FROM
            APPOINTMENT_INFO A
        WHERE
            TRUNC(A.APPOINTMENT_DATE) = TRUNC(SYSDATE)
    );

SELECT
    D.*
FROM
    DOCTOR           D
WHERE
    D.NAME IN (
        SELECT
            A.D_NAME
        FROM
            APPOINTMENT_INFO A,
            PATIENT          P
        WHERE
            A.P_NO = P.PATIENT_NO
            AND P.ADDRESS = 'DHK'
    );

SELECT
    *
FROM
    PATIENT
WHERE
    PATIENT_NO IN (
        SELECT
            A.P_NO
        FROM
            APPOINTMENT_INFO A
        WHERE
            A.D_NAME IN (
                SELECT
                    NAME
                FROM
                    DOCTOR
                WHERE
                    SPECIALIZATION = 'GS'
                    OR FEE > 1500
            )
    );