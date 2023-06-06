<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<title>수강신청 삭제</title>
</head>
<body>
<%@include file="user.jsp"%>
	<%@ include file="top.jsp"%>
	<%
	if (session_id == null)
		response.sendRedirect("login.jsp");
	%>
	<br>
	<br>
	<br>
	<table width="70%" align="center" class = "deleteTable" border >
		<br>
		<tr>
			<th>과목번호</th>
			<th>분반</th>
			<th>과목명</th>
			<th>시간</th>
			<th>교수</th>
			<th>수강인원</th>
			<th>수강정원</th>
			<th>수강취소</th>
		</tr>
		<%
		Connection myConn = null;
		Statement stmt = null;
		ResultSet myResultSet = null;
		ResultSet enrollSet = null;
		
		PreparedStatement pstmt = null;
		int nYear = 0;
		int nSemester = 0;
	
		int nTotalCourse = 0;
		int nTotalUnit = 0;
		
		PreparedStatement pstmt2 = null;
		int nEnrollStudent = 0;
		
		String mySQL = "";
		String nSQL = "";
		String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "leebk";
		String passwd = "1124";
		String dbdriver = "oracle.jdbc.driver.OracleDriver";

		try {
			Class.forName(dbdriver);
			myConn = DriverManager.getConnection(dburl, user, passwd);
			myConn.setAutoCommit(false);
			stmt = myConn.createStatement();
			
			CallableStatement cstmt = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.execute();
			nYear = cstmt.getInt(1)-2000;
			
			CallableStatement cstmt2 = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
			cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt2.execute();
			nSemester = cstmt2.getInt(1);
			%>
			<script>document.getElementById('enrollS').innerHTML = "<%=nYear%>년  <%=nSemester%>학기";</script>
			<%
			System.out.println(nYear+"/"+nSemester);
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
		}
		
		%>

		<div>
			<input type="text" id="enrollS" align="center" style="font-weight: bold;"
				value="<%= nYear %>년 <%= nSemester %>학기" readonly></input>
		</div>
	
		<br>
		<br>


	<%
		mySQL = "select distinct e.t_id, c.c_id, c.c_id_no, c.c_name, t.t_time, t.t_max, p.p_name from enroll e, course c, teach t, professor p where e.s_id='"
				+ session_id
				+ "' and e.t_id = t.t_id and t.c_id = c.c_id and t.c_id_no = c.c_id_no and t.p_id = p.p_id and e.e_year = ? and e.e_semester = ? ";
		
		pstmt = myConn.prepareStatement(mySQL);
		pstmt.setInt(1, nYear);
		pstmt.setInt(2, nSemester);
  		myResultSet = pstmt.executeQuery();
		

		if (myResultSet != null) {
			while (myResultSet.next()) {
				String t_id = myResultSet.getString("t_id");
				String c_id = myResultSet.getString("c_id");
				Integer c_id_no = myResultSet.getInt("c_id_no");
				String c_name = myResultSet.getString("c_name");
				Integer t_time = myResultSet.getInt("t_time");
				Integer t_max = myResultSet.getInt("t_max");
				String p_name = myResultSet.getString("p_name");
				
				nSQL = "select COUNT(*) cnt from enroll where t_id = '" + t_id + "' and e_year = ? and e_semester = ?";
				pstmt2 = myConn.prepareStatement(nSQL);
				pstmt2.setInt(1, nYear);
				pstmt2.setInt(2, nSemester);
				enrollSet = pstmt2.executeQuery();
				
				if (enrollSet != null) {
					while (enrollSet.next()) {
						nEnrollStudent = enrollSet.getInt("cnt");
					}
				}
		%>

		<tr>
			<td><%=c_id%></td>
			<td><%=c_id_no%></td>
			<td><%=c_name%></td>
			<td><%=t_time%></td>
			<td><%=p_name%></td>
			<td><%=nEnrollStudent%></td>
			<td><%=t_max%></td>
			<td><a id="Wcolor"
				href="delete_verify.jsp?t_id=<%=t_id%>">
					취소 </a></td>
		</tr>
		<%
		CallableStatement cstmt3 = myConn.prepareCall("{call CountSelected(?, ?, ?, ?, ?)}");
		
		cstmt3.setString(1, session_id);
		cstmt3.setInt(2, nYear);
		cstmt3.setInt(3, nSemester);
		
		cstmt3.registerOutParameter(4, java.sql.Types.INTEGER);
		cstmt3.registerOutParameter(5, java.sql.Types.INTEGER);
		
		cstmt3.execute();
		nTotalUnit = cstmt3.getInt(4);
		nTotalCourse = cstmt3.getInt(5);

} 
} 
stmt.close(); myConn.close();
%>
	</table>
	
	<br>
	<br>
    <br>

	<div id="CountInfo" align="center" style="font-weight: bold;">
        수강신청한 강의 수 : <%=nTotalCourse%>개 &nbsp;&nbsp;&nbsp; 누적 학점 수 : <%=nTotalUnit%>학점 / 18학점
    </div>
    
    <br>
    <br>
    
</body>
</html>