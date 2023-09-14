DELETE FROM PREREQ;

DELETE FROM TIME_SLOT;

DELETE FROM ADVISOR;

DELETE FROM TAKES;

DELETE FROM STUDENT;

DELETE FROM TEACHES;

DELETE FROM SECTION;

DELETE FROM INSTRUCTOR;

DELETE FROM COURSE;

DELETE FROM DEPARTMENT;

DELETE FROM CLASSROOM;

INSERT INTO CLASSROOM VALUES (
    'Packard',
    '101',
    '500'
);

INSERT INTO CLASSROOM VALUES (
    'Painter',
    '514',
    '10'
);

INSERT INTO CLASSROOM VALUES (
    'Taylor',
    '3128',
    '70'
);

INSERT INTO CLASSROOM VALUES (
    'Watson',
    '100',
    '30'
);

INSERT INTO CLASSROOM VALUES (
    'Watson',
    '120',
    '50'
);

INSERT INTO DEPARTMENT VALUES (
    'Biology',
    'Watson',
    '90000'
);

INSERT INTO DEPARTMENT VALUES (
    'Comp. Sci.',
    'Taylor',
    '100000'
);

INSERT INTO DEPARTMENT VALUES (
    'Elec. Eng.',
    'Taylor',
    '85000'
);

INSERT INTO DEPARTMENT VALUES (
    'Finance',
    'Painter',
    '120000'
);

INSERT INTO DEPARTMENT VALUES (
    'History',
    'Painter',
    '50000'
);

INSERT INTO DEPARTMENT VALUES (
    'Music',
    'Packard',
    '80000'
);

INSERT INTO DEPARTMENT VALUES (
    'Physics',
    'Watson',
    '70000'
);

INSERT INTO COURSE VALUES (
    'BIO-101',
    'Intro. to Biology',
    'Biology',
    '4'
);

INSERT INTO COURSE VALUES (
    'BIO-301',
    'Genetics',
    'Biology',
    '4'
);

INSERT INTO COURSE VALUES (
    'BIO-399',
    'Computational Biology',
    'Biology',
    '3'
);

INSERT INTO COURSE VALUES (
    'CS-101',
    'Intro. to Computer Science',
    'Comp. Sci.',
    '4'
);

INSERT INTO COURSE VALUES (
    'CS-190',
    'Game Design',
    'Comp. Sci.',
    '4'
);

INSERT INTO COURSE VALUES (
    'CS-315',
    'Robotics',
    'Comp. Sci.',
    '3'
);

INSERT INTO COURSE VALUES (
    'CS-319',
    'Image Processing',
    'Comp. Sci.',
    '3'
);

INSERT INTO COURSE VALUES (
    'CS-347',
    'Database System Concepts',
    'Comp. Sci.',
    '3'
);

INSERT INTO COURSE VALUES (
    'EE-181',
    'Intro. to Digital Systems',
    'Elec. Eng.',
    '3'
);

INSERT INTO COURSE VALUES (
    'FIN-201',
    'Investment Banking',
    'Finance',
    '3'
);

INSERT INTO COURSE VALUES (
    'HIS-351',
    'World History',
    'History',
    '3'
);

INSERT INTO COURSE VALUES (
    'MU-199',
    'Music Video Production',
    'Music',
    '3'
);

INSERT INTO COURSE VALUES (
    'PHY-101',
    'Physical Principles',
    'Physics',
    '4'
);

INSERT INTO INSTRUCTOR VALUES (
    '10101',
    'Srinivasan',
    'Comp. Sci.',
    '65000'
);

INSERT INTO INSTRUCTOR VALUES (
    '12121',
    'Wu',
    'Finance',
    '90000'
);

INSERT INTO INSTRUCTOR VALUES (
    '15151',
    'Mozart',
    'Music',
    '40000'
);

INSERT INTO INSTRUCTOR VALUES (
    '22222',
    'Einstein',
    'Physics',
    '95000'
);

INSERT INTO INSTRUCTOR VALUES (
    '32343',
    'El Said',
    'History',
    '60000'
);

INSERT INTO INSTRUCTOR VALUES (
    '33456',
    'Gold',
    'Physics',
    '87000'
);

INSERT INTO INSTRUCTOR VALUES (
    '45565',
    'Katz',
    'Comp. Sci.',
    '75000'
);

