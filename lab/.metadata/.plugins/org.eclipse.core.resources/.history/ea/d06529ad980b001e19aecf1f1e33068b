<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>수강신청 삭제</title>
</head>
<body>

	<%
	String s_id = (String) session.getAttribute("user");
	String t_id = request.getParameter("t_id");
	%>
	<%
	Connection myConn = null;
	ResultSet result = null;
	PreparedStatement pstmt = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "leebk";
	String passwd = "1124";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";

	try {
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
	} catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
	try {
		String sql = "select t_id from enroll where t_id = ?";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setString(1, t_id);
		result = pstmt.executeQuery();

		if (result.next()) {
			String id = result.getString("t_id");

			if (t_id.equals(id)) {
		sql = "delete from enroll where t_id = ?";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setString(1, t_id);
		pstmt.executeUpdate();
	%>
	<script>
		alert("해당 과목 수강신청을 취소하였습니다.");
		location.href = "delete.jsp";
	</script>

	<%
	} else {
	%>
	<script>
		alert("수강신청 취소 오류.");
		location.href = "delete.jsp";
	</script>

	<%
	}
	} else {
	%>
	<script>
		alert("수강신청 취소 오류.");
		location.href = "delete.jsp";
	</script>

	<%
	}

	} catch (SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
	} finally {
	if (result != null)
	try {
		myConn.commit();
		pstmt.close();
		myConn.close();
	} catch (SQLException ex) {
	}
	}
	%>
</body>
</html>