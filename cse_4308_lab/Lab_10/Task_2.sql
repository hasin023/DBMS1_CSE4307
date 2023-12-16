SET SERVEROUTPUT ON SIZE 1000000;

SET VERIFY OFF;

-- Task A

CREATE OR REPLACE PROCEDURE TOP_MOVIES(
    NUM IN NUMBER
) IS
    MOVIE_COUNT NUMBER;
BEGIN
    SELECT
        COUNT(*) INTO MOVIE_COUNT
    FROM
        MOVIE;
    IF NUM > MOVIE_COUNT THEN
        RAISE_APPLICATION_ERROR(-20001, 'Overflow Error');
        DBMS_OUTPUT.PUT_LINE('Overflow Error');
        RETURN;
    END IF;

    MOVIE_COUNT := 0;
    FOR MOVIE_RATING IN (
        SELECT
            M.MOV_ID,
            M.MOV_TITLE,
            NVL(AVG(R.REV_STARS), 0) AS AVG_RATING
        FROM
            MOVIE  M
            LEFT JOIN RATING R
            ON M.MOV_ID = R.MOV_ID
        GROUP BY
            M.MOV_ID,
            M.MOV_TITLE
        ORDER BY
            AVG_RATING DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('MOVIE ID: '
                             || MOVIE_RATING.MOV_ID);
        DBMS_OUTPUT.PUT_LINE('TTITLE: '
                             || MOVIE_RATING.MOV_TITLE);
        DBMS_OUTPUT.PUT_LINE('AVERAGE RATING: '
                             || ROUND(MOVIE_RATING.AVG_RATING, 3));
        DBMS_OUTPUT.PUT_LINE('------------------------');
        MOVIE_COUNT:= MOVIE_COUNT + 1;
        EXIT WHEN MOVIE_COUNT >= NUM;
    END LOOP;
END;
/

DECLARE
    NUM NUMBER;
BEGIN
    NUM:= '&NUM';
    TOP_MOVIES(NUM);
END;
/

-- Task B
CREATE OR REPLACE FUNCTION MOVIE_STATUS (
    MOVIE_TITLE VARCHAR2
) RETURN VARCHAR2 IS
    ACT_COUNT NUMBER;
BEGIN
    SELECT
        COUNT(C.ACT_ID) INTO ACT_COUNT
    FROM
        MOVIE M
        LEFT JOIN CASTS C
        ON M.MOV_ID= C.MOV_ID
    GROUP BY
        M.MOV_ID,
        M.MOV_TITLE
    HAVING
        M.MOV_TITLE = MOVIE_TITLE;
    IF ACT_COUNT= 0 THEN
        RETURN 'NO ACTORS';
    ELSIF ACT_COUNT= 1 THEN
        RETURN 'SOLO';
    ELSE
        RETURN 'ENSEMBLE';
    END IF;
END;
/

DECLARE
    MOVIE_TITLE VARCHAR2(100);
BEGIN
    MOVIE_TITLE:= '&MOVIE_TITLE';
    DBMS_OUTPUT.PUT_LINE('MOVIE STATUS : '
                         || MOVIE_STATUS(MOVIE_TITLE));
END;
/

-- Task C

CREATE OR REPLACE PROCEDURE FIND_OSCAR_NOMINEES IS
    NOMINEE_COUNT NUMBER := 1;
BEGIN
    FOR NOMINEE_NAMES IN (
        SELECT
            DISTINCT D.DIR_FIRSTNAME
                     || ' '
                     || D.DIR_LASTNAME AS NOMINEE_NAME
        FROM
            DIRECTOR  D
            LEFT JOIN DIRECTION DIR
            ON D.DIR_ID = DIR.DIR_ID
        WHERE
            DIR.MOV_ID IN (
                SELECT
                    M.MOV_ID
                FROM
                    MOVIE     M
                    LEFT JOIN RATING R
                    ON M.MOV_ID = R.MOV_ID
                GROUP BY
                    M.MOV_ID
                HAVING
                    COUNT(R.REV_ID) > 10
                    AND AVG(R.REV_STARS) >= 7
            )
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('NOMINEE '
                             || NOMINEE_COUNT
                             || ': '
                             || NOMINEE_NAMES.NOMINEE_NAME);
        NOMINEE_COUNT := NOMINEE_COUNT + 1;
    END LOOP;
END FIND_OSCAR_NOMINEES;
/

BEGIN
    FIND_OSCAR_NOMINEES;
END;
/

-- Task D
CREATE OR REPLACE FUNCTION MOVIE_CATEGORY (
    MOVIE_TITLE VARCHAR2
) RETURN VARCHAR2 IS
    RELEASE_YEAR NUMBER;
    AVG_RATING   NUMBER;
BEGIN
    SELECT
        M.MOV_YEAR,
        NVL(AVG(R.REV_STARS), 0) INTO RELEASE_YEAR,
        AVG_RATING
    FROM
        MOVIE  M
        LEFT JOIN RATING R
        ON M.MOV_ID = R.MOV_ID
    WHERE
        M.MOV_TITLE = MOVIE_TITLE
    GROUP BY
        M.MOV_ID,
        M.MOV_TITLE,
        M.MOV_YEAR;
    IF (RELEASE_YEAR >= 1950
    AND RELEASE_YEAR <= 1959
    AND AVG_RATING > 6.5) THEN
        RETURN 'Fantastic Fifties';
    ELSIF (RELEASE_YEAR >= 1960
    AND RELEASE_YEAR <= 1969
    AND AVG_RATING > 6.7) THEN
        RETURN 'Sweet Sixties';
    ELSIF (RELEASE_YEAR >= 1970
    AND RELEASE_YEAR <= 1979
    AND AVG_RATING > 6.9) THEN
        RETURN 'Super Seventies';
    ELSIF (RELEASE_YEAR >= 1980
    AND RELEASE_YEAR <= 1989
    AND AVG_RATING > 7.1) THEN
        RETURN 'Ecstatic Eighties';
    ELSIF (RELEASE_YEAR >= 1990
    AND RELEASE_YEAR <= 1999
    AND AVG_RATING > 7.3) THEN
        RETURN 'Neat Nineties';
    ELSE
        RETURN 'Garbage';
    END IF;
END;
/

DECLARE
    TITLE VARCHAR2(100);
BEGIN
    TITLE:= '&title';
    DBMS_OUTPUT.PUT_LINE('Category : '
                         || MOVIE_CATEGORY(TITLE));
END;
/