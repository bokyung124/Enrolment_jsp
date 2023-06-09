CREATE OR REPLACE FUNCTION Date2EnrollYear(dDate IN DATE)
RETURN NUMBER
IS
	nYear NUMBER;
	sMonth CHAR(2);

BEGIN
	SELECT TO_NUMBER(TO_CHAR(dDate, 'YYYY')), 
		TO_CHAR(dDate, 'MM')
	INTO nYear, sMonth
	FROM DUAL;

	IF (sMonth='11' or sMonth='12') THEN
		nYear := nYear + 1;
	END IF;
	
	RETURN nYear;
END;
/


CREATE OR REPLACE FUNCTION Date2EnrollSemester(dDate IN DATE)
RETURN NUMBER
IS
	nSemester NUMBER;
	sMonth CHAR(2);

BEGIN
	SELECT TO_CHAR(dDate, 'MM')
	INTO sMonth
	FROM DUAL;

	IF (sMonth='11' or sMonth='12' or (sMonth >= '01'  and sMonth <= '04')) THEN
		nSemester := 1;
	ELSE
		nSemester := 2;
	END IF;

	RETURN nSemester;

END;
/


CREATE OR REPLACE FUNCTION Date2Enroll(dDate IN DATE)
RETURN NUMBER
IS
   month NUMBER;
   year NUMBER;
   semester NUMBER;
BEGIN
   month := TO_NUMBER(TO_CHAR(dDate, 'MM'));
   IF(month = 11 or month = 12) THEN
      year := (TO_NUMBER(TO_CHAR(dDate, 'YYYY')) + 1);
      semester := 1;
   ELSIF (month >= 5 and month <= 10) THEN
      year := TO_NUMBER(TO_CHAR(dDate, 'YYYY'));
      semester := 2;
   ELSE
      year := TO_NUMBER(TO_CHAR(dDate, 'YYYY'));
      semester := 1;
   END IF;
   RETURN year*10 + semester;
END;
/
