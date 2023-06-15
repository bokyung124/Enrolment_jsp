CREATE OR REPLACE TRIGGER BeforeUpdateCourse
BEFORE
	UPDATE ON teach
	FOR EACH ROW
DECLARE
	duplicate_time	 EXCEPTION;
	duplicate_loc    EXCEPTION;
	student_number	 EXCEPTION;
	nTime	NUMBER;
--	nBlank  NUMBER;
--	isEmail NUMBER;
--	isPhone NUMBER;	
BEGIN
	/*교시 중복*/
	SELECT COUNT(*)
	INTO nTime
	FROM teach
	WHERE t_time = :new.t_time and p_id = 
	
	nLength := LENGTH(:new.s_pwd); /*암호의 길이*/
	nBlank := INSTR(:new.s_pwd, ' '); /*공란*/

	IF (nLength < 4) THEN
		RAISE underflow_length;
	END IF;
	IF (nBlank > 0) THEN
		RAISE invalid_value;
	END IF;
	IF :new.s_email NOT LIKE '%@%' THEN
   		RAISE not_email_format;
   	END IF;
	IF (isPhone <= 0) THEN
		RAISE not_phone_format;
	END IF;
		
EXCEPTION
	WHEN underflow_length THEN
		RAISE_APPLICATION_ERROR(-20002, '암호 길이는 4자리 이상이어야 합니다.');
	WHEN invalid_value THEN
		RAISE_APPLICATION_ERROR(-20003, '암호에는 공란이 포함될 수 없습니다.');
	WHEN not_email_format THEN
		RAISE_APPLICATION_ERROR(-20004, '이메일 형식을 지켜주세요.');
	WHEN not_phone_format THEN
		RAISE_APPLICATION_ERROR(-20005, '전화번호에 하이픈(-) 형식을 맞춰주세요.');	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('다시 시도해주세요.');
END;
/