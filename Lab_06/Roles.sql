-- Task 3
-- Student ROle
CREATE ROLE STUDENT;

GRANT SELECT ON ADVISOR TO STUDENT;

GRANT SELECT ON COURSE TO STUDENT;

-- Course teacher role
CREATE ROLE COURSE_TEACHER;

GRANT SELECT ON STUDENT TO COURSE_TEACHER;

GRANT SELECT ON COURSE TO COURSE_TEACHER;

-- Head of Department
CREATE ROLE HEAD_OF_THE_DEPARTMENTS;

GRANT COURSE_TEACHER TO HEAD_OF_THE_DEPARTMENTS;

GRANT INSERT ON INSTRUCTOR TO HEAD_OF_THE_DEPARTMENTS;

-- Administrator
CREATE ROLE ADMINISTRATOR;

GRANT SELECT ON DEPARTMENT TO ADMINISTRATOR;

GRANT SELECT ON INSTRUCTOR TO ADMINISTRATOR;

GRANT UPDATE (BUDGET) ON K6_210042102.DEPARTMENT TO ADMINISTRATOR;