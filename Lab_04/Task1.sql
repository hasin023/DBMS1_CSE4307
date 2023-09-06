-- TASK 1 WITHOUT SET OPERATORS
SELECT
    ACT_FIRSTNAME,
    DIR_FIRSTNAME,
    ACT_LASTNAME,
    DIR_LASTNAME
FROM
    ACTOR,
    DIRECTOR
WHERE
    ACT_FIRSTNAME = DIR_FIRSTNAME
    AND ACT_LASTNAME = DIR_LASTNAME;

-- TASK 1 WITH SET OPERATORS
SELECT
    ACT_FIRSTNAME,
    DIR_FIRSTNAME
FROM
    ACTOR,
    DIRECTOR
WHERE
    ACT_FIRSTNAME = DIR_FIRSTNAME INTERSECT
    SELECT
        ACT_LASTNAME,
        DIR_LASTNAME
    FROM
        ACTOR,
        DIRECTOR
    WHERE
        ACT_LASTNAME = DIR_LASTNAME;

-- TASK 2
SELECT
    ACT_FIRSTNAME,
    COUNT(*)      AS ACTRESSES
FROM
    ACTOR
WHERE
    ACT_GENDER = 'F'
GROUP BY
    ACT_FIRSTNAME
HAVING
    COUNT(*) > 1;

-- TASK 3
SELECT
    ACT_FIRSTNAME,
    ACT_LASTNAME
FROM
    ACTOR UNION
    SELECT
        DIR_FIRSTNAME,
        DIR_LASTNAME
    FROM
        DIRECTOR;

-- TASK 4
SELECT
    MOV_TITLE
FROM
    MOVIE
WHERE
    MOV_ID NOT IN (
        SELECT
            MOV_ID
        FROM
            RATING
    );

-- TASK 5
SELECT
    AVG(REV_STARS)
FROM
    RATING;

-- TASK 6
SELECT
    MOV_TITLE,
    MIN(REV_STARS) AS MIN_RATING
FROM
    MOVIE,
    RATING
WHERE
    MOVIE.MOV_ID = RATING.MOV_ID
GROUP BY
    MOV_TITLE
ORDER BY
    MIN_RATING DESC;

-- TASK 7
SELECT
    MOV_TITLE
FROM
    MOVIE
WHERE
    MOV_ID IN (
        SELECT
            MOV_ID
        FROM
            RATING
        GROUP BY
            MOV_ID
        HAVING
            AVG(REV_STARS) > (
                SELECT
                    AVG(REV_STARS)
                FROM
                    RATING
            )
    );

-- TASK 8
SELECT
    ACT_FIRSTNAME,
    ACT_LASTNAME,
    COUNT(*)      AS RATINGS
FROM
    ACTOR,
    CASTS,
    RATING
WHERE
    ACTOR.ACT_ID = CASTS.ACT_ID
    AND CASTS.MOV_ID = RATING.MOV_ID
GROUP BY
    ACT_FIRSTNAME, ACT_LASTNAME
ORDER BY
    RATINGS DESC;

-- TASK 9
SELECT
    DIR_FIRSTNAME,
    DIR_LASTNAME
FROM
    DIRECTOR
WHERE
    DIR_ID IN (
        SELECT
            DIR_ID
        FROM
            MOVIE
        WHERE
            MOV_ID IN (
                SELECT
                    MOV_ID
                FROM
                    RATING
                GROUP BY
                    MOV_ID
                HAVING
                    AVG(REV_STARS) = (
                        SELECT
                            MAX(AVG(REV_STARS))
                        FROM
                            RATING
                        GROUP BY
                            MOV_ID
                    )
            )
    );

-- TASK 10
SELECT
    MOV_TITLE,
    MOV_YEAR,
    MOV_LANGUAGE,
    MOV_RELEASEDATE,
    MOV_COUNTRY
FROM
    MOVIE
WHERE
    MOV_ID IN (
        SELECT
            MOV_ID
        FROM
            CASTS
        WHERE
            ACT_ID IN (
                SELECT
                    ACT_ID
                FROM
                    ACTOR
                WHERE
                    ACT_FIRSTNAME = (
                        SELECT
                            DIR_FIRSTNAME
                        FROM
                            DIRECTOR
                        WHERE
                            DIR_FIRSTNAME = ACT_FIRSTNAME
                            AND DIR_LASTNAME = ACT_LASTNAME
                    )
                    AND ACT_LASTNAME = (
                        SELECT
                            DIR_LASTNAME
                        FROM
                            DIRECTOR
                        WHERE
                            DIR_FIRSTNAME = ACT_FIRSTNAME
                            AND DIR_LASTNAME = ACT_LASTNAME
                    )
            )
    );

-- TASK 11
SELECT
    MOV_TITLE,
    AVG(REV_STARS) AS AVG_RATING
FROM
    MOVIE,
    RATING
WHERE
    MOVIE.MOV_ID = RATING.MOV_ID
GROUP BY
    MOV_TITLE
HAVING
    AVG(REV_STARS) > 7;

-- TASK 12
SELECT
    REV_ID,
    REV_NAME
FROM
    REVIEWER
WHERE
    REVIEWER.REV_ID IN (
        SELECT
            REV_ID
        FROM
            RATING
        WHERE
            REV_STARS = (
                SELECT
                    MIN(REV_STARS)
                FROM
                    RATING
            )
    );

-- TASK 13