INSERT INTO INSTRUCTOR VALUES (
    '58583',
    'Califieri',
    'History',
    '62000'
);

INSERT INTO INSTRUCTOR VALUES (
    '76543',
    'Singh',
    'Finance',
    '80000'
);

INSERT INTO INSTRUCTOR VALUES (
    '76766',
    'Crick',
    'Biology',
    '72000'
);

INSERT INTO INSTRUCTOR VALUES (
    '83821',
    'Brandt',
    'Comp. Sci.',
    '92000'
);

INSERT INTO INSTRUCTOR VALUES (
    '98345',
    'Kim',
    'Elec. Eng.',
    '80000'
);

INSERT INTO SECTION VALUES (
    'BIO-101',
    '1',
    'Summer',
    '2017',
    'Painter',
    '514',
    'B'
);

INSERT INTO SECTION VALUES (
    'BIO-301',
    '1',
    'Summer',
    '2018',
    'Painter',
    '514',
    'A'
);

INSERT INTO SECTION VALUES (
    'CS-101',
    '1',
    'Fall',
    '2017',
    'Packard',
    '101',
    'H'
);

INSERT INTO SECTION VALUES (
    'CS-101',
    '1',
    'Spring',
    '2018',
    'Packard',
    '101',
    'F'
);

INSERT INTO SECTION VALUES (
    'CS-190',
    '1',
    'Spring',
    '2017',
    'Taylor',
    '3128',
    'E'
);

INSERT INTO SECTION VALUES (
    'CS-190',
    '2',
    'Spring',
    '2017',
    'Taylor',
    '3128',
    'A'
);

INSERT INTO SECTION VALUES (
    'CS-315',
    '1',
    'Spring',
    '2018',
    'Watson',
    '120',
    'D'
);

INSERT INTO SECTION VALUES (
    'CS-319',
    '1',
    'Spring',
    '2018',
    'Watson',
    '100',
    'B'
);

INSERT INTO SECTION VALUES (
    'CS-319',
    '2',
    'Spring',
    '2018',
    'Taylor',
    '3128',
    'C'
);

INSERT INTO SECTION VALUES (
    'CS-347',
    '1',
    'Fall',
    '2017',
    'Taylor',
    '3128',
    'A'
);

INSERT INTO SECTION VALUES (
    'EE-181',
    '1',
    'Spring',
    '2017',
    'Taylor',
    '3128',
    'C'
);

INSERT INTO SECTION VALUES (
    'FIN-201',
    '1',
    'Spring',
    '2018',
    'Packard',
    '101',
    'B'
);

INSERT INTO SECTION VALUES (
    'HIS-351',
    '1',
    'Spring',
    '2018',
    'Painter',
    '514',
    'C'
);

INSERT INTO SECTION VALUES (
    'MU-199',
    '1',
    'Spring',
    '2018',
    'Packard',
    '101',
    'D'
);

INSERT INTO SECTION VALUES (
    'PHY-101',
    '1',
    'Fall',
    '2017',
    'Watson',
    '100',
    'A'
);

INSERT INTO TEACHES VALUES (
    '10101',
    'CS-101',
    '1',
    'Fall',
    '2017'
);

INSERT INTO TEACHES VALUES (
    '10101',
    'CS-315',
    '1',
    'Spring',
    '2018'
);

INSERT INTO TEACHES VALUES (
    '10101',
    'CS-347',
    '1',
    'Fall',
    '2017'
);

INSERT INTO TEACHES VALUES (
    '12121',
    'FIN-201',
    '1',
    'Spring',
    '2018'
);

INSERT INTO TEACHES VALUES (
    '15151',
    'MU-199',
    '1',
    'Spring',
    '2018'
);

INSERT INTO TEACHES VALUES (
    '22222',
    'PHY-101',
    '1',
    'Fall',
    '2017'
);

INSERT INTO TEACHES VALUES (
    '32343',
    'HIS-351',
    '1',
    'Spring',
    '2018'
);

INSERT INTO TEACHES VALUES (
    '45565',
    'CS-101',
    '1',
    'Spring',
    '2018'
);

INSERT INTO TEACHES VALUES (
    '45565',
    'CS-319',
    '1',
    'Spring',
    '2018'
);

