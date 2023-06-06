<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="style.css?after" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
	<%@ include file="user.jsp"%>
	<%@ include file="top.jsp"%>
	<br>
	<center>
		<div id="updateMessage"></div>
	</center>
	<br>
	<br>
	<br>
	<table width="70%" align="center" class="mypage-table"  border>
		<form method="post" action="update_verify.jsp">
			<tr height='50px'>
				<td><div>
						<b>학번</b>
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
						<b>학년</b>
					</div></td>
				<td><div name="userGrade"></div></td>
			</tr>

			<tr height='50px'>
				<td><div>
						<b>이메일</b>
					</div></td>
				<td><div>
						<input type="text" name="userEmail" class="editable">
					</div></td>
			</tr>
			<tr height='50px'>
				<td><div>
						<b>주소</b>
					</div></td>
				<td><div>
						<input type="text" name="userAddress" class="editable">
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
			<tr height='20px' >
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
			String mySQL = "select s_pwd, s_name, s_major, s_grade, s_email, s_phone, s_address from student where s_id=" + session_id + "";
			ResultSet rs = stmt.executeQuery(mySQL);
			if (rs.next()) {
				String pwd = rs.getString("s_pwd");
				String name = rs.getString("s_name");
				String major = rs.getString("s_major");
				Integer grade = rs.getInt("s_grade");
				String email = rs.getString("s_email");
				String phone = rs.getString("s_phone");
				String addr = rs.getString("s_address");
				
		%>
			<script>
		      document.getElementsByName("userPassword")[0].value = '<%=pwd%>';
		      document.getElementsByName("userName")[0].innerHTML = "<%=name%>";
		      document.getElementsByName("userMajor")[0].innerHTML = "<%=major%>";
		      document.getElementsByName("userGrade")[0].innerHTML = '<%=grade%>';
		      document.getElementsByName("userEmail")[0].value = '<%=email%>';
		      document.getElementsByName("userPhone")[0].value = '<%=phone%>';
		      document.getElementsByName("userAddress")[0].value = '<%=addr%>';
		      </script>
		<%}
   else{
   }
}%>
	</table>
</body>
</html>