<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>수강신청 사용자 정보 수정</title>
</head>
	<% request.setCharacterEncoding("utf-8"); %>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "leebk";
	String password = "1124";
	Connection myConn = null;
	PreparedStatement stmt = null;
	String mySQL = null;
	
	String session_id = (String)session.getAttribute("user");
	String userPassword = request.getParameter("userPassword");
	String userEmail = request.getParameter("userEmail");
	String userAddress = request.getParameter("userAddress");
	String userPhone = request.getParameter("userPhone");
	
	mySQL = "update student set s_pwd = '" + userPassword + "', s_email= '" + userEmail + "', s_address= '" 
	+ userAddress + "', s_phone = '" + userPhone + "' where s_id = '" + session_id + "'";

	try{
		Class.forName(driver);
		myConn = DriverManager.getConnection(url, user, password);
		myConn.setAutoCommit(false);
		stmt = myConn.prepareStatement(mySQL);
		/* cstmt.execute(); */
	    stmt.executeUpdate(); %>
		<script>alert('수정 완료');</script>
		<%myConn.commit();%>
		<script>location.href = 'update.jsp';</script>
	<%}catch(SQLException ex){
	String sMessage;
	if(ex.getErrorCode() == 20002)   sMessage = "암호는 4자리 이상이어야 합니다";
	else if(ex.getErrorCode() == 20003)   sMessage = "암호에 공란은 입력되지 않습니다.";
	else if(ex.getErrorCode() == 20004)   sMessage = "이메일 형식이 맞지 않습니다.";
	else if(ex.getErrorCode() == 20005)   sMessage = "전화번 형식이 맞지 않습니다. 하이픈 형식으로 넣어주세요.";
	else sMessage = Integer.toString(ex.getErrorCode());
	%><script>alert('<%=sMessage%>'); location.href = 'update.jsp';</script>

	<%} finally{
		if(stmt!=null)try{stmt.close();}catch(SQLException sqle){}
		if(myConn !=null )try{myConn.close();}catch(SQLException sqle){}	
}%>
</body>
</html>