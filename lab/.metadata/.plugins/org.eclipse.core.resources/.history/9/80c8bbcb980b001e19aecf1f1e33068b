<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<title>개별수강 이력</title>
</head>
<body>
	<%@include file="user.jsp"%>
	<%@ include file="top.jsp"%>
	<%
	if (session_id == null)
		response.sendRedirect("login.jsp");
	%>

	<%
	Connection myConn = null;
	Statement stmt = null;
	ResultSet myResultSet = null;
	String mySQL = "";
	int totalnum = 0;
	int totalnum2 = 0;

	PreparedStatement pstmt = null;
	int nYear = 0;
	int nSemester = 0;
	int year = 0;
	int semester = 0;

	String _param = request.getParameter("searchYear");
	String _param2 = request.getParameter("searchSem");

	String dbdriver = "oracle.jdbc.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "leebk";
	String passwd = "1124";

	try {
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
		stmt = myConn.createStatement();

		CallableStatement cstmt = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
		cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt.execute();
		nYear = cstmt.getInt(1) - 2000;

		CallableStatement cstmt2 = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
		cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt2.execute();
		nSemester = cstmt2.getInt(1);
	%>
	<script>document.getElementById('enrollS').innerHTML = "<%=nYear%>년  <%=nSemester%>
		학기";
	</script>
	<%
	} catch (SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
	}
	%>
	<br>
	<br>
	<br>
	<div>
		<input type="text" id="enrollS" align="center"
			style="font-weight: bold;" value="<%=nYear%>년 <%=nSemester%>학기"
			readonly></input>
	</div>
	<br>
	<br>

	<table align="center">
		<br>
		<td></td>
		<td>학년도</td>
		<td></td>
		<td></td>
		<td></td>

		<form action="./history.jsp">
			<div id="SearchField">
				<td><input type="text" class="form-control"
					placeholder="학년도 (yy)" name="searchYear" maxlength="30"></td>

				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>학기</td>
				<td></td>
				<td></td>
				<td></td>

				<td><input type="text" class="form-control"
					placeholder="학기 (s)" name="searchSem" maxlength="30"></td>
				<td><button type="submit" id="search" class="searchButton">검색</button></td>
			</div>
		</form>

	</table>

	<table width="70%" align="center" class="deleteTable" border>
		<br>
		<tr>
			<th>수업번호</th>
			<th>과목명</th>
			<th>교수명</th>
			<th>학년도</th>
			<th>학기</th>
			<th>학점</th>
		</tr>



		<%
		mySQL = "select e.e_id, e.c_id, c.c_name, e.e_year, e.e_semester, h.h_score, p.p_name FROM history h, course c, enroll e, professor p, teach t"
				+ " where h.e_id = e.e_id and e.c_id = c.c_id and e.c_id_no = c.c_id_no and e.t_id = t.t_id and t.p_id = p.p_id and e.s_id = '"
				+ session_id + "'";
		if (_param != null) {
			mySQL += " AND e.e_year LIKE '%" + _param + "%'";
		}
		if (_param2 != null) {
			mySQL += " AND e.e_semester LIKE '%" + _param2 + "%'";
		}

		myResultSet = stmt.executeQuery(mySQL);

		if (myResultSet != null) {
			while (myResultSet.next()) {
				String c_id = myResultSet.getString("c_id");
				String c_name = myResultSet.getString("c_name");
				String p_name = myResultSet.getString("p_name");
				int e_year = myResultSet.getInt("e_year");
				int e_semester = myResultSet.getInt("e_semester");
				String h_score = myResultSet.getString("h_score");
		%>
		<tr>
			<td><%=c_id%></td>
			<td><%=c_name%></td>
			<td><%=p_name%></td>
			<td><%=e_year%></td>
			<td><%=e_semester%></td>
			<td><%=h_score%></td>

		</tr>
		<%
		}
		CallableStatement cstmt = myConn.prepareCall("{call MajorCount(?,?,?)}");
		cstmt.setString(1, session_id);
		cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
		cstmt.registerOutParameter(3, java.sql.Types.INTEGER);

		try {
		cstmt.execute();
		totalnum = cstmt.getInt(2);
		totalnum2 = cstmt.getInt(3);

		} catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
		}
		}
		stmt.close();
		myConn.close();
		%>
	</table>
	<br>
	<br>

	<div id="CountInfo" align="center" style="font-weight: bold;">
		총 이수 학점 :
		<%=totalnum + totalnum2%>학점<br> <br> 전공 :
		<%=totalnum%>학점 &nbsp;&nbsp; / &nbsp;&nbsp; 교양 :
		<%=totalnum2%>학점 &nbsp;&nbsp;&nbsp;
	</div>

</body>
</html>

