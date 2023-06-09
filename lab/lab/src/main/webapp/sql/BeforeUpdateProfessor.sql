CREATE OR REPLACE TRIGGER BeforeUpdateProfessor 
BEFORE
	UPDATE ON professor
	FOR EACH ROW
DECLARE
	underflow_length 	EXCEPTION;
	invalid_value    	EXCEPTION;
	not_phone_format	EXCEPTION;
	nLength NUMBER;
	nBlank  NUMBER;
	isPhone	NUMBER;
BEGIN
	/*폰번호형식*/
	SELECT COUNT(*)
	INTO isPhone
	FROM DUAL
	WHERE REGEXP_LIKE(:new.p_phone, '\d{2,3}-\d{3,4}-\d{4}');
	
	nLength := LENGTH(:new.p_pwd); /*암호의 길이*/
	nBlank := INSTR(:new.p_pwd, ' '); /*공란*/

	IF (nLength < 4) THEN
		RAISE underflow_length;
	END IF;
	IF (nBlank > 0) THEN
		RAISE invalid_value;
	END IF;
	IF (isPhone <= 0) THEN
		RAISE not_phone_format;
	END IF;
		
EXCEPTION
	WHEN underflow_length THEN
		RAISE_APPLICATION_ERROR(-20006, '암호 길이는 4자리 이상이어야 합니다.');
	WHEN invalid_value THEN
		RAISE_APPLICATION_ERROR(-20007, '암호에는 공란이 포함될 수 없습니다.');
	WHEN not_phone_format THEN
		RAISE_APPLICATION_ERROR(-20008, '전화번호에 하이픈(-) 형식을 맞춰주세요.');	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('다시 시도해주세요.');
END;
/