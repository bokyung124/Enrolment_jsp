<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="style.css?after" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>교수 정보 수정</title>
</head>
<body class="loginDiv">
	<%@ include file="user.jsp"%>
	<%@ include file="top_prof.jsp"%>
	<br>
	<center>
		<div id="updateProfMessage"></div>
	</center>
	<br>
	<br>
	<br>
	<table width="70%" align="center" bgcolor='#EEEFF1' border>
		<form method="post" action="update_verify_prof.jsp">
			<tr height='50px'>
				<td><div>
						<b>아이디</b>
					</div></td>
				<td><div name="userID"><%=session_id%></div></td>
			</tr>
			<tr height='50px'>
				<td><div>
						<b>패스워드</b>
					</div></td>
				<td><div>
						<input type="text" name="userPassword" class="editable">
					</div></td>
			</tr>
			<tr height='50px'>
				<td><div>
						<b>이름</b>
					</div></td>
				<td><div name="userName"></div></td>
			</tr>
			<tr height='50px'>
				<td><div>
						<b>전공</b>
					</div></td>
				<td><div name="userMajor"></div></td>
			</tr>
			<tr height='50px'>
				<td><div>
						<b>연구실</b>
					</div></td>
				<td><div>
						<input type="text" name="userLoc" class="editable">
					</div></td>
			</tr>
			<tr height='50px'>
				<td><div>
						<b>전화번호</b>
					</div></td>
				<td><div>
						<input type="text" name="userPhone" class="editable">
					</div></td>
			</tr>
			<tr height='20px'>
				<td colspan=2><div align="center">
						<input type="SUBMIT" name="Submit" value="수정">
					</div></td>
			</tr>
		</form>
		<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
		else {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "leebk";
			String password = "1124";
			Connection myConn = null;
			Statement stmt = null;
			try {
				Class.forName(driver);
				myConn = DriverManager.getConnection(url, user, password);
				myConn.setAutoCommit(false);
				stmt = myConn.createStatement();
			} catch (ClassNotFoundException e) {
				System.out.println("jdbc driver 로딩 실패");
			} catch (SQLException e) {
				System.out.println("오라클 연결 실패");
			}
			String mySQL = "select p_pwd, p_name, p_major, p_loc, p_phone from professor where p_id=" + session_id + "";
			ResultSet rs = stmt.executeQuery(mySQL);
			if (rs.next()) {
				String pwd = rs.getString("p_pwd");
				String name = rs.getString("p_name");
				String major = rs.getString("p_major");
				String phone = rs.getString("p_phone");
				String loc = rs.getString("p_loc");
				
		%>
		<script>
		      document.getElementsByName("userPassword")[0].value = '<%=pwd%>';
		      document.getElementsByName("userName")[0].innerHTML = "<%=name%>";
		      document.getElementsByName("userMajor")[0].innerHTML = "<%=major%>";
		      document.getElementsByName("userPhone")[0].value = '<%=phone%>';
		      document.getElementsByName("userLoc")[0].value = '<%=loc%>';
		     </script>
		<%}
   else{
   }
}%>
	</table>
</body>
</html>