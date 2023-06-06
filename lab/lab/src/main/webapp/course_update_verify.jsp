<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 정보 수정</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "leebk";
	String password = "1124";
	Connection myConn = null;
	PreparedStatement stmt = null;


try{
	   Class.forName(driver);
	   myConn = DriverManager.getConnection(url, user, password);
	   myConn.setAutoCommit(false);

	}catch(ClassNotFoundException e){
	   System.out.println("jdbc driver 로딩 실패");
	}catch(SQLException e){
	   System.out.println("오라클 연결 실패");
	}

 	String session_id = (String)session.getAttribute("user"); 
 	
	String tid = request.getParameter("teachId");
	int teachTime = Integer.parseInt(request.getParameter("teachTime"));
	String teachLoc = request.getParameter("teachLoc");
	int teachMax = Integer.parseInt(request.getParameter("teachMax"));

	String mySQL = "update teach set t_time = " + teachTime + ", t_loc = '" + teachLoc + "', t_max = " + teachMax 
					+ " where t_id = '" + tid + "'";
	
	System.out.println(tid);
	System.out.println(teachMax);

	try{
		stmt = myConn.prepareStatement(mySQL);
		System.out.println("연결완료");
		/* cstmt.execute(); */
	    stmt.executeUpdate(mySQL); %>
	    <script>alert('수정 완료');</script>
	   <% myConn.commit();%>
		<script>location.href = 'course_update.jsp';</script>
	<%}catch(SQLException ex){
		String sMessage;
		/* if(ex.getErrorCode() == 20006)   sMessage = "암호는 4자리 이상이어야 합니다";
		else if(ex.getErrorCode() == 20007)   sMessage = "암호에 공란은 입력되지 않습니다.";
		else if(ex.getErrorCode() == 20008)   sMessage = "전화번호 형식이 맞지 않습니다. 하이픈 형식으로 넣어주세요.";
		else */ 
		sMessage = Integer.toString(ex.getErrorCode());
		%><script>alert('<%=sMessage%>');
		location.href = 'course_update.jsp';</script>
	<%}%>
</body>
</html>