INSERT INTO TEACHES VALUES (
    '76766',
    'BIO-101',
    '1',
    'Summer',
    '2017'
);

INSERT INTO TEACHES VALUES (
    '76766',
    'BIO-301',
    '1',
    'Summer',
    '2018'
);

INSERT INTO TEACHES VALUES (
    '83821',
    'CS-190',
    '1',
    'Spring',
    '2017'
);

INSERT INTO TEACHES VALUES (
    '83821',
    'CS-190',
    '2',
    'Spring',
    '2017'
);

INSERT INTO TEACHES VALUES (
    '83821',
    'CS-319',
    '2',
    'Spring',
    '2018'
);

INSERT INTO TEACHES VALUES (
    '98345',
    'EE-181',
    '1',
    'Spring',
    '2017'
);

INSERT INTO STUDENT VALUES (
    '00128',
    'Zhang',
    'Comp. Sci.',
    '102'
);

INSERT INTO STUDENT VALUES (
    '12345',
    'Shankar',
    'Comp. Sci.',
    '32'
);

INSERT INTO STUDENT VALUES (
    '19991',
    'Brandt',
    'History',
    '80'
);

INSERT INTO STUDENT VALUES (
    '23121',
    'Chavez',
    'Finance',
    '110'
);

INSERT INTO STUDENT VALUES (
    '44553',
    'Peltier',
    'Physics',
    '56'
);

INSERT INTO STUDENT VALUES (
    '45678',
    'Levy',
    'Physics',
    '46'
);

INSERT INTO STUDENT VALUES (
    '54321',
    'Williams',
    'Comp. Sci.',
    '54'
);

INSERT INTO STUDENT VALUES (
    '55739',
    'Sanchez',
    'Music',
    '38'
);

INSERT INTO STUDENT VALUES (
    '70557',
    'Snow',
    'Physics',
    '0'
);

INSERT INTO STUDENT VALUES (
    '76543',
    'Brown',
    'Comp. Sci.',
    '58'
);

INSERT INTO STUDENT VALUES (
    '76653',
    'Aoi',
    'Elec. Eng.',
    '60'
);

INSERT INTO STUDENT VALUES (
    '98765',
    'Bourikas',
    'Elec. Eng.',
    '98'
);

INSERT INTO STUDENT VALUES (
    '98988',
    'Tanaka',
    'Biology',
    '120'
);

INSERT INTO TAKES VALUES (
    '00128',
    'CS-101',
    '1',
    'Fall',
    '2017',
    'A'
);

INSERT INTO TAKES VALUES (
    '00128',
    'CS-347',
    '1',
    'Fall',
    '2017',
    'A-'
);

INSERT INTO TAKES VALUES (
    '12345',
    'CS-101',
    '1',
    'Fall',
    '2017',
    'C'
);

INSERT INTO TAKES VALUES (
    '12345',
    'CS-190',
    '2',
    'Spring',
    '2017',
    'A'
);

INSERT INTO TAKES VALUES (
    '12345',
    'CS-315',
    '1',
    'Spring',
    '2018',
    'A'
);

INSERT INTO TAKES VALUES (
    '12345',
    'CS-347',
    '1',
    'Fall',
    '2017',
    'A'
);

INSERT INTO TAKES VALUES (
    '19991',
    'HIS-351',
    '1',
    'Spring',
    '2018',
    'B'
);

INSERT INTO TAKES VALUES (
    '23121',
    'FIN-201',
    '1',
    'Spring',
    '2018',
    'C+'
);

INSERT INTO TAKES VALUES (
    '44553',
    'PHY-101',
    '1',
    'Fall',
    '2017',
    'B-'
);

INSERT INTO TAKES VALUES (
    '45678',
    'CS-101',
    '1',
    'Fall',
    '2017',
    'F'
);

INSERT INTO TAKES VALUES (
    '45678',
    'CS-101',
    '1',
    'Spring',
    '2018',
    'B+'
);

INSERT INTO TAKES VALUES (
    '45678',
    'CS-319',
    '1',
    'Spring',
    '2018',
    'B'
);

INSERT INTO TAKES VALUES (
    '54321',
    'CS-101',
    '1',
    'Fall',
    '2017',
    'A-'
);

