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
	String c_id = request.getParameter("c_id");
	int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
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
	System.out.println(c_id);
	String sql = "select c_id, c_id_no from teach where c_id = ?";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setString(1, c_id);
		result = pstmt.executeQuery();

		if (result.next()) {
			String id = result.getString("c_id");
			String id_no = result.getString("c_id_no");

	System.out.println(s_id + ", " + id + ", " + id_no + ");");
				
		sql = "insert into heart values('"+ s_id + "', '" + id + "', " + id_no + ");";
		
		System.out.println(sql);
		pstmt = myConn.prepareStatement(sql);
		}
	%>
	<script>
		alert("장바구니에 담았습니다.");
		location.href = "insert.jsp";
	</script>
</body>
</html>