INSERT INTO TAKES VALUES (
    '54321',
    'CS-190',
    '2',
    'Spring',
    '2017',
    'B+'
);

INSERT INTO TAKES VALUES (
    '55739',
    'MU-199',
    '1',
    'Spring',
    '2018',
    'A-'
);

INSERT INTO TAKES VALUES (
    '76543',
    'CS-101',
    '1',
    'Fall',
    '2017',
    'A'
);

INSERT INTO TAKES VALUES (
    '76543',
    'CS-319',
    '2',
    'Spring',
    '2018',
    'A'
);

INSERT INTO TAKES VALUES (
    '76653',
    'EE-181',
    '1',
    'Spring',
    '2017',
    'C'
);

INSERT INTO TAKES VALUES (
    '98765',
    'CS-101',
    '1',
    'Fall',
    '2017',
    'C-'
);

INSERT INTO TAKES VALUES (
    '98765',
    'CS-315',
    '1',
    'Spring',
    '2018',
    'B'
);

INSERT INTO TAKES VALUES (
    '98988',
    'BIO-101',
    '1',
    'Summer',
    '2017',
    'A'
);

INSERT INTO TAKES VALUES (
    '98988',
    'BIO-301',
    '1',
    'Summer',
    '2018',
    NULL
);

INSERT INTO ADVISOR VALUES (
    '00128',
    '45565'
);

INSERT INTO ADVISOR VALUES (
    '12345',
    '10101'
);

INSERT INTO ADVISOR VALUES (
    '23121',
    '76543'
);

INSERT INTO ADVISOR VALUES (
    '44553',
    '22222'
);

INSERT INTO ADVISOR VALUES (
    '45678',
    '22222'
);

INSERT INTO ADVISOR VALUES (
    '76543',
    '45565'
);

INSERT INTO ADVISOR VALUES (
    '76653',
    '98345'
);

INSERT INTO ADVISOR VALUES (
    '98765',
    '98345'
);

INSERT INTO ADVISOR VALUES (
    '98988',
    '76766'
);

INSERT INTO TIME_SLOT VALUES (
    'A',
    'M',
    '8',
    '0',
    '8',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'A',
    'W',
    '8',
    '0',
    '8',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'A',
    'F',
    '8',
    '0',
    '8',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'B',
    'M',
    '9',
    '0',
    '9',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'B',
    'W',
    '9',
    '0',
    '9',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'B',
    'F',
    '9',
    '0',
    '9',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'C',
    'M',
    '11',
    '0',
    '11',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'C',
    'W',
    '11',
    '0',
    '11',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'C',
    'F',
    '11',
    '0',
    '11',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'D',
    'M',
    '13',
    '0',
    '13',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'D',
    'W',
    '13',
    '0',
    '13',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'D',
    'F',
    '13',
    '0',
    '13',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'E',
    'T',
    '10',
    '30',
    '11',
    '45 '
);

INSERT INTO TIME_SLOT VALUES (
    'E',
    'R',
    '10',
    '30',
    '11',
    '45 '
);

INSERT INTO TIME_SLOT VALUES (
    'F',
    'T',
    '14',
    '30',
    '15',
    '45 '
);

INSERT INTO TIME_SLOT VALUES (
    'F',
    'R',
    '14',
    '30',
    '15',
    '45 '
);

INSERT INTO TIME_SLOT VALUES (
    'G',
    'M',
    '16',
    '0',
    '16',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'G',
    'W',
    '16',
    '0',
    '16',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'G',
    'F',
    '16',
    '0',
    '16',
    '50'
);

INSERT INTO TIME_SLOT VALUES (
    'H',
    'W',
    '10',
    '0',
    '12',
    '30'
);

INSERT INTO PREREQ VALUES (
    'BIO-301',
    'BIO-101'
);

INSERT INTO PREREQ VALUES (
    'BIO-399',
    'BIO-101'
);

INSERT INTO PREREQ VALUES (
    'CS-190',
    'CS-101'
);

INSERT INTO PREREQ VALUES (
    'CS-315',
    'CS-101'
);

INSERT INTO PREREQ VALUES (
    'CS-319',
    'CS-101'
);

INSERT INTO PREREQ VALUES (
    'CS-347',
    'CS-101'
);

INSERT INTO PREREQ VALUES (
    'EE-181',
    'PHY-101'
);